<%@page import="xyz.itwill.dao.HewonDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="/security/admin_check.jspf" %> 

<%
	//비정상적인 요청에 대한 응답 처리
	if(request.getParameter("h_hewonid")==null || request.getParameter("h_status")==null) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?menugroup=error&menu=error_400';");
		out.println("</script>");
		return;	
	}

	String h_hewonid=request.getParameter("h_hewonid");
	String h_updatestatus=request.getParameter("h_status");
	int h_status=Integer.parseInt(h_updatestatus);
	
	HewonDAO.getDAO().updateH_Status(h_hewonid, h_status);
	
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/index.jsp?menugroup=admin&menu=hewon_manager';");
	out.println("</script>");
%>
