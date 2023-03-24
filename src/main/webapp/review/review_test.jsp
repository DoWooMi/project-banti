<%@page import="xyz.itwill.dao.ReviewDAO"%>
<%@page import="xyz.itwill.dto.ReviewDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- BOARD 테이블에 게시글(새글)을 500개 저장하는 JSP 문서 - 테스트 프로그램 --%>
<% 
	ReviewDTO review=new ReviewDTO();
	for(int i=1;i<=50;i++) {
		int r_rnum=ReviewDAO.getDAO().selectNextNum();
		review.setR_rnum(r_rnum);
		review.setR_onum(1);
		review.setR_pnum(11112233);
		review.setR_hewonid("wongyu");
		review.setR_review("리뷰 연습-"+i);
		review.setR_rate(5);
		review.setR_ref(r_rnum);
		review.setR_status(1);
		
		ReviewDAO.getDAO().insertReview(review);
	} 
%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>
</head>
<body>
	<h1>500개의 테스트 게시글이 삽입 되었습니다.</h1>
</body>
</html>