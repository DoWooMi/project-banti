<%@page import="xyz.itwill.dao.OrdersDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="/security/admin_check.jspf" %> 

<%
	//비정상적인 요청에 대한 응답 처리
	if(request.getParameter("o_hewonid")==null || request.getParameter("o_status")==null) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?menugroup=error&menu=error_400';");
		out.println("</script>");
		return;	
	}
	//전달값을 반환받아 저장
	String o_hewonid=request.getParameter("o_hewonid");
	String o_updatestatus=request.getParameter("o_status");	
	int o_status=Integer.parseInt(o_updatestatus);
	
	
	//아이디와 회원상태를 전달받아 MEMBER 테이블에 저장된 해당 아이디의 회원정보에서 회원상태를
	//변경하는 DAO 클래스의 메소드 호출
	OrdersDAO.getDAO().updateO_Status(o_hewonid, o_status);
	
	//페이지 이동
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/index.jsp?menugroup=admin&menu=orders_manager';");
	out.println("</script>");
%>
