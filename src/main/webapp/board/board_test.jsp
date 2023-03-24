<%@page import="xyz.itwill.dao.BoardDAO"%>
<%@page import="xyz.itwill.dto.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- BOARD 테이블에 게시글(새글)을 500개 저장하는 JSP 문서 - 테스트 프로그램 --%>
<% 
	BoardDTO board=new BoardDTO();
	for(int i=1;i<=50;i++) {
		int b_bnum=BoardDAO.getDAO().selectNextNum();
		board.setB_bnum(b_bnum);
		board.setB_hewonid("wongyu");
		board.setB_title("테스트-"+i);
		board.setB_ref(b_bnum);
		board.setB_question("게시글 연습-"+i);
		board.setB_status(2);
		board.setB_type(0);
		BoardDAO.getDAO().insertBoard(board);
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