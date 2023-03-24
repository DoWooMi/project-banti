<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	if(request.getParameter("login")!=null) {//전달값이 있는 경우
		//메인페이지로 이동되도록 세션에 저장된 기존 요청 URL 주소를 제거 
		session.removeAttribute("returnUrl");
	}
	String message=(String)session.getAttribute("message");
	if(message==null) {
		message="";
	} else {
		session.removeAttribute("message");
	}
	
	String h_hewonid=(String)session.getAttribute("h_hewonid");
	if(h_hewonid==null) {
		h_hewonid="";
	} else {
		session.removeAttribute("h_hewonid");
	}
%>    

<style type="text/css">


#mb_login h1 {
    position: absolute;
    font-size: 0;
    line-height: 0;
    overflow: hidden;
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

.mb_log_cate h2 {
    width: 50%;
    float: left;
    padding: 20px 0;
    text-align: center;
}

.mb_log_cate h2 {
    width: 50%;
    float: left;
    padding: 20px 0;
    text-align: center;
}

.mb_log_cate .join {
    width: 50%;
    float: left;
    padding: 20px 0;
    text-align: center;
    background: #f7f7f7;
    color: #6e6e6e;
}

html, h1, h2, h3, h4, h5, h6, form, fieldset, img {
    margin: 0;
    padding: 0;
    border: 0;
}

input {
    outline: none !important;
    outline-style: none !important;
}
input {
    margin: 0;
    padding: 0;
    font-size: 13px;
    color: #333;
    line-height: 1.6em;
    font-family: 'Noto Sans KR', sans-serif;
    font-weight: 400;
    letter-spacing: -0.02em;
}
input, textarea {
    -webkit-appearance: none;
    -webkit-border-radius: 0;
}

#login_fs {
    padding: 35px;
}

#mb_login #sns_login {
    margin-top: 0;
    border-color: #edeaea;
    padding: 25px;
}

.mbskin .mbskin_box {
    border: 1px solid #ececec;
    background: #fff;
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

.mbskin {
    position: relative;
    margin: 50px auto 0;
    width: 360px;
    text-align: center;
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


.mbskin .frm_input {
    width: 100%;
}

</style>


<div id="mb_login" class="mbskin">
    <div class="mbskin_box">
        <h1>로그인</h1>
        <div class="mb_log_cate">
            <h2><span class="sound_only">회원</span>로그인</h2>
            <a href="<%=request.getContextPath() %>/index.jsp?menugroup=login&menu=terms" class="join">회원가입</a>
        </div>
       
        <form id = login name="login" action="<%=request.getContextPath()%>/index.jsp?menugroup=login&menu=hewon_login_action"  method="post">
        
        <fieldset id="login_fs">
            <legend>회원로그인</legend>
            <label for="h_hewonid" class="sound_only">회원아이디</label>
            <input type="text" name="h_hewonid" id="h_hewonid" required class="frm_input required" size="20" maxLength="20" placeholder="아이디">
            <label for="h_pw" class="sound_only">비밀번호</label>
            <input type="password" name="h_pw" id="h_pw" required class="frm_input required" size="20" maxLength="20" placeholder="비밀번호">
            <div></br></div>
            <button type="submit" class="btn_submit" style="width: 100px">로그인</button>
            
            <div id="login_info">
                <div class="login_if_auto chk_box">
                    <input type="checkbox" name="auto_login" id="login_auto_login" class="selec_chk">
               
                <div id="message" style="color:red;"><%=message %></div>
                </div>
                
                <div class="login_if_lpl">              
                   
                    <a href="http://bant.co.kr/bbs/password_lost.php" target="_blank" id="login_password_lost">정보찾기</a>  
                </div>
            </div>
        </fieldset> 
        </form>
</div>    
	
</div>

