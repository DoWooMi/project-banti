<%@page import="xyz.itwill.dao.ReviewDAO"%>
<%@page import="xyz.itwill.dto.ReviewDTO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 글번호를 전달받아 REVIEW 테이블의 저장된 게시글에서 해당 글번호의 게시글에 대한 STATUS 
컬럼값을 [0]으로 변경하여 삭제 처리하고 게시글목록 출력페이지(review_list.jsp)로 이동하는 
URL 주소를 클라이언트에게 전달하는 JSP 문서 --%>
<%-- => 로그인 사용자 중 게시글 작성자이거나 관리자인 경우에만 요청 가능한 JSP 문서 --%>

<%@include file="/security/login_check.jspf" %>

<%	

	if(request.getParameter("r_rnum")==null) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?menugroup=error&menu=error_400';");
		out.println("</script>");
		return;	
	}

	int r_rnum=Integer.parseInt(request.getParameter("r_rnum"));	
	ReviewDTO review=ReviewDAO.getDAO().selectReview(r_rnum);

	

	
	review.setR_status(0);
	ReviewDAO.getDAO().updateReview(review);
	
	//페이지 이동
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/index.jsp?menugroup=detailpage&menu=detailpage';");
	out.println("</script>");
%>