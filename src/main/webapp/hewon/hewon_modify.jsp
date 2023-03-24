<%@page import="xyz.itwill.util.Utility"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="/security/login_check.jspf" %>



<%
	//비정상적인 요청에 대한 응답 처리
	if(request.getMethod().equals("GET")) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?menugroup=error&menu=error_400';");
		out.println("</script>");
		return;
	}
	//전달값을 반환받아 저장
	String passwd=Utility.encrypt(request.getParameter("mb_password"));
	
	//전달된 비밀번호가 로그인 사용자의 비밀번호와 같지 않은 경우 비밀번호 입력페이지
	//(password_confirm.jsp)로 이동
	if(!passwd.equals(loginHewon.getH_pw())) {
		session.setAttribute("message", "비밀번호가 일치하지 않습니다.");
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?menugroup=hewon&menu=password_confirm&action=modify';");
		out.println("</script>");
		return;
	}

%>   


<style type="text/css">
fieldset {
	text-align: left;
	margin: 10px auto;
	width: 1100px;
}

legend {
	font-size: 1.2em;
}

#join label {
	width: 150px;
	text-align: right;
	float: left;
	margin-right: 10px;
}

#join ul li {
	list-style-type: none;
	margin: 15px 0;
}

#fs {
	text-align: center;
}

.error {
	color: red;
	position: relative;
	left: 160px;
	display: none;
}

#idCheck, #postSearch {
	font-size: 12px;
	font-weight: bold;
	cursor: pointer;
	margin-left: 10px;
	padding: 2px 10px;
	border: 1px solid black;
}

#idCheck:hover, #postSearch:hover {
	background: aqua;
}
</style>


<form id="join" action="<%=request.getContextPath()%>/index.jsp?menugroup=hewon&menu=hewon_modify_action" method="post">
<fieldset>
	<legend>회원정보변경</legend>
	<ul>
		<li>
			<label for="id">아이디</label>
			<input type="text" name="h_hewonid" id="h_hewonid" value="<%=loginHewon.getH_hewonid()%>" readonly="readonly">
		</li>
		<li>
			<label for="passwd">비밀번호</label>
			<input type="password" name="h_pw" id="h_pw">
			<span style="color: red;">비밀번호를 변경하지 않을 경우 입력하지 마세요.</span>
			<div id="passwdRegMsg" class="error">비밀번호는 영문자,숫자,특수문자가 반드시 하나이상 포함된 6~20 범위의 문자로만 작성 가능합니다.</div>
		</li>
		<li>
			<label for="name">이름</label>
			<input type="text" name="h_name" id="h_name" value="<%=loginHewon.getH_name()%>" >
			<div id="nameMsg" class="error">이름을 입력해 주세요.</div>
		</li>
		<li>
			<label for="email">이메일</label>
			<input type="text" name="h_email" id="h_email" value="<%=loginHewon.getH_email()%>" >
			<div id="emailMsg" class="error">이메일을 입력해 주세요.</div>
			<div id="emailRegMsg" class="error">입력한 이메일이 형식에 맞지 않습니다.</div>
		</li>
		
		<li>
			<label for=phone">전화번호</label>
			<input type="text" name="h_phone" id="h_phone" value="<%=loginHewon.getH_phone()%>" >
			<div id="phoneMsg" class="error">이메일을 입력해 주세요.</div>
			<div id="phoneRegMsg" class="error">입력한 이메일이 형식에 맞지 않습니다.</div>
		</li>
		
		<li>
			<label>우편번호</label>
			<input type="text" name="h_zipcode" id="h_zipcode" size="7" value="<%=loginHewon.getH_zipcode()%>"  readonly="readonly">
			<span id="postSearch">우편번호 검색</span>
			<div id="zipcodeMsg" class="error">우편번호를 입력해 주세요.</div>
		</li>
		<li>
			<label for="address1">기본주소</label>
			<input type="text" name="h_address1" id="h_address1" size="50" value="<%=loginHewon.getH_address1()%>"  readonly="readonly">
			<div id="address1Msg" class="error">기본주소를 입력해 주세요.</div>
		</li>
		<li>
			<label for="address2">상세주소</label>
			<input type="text" name="h_address2" id="h_address2" size="50" value="<%=loginHewon.getH_address2()%>" >
			<div id="address2Msg" class="error">상세주소를 입력해 주세요.</div>
		</li>
	</ul>
</fieldset>
<div id="fs">
	<button type="submit">회원변경</button>
	<button type="reset">다시입력</button>
</div>
</form>
<script type="text/javascript">
$("#join").submit(function() {
	var submitResult=true;
	
	$(".error").css("display","none");

	var passwdReg=/^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[~!@#$%^&*_-]).{6,20}$/g;
	if($("#h_pw").val()!="" && !passwdReg.test($("#h_pw").val())) {
		$("#passwdRegMsg").css("display","block");
		submitResult=false;
	} 

	if($("#h_name").val()=="") {
		$("#nameMsg").css("display","block");
		submitResult=false;
	}
	
	var emailReg=/^([a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+(\.[-a-zA-Z0-9]+)+)*$/g;
	if($("#h_email").val()=="") {
		$("#emailMsg").css("display","block");
		submitResult=false;
	} else if(!emailReg.test($("#h_email").val())) {
		$("#emailRegMsg").css("display","block");
		submitResult=false;
	}

	
	if($("#h_zipcode").val()=="") {
		$("#zipcodeMsg").css("display","block");
		submitResult=false;
	}
	
	if($("#h_address1").val()=="") {
		$("#address1Msg").css("display","block");
		submitResult=false;
	}
	
	if($("#h_address2").val()=="") {
		$("#address2Msg").css("display","block");
		submitResult=false;
	}
	
	return submitResult;
});
</script>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
$("#postSearch").click(function() {
	new daum.Postcode({
	    oncomplete: function(data) {
	        $("#h_zipcode").val(data.zonecode);
	        $("#h_address1").val(data.address);
	    }
	}).open();
});
</script>