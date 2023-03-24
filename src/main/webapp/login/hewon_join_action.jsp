<%@page import="xyz.itwill.dao.HewonDAO"%>
<%@page import="xyz.itwill.dto.HewonDTO"%>
<%@page import="xyz.itwill.util.Utility"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 회원정보를 전달받아 MEMBER 테이블에 삽입하고 로그인정보 입력페이지(member_login.jsp)로
이동하기 위한 URL 주소 전달하는 JSP 문서 --%>    
<%
	//비정상적인 요청에 대한 응답 처리
	if(request.getMethod().equals("GET")) {
		
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?menugroup=error&menu=error_400';");
		out.println("</script>");
		return;
	}

	String h_hewonid=request.getParameter("h_hewonid");
	
	String h_pw=Utility.encrypt(request.getParameter("h_pw"));
	String h_name=request.getParameter("h_name");
	String h_email=request.getParameter("h_email");
	String h_phone =request.getParameter("h_phone");
	String h_zipcode=request.getParameter("h_zipcode");
	String h_address1=request.getParameter("h_address1");
	String h_address2=request.getParameter("h_address2");
	
	
	//HewonDTO 객체를 생성하여 전달값으로 필드값 변경
	HewonDTO hewon=new HewonDTO();
	hewon.setH_hewonid(h_hewonid);
	hewon.setH_pw(h_pw);
	hewon.setH_name(h_name);
	hewon.setH_email(h_email);
	hewon.setH_phone(h_phone);
	hewon.setH_zipcode(h_zipcode);
	hewon.setH_address1(h_address1);
	hewon.setH_address2(h_address2);

	
	 //테이블에 삽입하는 DAO 클래스의 메소드 호출
	HewonDAO.getDAO().insertHewon(hewon);
	
	//클라이언트에게 URL 주소 전달
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/index.jsp?menugroup=login&menu=hewon_login';");
	out.println("</script>");
%>