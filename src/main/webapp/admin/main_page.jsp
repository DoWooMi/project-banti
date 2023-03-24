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
.content {
    margin: 5px;
    padding: 10px;
    min-height: 600px;
    border: 1px solid #BDBDBD;
    border-radius: 20px;
    text-align: center;
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
	text-align: left;
}
h2 {
    display: block;
    font-size: 1.5em;
    margin-block-start: 0.83em;
    margin-block-end: 0.83em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-weight: bold;
}
</style>

<%-- body --%>
<div class="content">
	<h2>관리자 페이지에 입장하셨습니다.</h2>
</div>


