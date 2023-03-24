<%@page import="xyz.itwill.dao.CartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>    
<%


	String [] cartremovelist=request.getParameterValues("check");
	for(String cartremove: cartremovelist ) {
		CartDAO.getDAO().deletecart(Integer.parseInt(cartremove));
	}
	
		
	
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/index.jsp?menugroup=cart&menu=cart_list';");
	out.println("</script>");

%>