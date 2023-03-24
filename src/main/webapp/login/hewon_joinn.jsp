<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>   

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


<form id="join" action="<%=request.getContextPath()%>/index.jsp?menugroup=login&menu=hewon_join_action" method="post">

<input type="hidden" id="idCheckResult" value="0">
<fieldset>
	<legend>회원가입 정보</legend>
	<ul>
		<li>
		<label for="id">아이디</label>
		<input type="text" name="h_hewonid" id="h_hewonid"><span id="idCheck">아이디 중복 검사</span>
			<div id="idRegMsg" class="error">아이디는 영문자로 시작되는 영문자,숫자,_의 6~20범위의 문자로만 작성 가능합니다.</div>
			<div id="idCheckMsg" class="error">아이디 중복 검사를 반드시 실행해 주세요.</div>
			
		</li>
		<li>
			<label for="passwd">비밀번호</label>
			<input type="password" name="h_pw" id="h_pw">
			<div id="passwdMsg" class="error">비밀번호를 입력해 주세요.</div>
			<div id="passwdRegMsg" class="error">비밀번호는 영문자,숫자,특수문자가 반드시 하나이상 포함된 6~20 범위의 문자로만 작성 가능합니다.</div>
		</li>
		<li>
			<label for="passwd">비밀번호 확인</label>
			<input type="password" name="repasswd" id="repasswd">
			<div id="repasswdMsg" class="error">비밀번호 확인을 입력해 주세요.</div>
			<div id="repasswdMatchMsg" class="error">비밀번호와 비밀번호 확인이 서로 맞지 않습니다.</div>
		</li>
		<li>
			<label for="h_name">이름</label>
			<input type="text" name="h_name" id="h_name">
			<div id="nameMsg" class="error">이름을 입력해 주세요.</div>
		</li>
		<li>
			<label for="h_email">이메일</label>
			<input type="text" name="h_email" id="h_email">
			<div id="emailMsg" class="error">이메일을 입력해 주세요.</div>
			<div id="emailRegMsg" class="error">입력한 이메일이 형식에 맞지 않습니다.</div>
		</li>
		<li>
			

			
			<li>
	<label for="h_phone">휴대폰번호</label>
		<input type="text" name="h_phone" value="" id="h_phone" >
	</li>
			

	
<li>
<label>우편번호</label>
<input type="text" name="h_zipcode" id="h_zipcode" size="7" readonly="readonly">
<span id="postSearch">우편번호 검색</span>
<div id="zipcodeMsg" class="error">우편번호를 입력해 주세요.</div>
</li>

<li>
<label for="address1">기본주소</label>
<input type="text" name="h_address1" id="h_address1" size="50" readonly="readonly">
<div id="address1Msg" class="error">기본주소를 입력해 주세요.</div>
</li>
		
<li>
<label for="address2">상세주소</label>
<input type="text" name="h_address2" id="h_address2" size="50">
<div id="address2Msg" class="error">상세주소를 입력해 주세요.</div>
</li>
</ul>
					
		
		
		
</fieldset>
<div id="fs">
	<button type="button" onclick = "location.href='<%=request.getContextPath()%>/index.jsp?menugroup=main&menu=main_page';">취소</button>
	<button type="submit">회원가입</button>
	<button type="reset">다시입력</button>
</div>
</form>


<script type="text/javascript">
$("#h_hewonid").focus();

$("#join").submit(function() {
	var submitResult=true;
	

	$(".error").css("display","none");

	

	var idReg=/^[a-zA-Z]\w{5,19}$/g;
	 if(!idReg.test($("#h_hewonid").val())) {
		$("#idRegMsg").css("display","block");
		submitResult=false;
	} else if($("#idCheckResult").val()=="0") {//아이디 중복 검사를 실행하지 않은 경우
		$("#idCheckMsg").css("display","block");
		submitResult=false;
	}
	
	
	
	var passwdReg=/^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[~!@#$%^&*_-]).{6,20}$/g;
	if($("#h_pw").val()=="") {
		$("#passwdMsg").css("display","block");
		submitResult=false;
	} else if(!passwdReg.test($("#h_pw").val())) {
		$("#passwdRegMsg").css("display","block");
		submitResult=false;
	} 
	
	if($("#repasswd").val()=="") {
		$("#repasswdMsg").css("display","block");
		submitResult=false;
	} else if($("#h_pw").val()!=$("#repasswd").val()) {
		$("#repasswdMatchMsg").css("display","block");
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

$("#idCheck").click(function() {
	$("#idMsg").css("display","none");
	$("#idRegMsg").css("display","none");
	
	var idReg=/^[a-zA-Z]\w{5,19}$/g;
	if($("#h_hewonid").val()=="") {
		$("#idMsg").css("display","block");
		return;
	} else if(!idReg.test($("#h_hewonid").val())) {
		$("#idRegMsg").css("display","block");
		return;
	}
	
	//팝업창 실행하여 아이디 중복 검사 페이지(id_check.jsp) 요청 - 아이디 전달
	window.open("<%=request.getContextPath()%>/login/id_check.jsp?h_hewonid="+$("#h_hewonid").val()
			,"idCheck","width=450,height=130,left=700,top=400");
});

$("#h_hewonid").change(function() {
	//입력태그(검사결과)의 입력값 변경 - 아이디 중복 검사 미실행으로 설정
	$("#idCheckResult").val("0");
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