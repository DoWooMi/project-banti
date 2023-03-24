<%@page import="xyz.itwill.dto.HewonDTO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<%@include file="/security/admin_check.jspf" %> 

<style type="text/css">
body {
    font-family: "Work Sans","Helvetica Neue",Helvetica,Arial,sans-serif;
    font-size: 18px;
    line-height: 1.6;
    color: var(--text-color);
}
.profile{
	text-align: right;
	font-size: 15px;
}
.container{
	height: 220px;
}
.row{
	height: 220px;
}
.header__inner {
    position: relative;
    display: flex;
    flex-direction: column;
    align-items: center;
    width: 100%;
    padding: 30px 0px 20px;
}
.logo {
    margin-bottom: 32px;
    line-height: 0;
}
.logo__link {
    font-family: "Corben","Georgia",serif;
    font-size: 36px;
    line-height: 1;
    font-weight: 700;
}
.main-nav__box {
    display: flex;
    align-items: center;
}
.main-nav .nav__list {
    display: flex;
    align-items: center;
}
.nav__list .nav__item {
    display: inline-block;
    margin-right: 40px;
    margin-bottom: 0;
}
.nav__list .nav__item .nav__link {
    position: relative;
    padding: 4px;
    font-size: 16px;
    line-height: 24px;
    font-weight: 700;
    border-bottom: 1px solid #BDBDBD;
}
a {
    text-decoration: none;
    color: var(--link-color);
}
.displayDiv{
	font-size:10px;
	text-align: left;
}
</style>

<%-- header --%>
<div class="profile">
	<div id="displayDiv"></div>
		<script type="text/javascript">
		var displayDiv=document.getElementById("displayDiv");
		var displayClock=function() {
		var now=new Date();//클라이언트의 현재 날짜와 시간이 저장된 Date 객체 생성
		
		var printNow=now.getFullYear()+"년 "+(now.getMonth()+1)+"월 "+now.getDate()+"일 "
			+now.getHours()+"시 "+now.getMinutes()+"분 "+now.getSeconds()+"초";
		displayDiv.innerHTML=printNow;
		}
		displayClock();
		setInterval(displayClock, 1000);
	</script>
	<%=loginHewon.getH_name()%> 관리자님, 환영합니다.&nbsp;&nbsp;
	<a href="<%=request.getContextPath()%>/index.jsp?menugroup=login&menu=hewon_logout_action">로그아웃</a>&nbsp;&nbsp;
	<a href="<%=request.getContextPath()%>/index.jsp?menugroup=main&menu=main_page">쇼핑몰</a>&nbsp;&nbsp;
</div> 

<div class="container">
	<div class="row">
		<div class="header__inner col col-12">
			<%-- top --%>
			<div class="logo"><a class="logo__link" href="<%=request.getContextPath()%>/index.jsp?menugroup=admin&menu=main_page">관리자 페이지</a></div>
			<%-- body --%>
			<div class="main-nav__box">
				<ul class="nav__list list-reset">
					<li class="nav__item"><a class="nav__link" href="<%=request.getContextPath()%>/index.jsp?menugroup=admin&menu=hewon_manager">회원관리</a></li>
					<li class="nav__item"><a class="nav__link" href="<%=request.getContextPath()%>/index.jsp?menugroup=admin&menu=product_manager">제품관리</a></li>
					<li class="nav__item"><a class="nav__link" href="<%=request.getContextPath()%>/index.jsp?menugroup=admin&menu=orders_manager">주문관리</a></li>
					<li class="nav__item"><a class="nav__link" href="<%=request.getContextPath()%>/index.jsp?menugroup=board&menu=board_list">게시글관리</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>