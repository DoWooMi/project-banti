<%@page import="xyz.itwill.util.Utility"%>
<%@page import="xyz.itwill.dto.BoardDTO"%>
<%@page import="xyz.itwill.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 게시글(새글 또는 답글)을 전달받아 BOARD 테이블에 삽입하고 게시글목록 출력페이지(board_list.jsp)로
이동하기 위한 URL 주소를 클라이언트에게 전달하는 JSP 문서 --%>
<%-- => 로그인 사용자만 요청 가능한 JSP 문서 --%>    

<%-- 비정상적인 요청에 대한 응답 처리 --%>
<%@include file="/security/login_check.jspf" %>

<%
	//비정상적인 요청에 대한 응답 처리
	if(request.getMethod().equals("GET")) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?menugroup=error&menu=error_400';");
		out.println("</script>");
		return;		
	}
	//전달값을 반환받아 저장
	int b_ref=Integer.parseInt(request.getParameter("b_ref"));
	int b_restep=Integer.parseInt(request.getParameter("b_restep"));
	int b_relevel=Integer.parseInt(request.getParameter("b_relevel"));
	String pageNum=request.getParameter("pageNum");
	//사용자로부터 입력받아 전달된 값에 태그 관련 문자가 존재할 경우 회피문자로 변경하여 저장
	// => XSS 공격에 대한 방어 
	//String subject=request.getParameter("subject");
	//String subject=Utility.stripTag(request.getParameter("subject"));
	
	int b_type=Integer.parseInt(request.getParameter("b_type"));
	
	
	String b_title=Utility.escapeTag(request.getParameter("b_title"));
	int b_status=1;
	if(request.getParameter("b_status")!=null) {
		b_status=Integer.parseInt(request.getParameter("b_status"));
	}
	String b_question=Utility.escapeTag(request.getParameter("b_question"));
	
	//BOARD_SEQ 시퀸스의 다음값(자동 증가값)을 검색하여 반환하는 DAO 클래스의 메소드 호출
	// => 게시글(새글 또는 답글)의 글번호(NUM 컬럼값)로 저장
	// => 새글인 경우에는 게시글의 그룹번호(REF 컬럼값)로 저장
	int b_bnum=BoardDAO.getDAO().selectNextNum();
	

	
	//새글과 답글을 구분하여 BOARD 테이블의 컬럼값으로 저장될 변수값 변경
	// => board_write.jsp 문서에서 hidden 타입으로 전달된 ref, reStep, reLevel 변수값
	//(새글 - 초기값, 답글 - 부모글) 변경
	if(b_ref==0) {//새글인 경우
		//BOARD 테이블의 REF 컬럼값에는 자동 증가값(num 변수값)이 저장되도록 ref 변수값을 변경하고
		//RE_STEP 컬럼과 RE_LEVEL 컬럼에는 [0]이 저장되도록 reStep 변수와 reLevel 변수의 값 사용  
		b_ref=b_bnum;
	} else {//답글인 경우
		//부모글의 정보(ref 변수값과 reStep 변수값)를 전달받아 BOARD 테이블에 저장된 게시글에서
		//REF 컬럼값과 ref 변수값이 같은 게시글 중 RE_STEP 컬럼값이 reStep 변수값보다 커다란
		//모든 게시글의 RE_STEP 컬럼값이 1씩 증가되도록 변경하는 DAO 클래스 메소드 호출
		// => 답글의 검색 순서가 변경되어 다시 정렬되도록 RE_STEP 컬럼값 변경
		BoardDAO.getDAO().updateReStep(b_ref, b_restep);
		
		//BOARD 테이블의 REF 컬럼값에는 부모글의 전달값이 저장되도록 ref 변수값을 사용하고
		//RE_STEP 컬럼과 RE_LEVEL 컬럼에는 reStep 변수와 reLevel 변수의 값을 1 증가시켜 저장되도록 변경
		b_restep++;
		b_relevel++;
	}
	
	//BoardDTO 객체를 생성하여 변수값으로 필드값 변경
	BoardDTO board=new BoardDTO();
	board.setB_bnum(b_bnum);
	board.setB_hewonid(loginHewon.getH_hewonid());
	board.setB_title(b_title);
	board.setB_type(b_type);
	board.setB_ref(b_ref);
	board.setB_restep(b_restep);
	board.setB_relevel(b_relevel);
	board.setB_question(b_question);
	board.setB_status(b_status);
	//게시글을 전달받아 BOARD 테이블에 삽입하는 DAO 클래스의 메소드 호출
	BoardDAO.getDAO().insertBoard(board);
	
	//페이지 이동
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/index.jsp?menugroup=board&menu=board_list&pageNum="+pageNum+"';");
	out.println("</script>");
%>   