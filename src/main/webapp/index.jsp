<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String menugroup=request.getParameter("menugroup");
	if(menugroup==null) menugroup="main";
	
	String menu=request.getParameter("menu");
	if(menu==null) menu="main_page";
	
	String headerPath="header.jsp";
	if(menugroup.equals("admin")) { //관리자 페이지 요청 시
		headerPath="admin/header.jsp";
	}
	
	String contentPath=menugroup+"/"+menu+".jsp";
	
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=0,maximum-scale=10,user-scalable=yes">
<meta http-equiv="imagetoolbar" content="no">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="google-site-verification" content="WofxjsYzexEyl-HMHM_u3xHx9kSwjTgWkNMCVkiepyM" />
<meta name="naver-site-verification" content="0a9d89e33ad8678fef545765c98e7eb27f3d856b"/>
<meta name="description" content="반티사이트,쇼핑몰,개구리 군복 반티,체육대회 반티,오징어게임 반티,코스프레 반티,교련복 반티,죄수복 반티,경찰 반티,야구 반티,농구 반티,사은품,군인"/>
<link rel="canonical"   href="index.html">
<title>BANT</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/banti0.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/banti1.css">

</head>


<body>
	<%-- Header 시작 --%>
	<div id="header">
		<jsp:include page="<%=headerPath %>"/>
	</div>
	<%-- Header 끝 --%>
	
	<%-- Main 시작--%>
	<div id="content">
		<jsp:include page="<%=contentPath %>"/>		
	</div>
	<%-- Main 끝 --%>
		
	<%-- Footer 시작 --%>
	<div id="footer">
	<%--<jsp:include page="<%=footerPath %>" --%>	
		<jsp:include page="footer.jsp"/>
	</div>
	<%-- Footer 끝 --%>

</body>
</html>
