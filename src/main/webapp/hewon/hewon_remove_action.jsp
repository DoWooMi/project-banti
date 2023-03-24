<%@page import="xyz.itwill.dao.HewonDAO"%>
<%@page import="xyz.itwill.util.Utility"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	String passwd=Utility.encrypt(request.getParameter("mb_password"));
	
	//전달된 비밀번호가 로그인 사용자의 비밀번호와 같지 않은 경우 비밀번호 입력페이지
	//(password_confirm.jsp)로 이동
	if(!passwd.equals(loginHewon.getH_pw())) {
		session.setAttribute("message", "비밀번호가 일치하지 않습니다.");
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?menugroup=hewon&menu=password_confirm&action=remove';");
		out.println("</script>");
		return;
	}
	
	//아이디와 회원상태를 전달받아 MEMBER 태이블에 저장된 해당 아이디의 회원정보에서 회원상태를
	//변경하는 DAO 클래스의 메소드 호출 - 탈퇴회원으로 변경 처리
	HewonDAO.getDAO().updateH_Status(loginHewon.getH_hewonid(), 0);
	
	//클라이언트에게 URL 주소 전달
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/index.jsp?menugroup=login&menu=hewon_logout_action';");
	out.println("</script>");
	
%>  