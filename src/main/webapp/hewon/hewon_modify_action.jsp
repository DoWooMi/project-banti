<%@page import="xyz.itwill.dao.HewonDAO"%>
<%@page import="xyz.itwill.dto.HewonDTO"%>
<%@page import="xyz.itwill.util.Utility"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 회원정보를 전달받아 MEMBER 테이블에 저장된 회원정보를 변경하고 내정보 출력페이지(member_mypage.jsp)로
이동하기 위한 URL 주소 전달하는 JSP 문서 --%>
<%-- => 로그인 사용자만 요청 가능한 JSP 문서 --%>
<%@include file="/security/login_check.jspf" %>
<%
	//비정상적인 요청에 대한 응답 처리
	if(request.getMethod().equals("GET")) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=error&work=error_400';");
		out.println("</script>");
		return;
	}
	
	//전달값을 반환받아 저장
	String h_hewonid=request.getParameter("h_hewonid");
	String h_pw=request.getParameter("h_pw");
	if(h_pw==null || h_pw.equals("")) {//비밀번호 전달값이 없는 경우
		//로그인 사용자의 비밀번호를 변수에 저장 - 기존 비밀번호 유지
		h_pw=loginHewon.getH_pw();
	} else {//비밀번호 전달값이 있는 경우
		//새로운 비밀번호를 암호화 처리하여 변수에 저장 - 비밀번호 변경
		h_pw=Utility.encrypt(h_pw);
	}
	String h_name=request.getParameter("h_name");
	String h_email=request.getParameter("h_email");
	String h_phone=request.getParameter("h_phone");
	String h_zipcode=request.getParameter("h_zipcode");
	String h_address1=request.getParameter("h_address1");
	String h_address2=request.getParameter("h_address2");
	
	HewonDTO hewon=new HewonDTO();
	hewon.setH_hewonid(h_hewonid);
	hewon.setH_pw(h_pw);
	hewon.setH_name(h_name);
	hewon.setH_email(h_email);
	hewon.setH_phone(h_phone);
	hewon.setH_zipcode(h_zipcode);
	hewon.setH_address1(h_address1);
	hewon.setH_address2(h_address1);

	//회원정보를 전달받아 MEMBER 테이블에 저장된 회원정보를 변경하는 DAO 클래스의 메소드 호출
	HewonDAO.getDAO().updateHewon(hewon);
	
	//세션에 저장된 권한 관련 정보(회원정보) 변경
	session.setAttribute("loginHewon", HewonDAO.getDAO().selectHewon(h_hewonid));
	
	//클라이언트에게 URL 주소 전달
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/index.jsp?menugroup=order&menu=order_list';");
	out.println("</script>");
%>