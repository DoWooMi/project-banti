<%@page import="xyz.itwill.dto.HewonDTO"%>
<%@page import="xyz.itwill.dao.HewonDAO"%>   
<%@page import="xyz.itwill.util.Utility"%>   
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//전달값을 반환받아 저장
	String h_hewonid=request.getParameter("h_hewonid");
	String h_pw=Utility.encrypt(request.getParameter("h_pw"));
	
	//아이디를 전달받아 MEMBER 테이블에 저장된 해당 아이디의 회원정보를 검색하여 반환하는 
	//DAO 클래스의 메소드 호출
	HewonDTO hewon=HewonDAO.getDAO().selectHewon(h_hewonid);
	
	//전달받은 아이디로 검색된 회원정보가 없거나 탈퇴회원인 경우 - 아이디 인증 실패
	if(hewon==null || hewon.getH_status()==0) {
		session.setAttribute("message", "입력한 아이디가 존재하지 않습니다.");
		session.setAttribute("h_hewonid", h_hewonid);
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?menugroup=login&menu=hewon_login';");
		out.println("</script>");
		return;
	}
	
	//검색된 회원정보의 비밀번호와 전달받은 비밀번호가 맞지 않는 경우 - 비밀번호 인증 실패
	if(!hewon.getH_pw().equals(h_pw)) {
		session.setAttribute("message", "입력한 아이디가 잘못 되었거나 비밀번호가 맞지 않습니다.");
		session.setAttribute("h_hewonid", h_hewonid);
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?menugroup=login&menu=hewon_login';");
		out.println("</script>");
		return;
	}
	
	
	HewonDAO.getDAO().updateLastLogin(h_hewonid);
	
	//세션에 권한 관련 정보(회원정보) 저장
	session.setAttribute("loginHewon", HewonDAO.getDAO().selectHewon(h_hewonid));
	
	//세션에 저장된 요청 페이지의 URL 주소를 반환받아 저장
	String returnUrl=(String)session.getAttribute("returnUrl");
	
	if(returnUrl==null) {//요청 페이지가 없는 경우
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+"index.jsp?menugroup=main&menu=main_page';");
		out.println("</script>");
	} else {//요청 페이지가 있는 경우
		session.removeAttribute("returnUrl");
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+returnUrl+"';");
		out.println("</script>");
	}
		
%>