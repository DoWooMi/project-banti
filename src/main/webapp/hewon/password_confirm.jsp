<%@page import="xyz.itwill.util.Utility"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/security/login_check.jspf" %> 

<style type="text/css">
#mb_confirm h1 {
    margin: 0px 0 0px;
    font-size: 2em;
    text-indent: -999999px;
}
h1 {
    margin: 0;
    padding: 0;
    font-size: 13px;
    color: #333;
    line-height: 1.6em;
    font-family: 'Noto Sans KR', sans-serif;
    font-weight: 400;
    letter-spacing: -0.02em;
    border-top: 1px solid #e9e9e9;
}
#mb_confirm p strong {
    display: block;
    color: #3ca1ff;
    font-size: 1.167em;
    margin: 0 0 5px;
}
strong {
    font-weight: bold;
}
#mb_confirm p {
    padding: 0 20px 40px;
    padding-top: 0px;
    padding-right: 20px;
    padding-bottom: 40px;
    padding-left: 20px;
    border-bottom : 1px solid #e9e9e9;
    font-size: 1.083em;
    line-height: 1.4em;
    color: #656565;
}
p {
    margin: 0;
    padding: 0;
    word-break: break-all;
    letter-spacing: -0.02em;
}
.mbskin {
    position: relative;
    margin: 50px auto 0;
    width: 360px;
    text-align: center;
}
p {
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
}
#mb_confirm fieldset {
    padding: 50px;
    text-align: left;
}
html, h1, h2, h3, h4, h5, h6, form, fieldset, img {
    margin: 0;
    padding: 0;
    border: 0;
}
*, :after, :before {
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}
fieldset {
    display: block;
    margin-inline-start: 2px;
    margin-inline-end: 2px;
    padding-block-start: 0.35em;
    padding-inline-start: 0.75em;
    padding-inline-end: 0.75em;
    padding-block-end: 0.625em;
    min-inline-size: min-content;
    border-width: 2px;
    border: 1px solid #e9e9e9;
    border-image: initial;
}
div {
    margin: 0;
    padding: 0;
    font-size: 13px;
    color: #333;
    line-height: 1.6em;
    font-family: 'Noto Sans KR', sans-serif;
    font-weight: 400;
    letter-spacing: -0.02em;
}
#mb_confirm_id {
    display: block;
    margin: 5px 0 10px;
    font-weight: bold;
}
.mbskin .frm_input {
    width: 100%;
}
[class~=frm_input] {
    height: 40px;
}
[class~=frm_input] {
    -webkit-box-shadow: none;
    -moz-box-shadow: none;
    box-shadow: none;
    border: 1px solid #ccc !important;
    outline: none;
}
.required, textarea.required {
    background-image: url(../img/require.png) !important;
    background-repeat: no-repeat !important;
    background-position: right top !important;
}
.mbskin fieldset .btn_submit {
    background-color: #333;
}
.mbskin .btn_submit {
    width: 100%;
    margin: 10px 0 0;
    height: 45px;
    font-weight: bold;
    font-size: 1.25em;
}
.mbskin .btn_submit {
}
[class~=btn_submit] {
    background: #222;
    border: 1px solid #222;
}
.btn_submit {
    border: 1px solid #1c70e9;
    background: #3a8afd;
    color: #fff;
    cursor: pointer;
    border-radius: 3px;
}

input {
    outline: none !important;
    outline-style: none !important;
}
#confirm_border {
	border: 1px solid gray;
}

</style>


  
<%
	//전달값이 없을 경우 비정상적인 요청 (비정상적인 요청에 대한 응답 처리)
	if(request.getParameter("action")==null) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=error&work=error_400';");
		out.println("</script>");
		return;
	}



	//전달값(action값)을 반환받아 저장
	String action=request.getParameter("action");
	
	//회원정보수정과 회원탈퇴가 아닐 경우 비정상적인 요청(비정상적인 요청에 대한 응답 처리)
	if(!action.equals("modify") && !action.equals("remove")) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=error&work=error_400';");
		out.println("</script>");
		return;
	}
	
	
	String message=(String)session.getAttribute("message");
	if(message==null) {
		message="";
	} else {
		session.removeAttribute("message");
	}
%>





<div id="mb_confirm" class="mbskin">
    <h1>회원 비밀번호 확인</h1>
    <p><strong>비밀번호를 한번 더 입력해주세요.</strong>
	<% if(action.equals("modify")) { //회원정보수정일 경우 %>
     회원님의 정보를 안전하게 변경하기 위해<br>
     비밀번호를 한번 더 확인합니다.
	<% } else {  %>	
    비밀번호를 입력하시면 회원탈퇴가 완료됩니다.</p>
	<% } %>

    <form name="fmemberconfirm" method="post">
    <input type="hidden" name="mb_id" value=<%=loginHewon.getH_hewonid() %>>
    <input type="hidden" name="w" value=<%=loginHewon.getH_name() %>>

    <fieldset>
        <span class="confirm_id">회원아이디</span>
        <span id="mb_confirm_id"><%=loginHewon.getH_hewonid() %></span>
        <input type="password" name="mb_password" id="confirm_mb_password" required class="required frm_input" size="15" maxLength="20" placeholder="비밀번호">
        <button type="button" onclick="submitCheck();" value="확인" id="btn_submit" class="btn_submit">확인</button>
        
		<p id="message" style="color: red;"><%=message %></p>
    </fieldset>
    </form>

</div>



<script type="text/javascript">
fmemberconfirm.mb_password.focus();
function submitCheck() {
	if(fmemberconfirm.mb_password.value=="") {
		document.getElementById("message").innerHTML="비밀번호를 반드시 입력해 주세요.";
		fmemberconfirm.mb_password.focus();
		return;
	}
	
	
	
	<%-- 전달값에 의해 form 태그로 요청하는 JSP 문서(action 속성값)를 다르게 설정 --%>
	<% if(action.equals("modify")) {//[회원정보수정]인 경우 %>
		fmemberconfirm.action="<%=request.getContextPath()%>/index.jsp?menugroup=hewon&menu=hewon_modify";
	<% } else {//[회원탈퇴]인 경우 %>
		fmemberconfirm.action="<%=request.getContextPath()%>/index.jsp?menugroup=hewon&menu=hewon_remove_action";
	<% } %>
	
	fmemberconfirm.submit();
}



</script>