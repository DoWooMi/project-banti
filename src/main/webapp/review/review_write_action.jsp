<%@page import="xyz.itwill.dto.OrdersDTO"%>
<%@page import="java.util.List"%>
<%@page import="xyz.itwill.dao.OrdersDAO"%>
<%@page import="xyz.itwill.dao.ProductDAO"%>
<%@page import="xyz.itwill.dto.ProductDTO"%>
<%@page import="xyz.itwill.util.Utility"%>
<%@page import="xyz.itwill.dto.ReviewDTO"%>
<%@page import="xyz.itwill.dao.ReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 게시글(새글 또는 답글)을 전달받아 review 테이블에 삽입하고 게시글목록 출력페이지(review_list.jsp)로
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
	int r_ref=Integer.parseInt(request.getParameter("r_ref"));
	int r_restep=Integer.parseInt(request.getParameter("r_restep"));
	int r_relevel=Integer.parseInt(request.getParameter("r_relevel"));
	String pageNum=request.getParameter("pageNum");
	//사용자로부터 입력받아 전달된 값에 태그 관련 문자가 존재할 경우 회피문자로 변경하여 저장
	// => XSS 공격에 대한 방어 
	//String subject=request.getParameter("subject");
	//String subject=Utility.stripTag(request.getParameter("subject"));
	
	String r_review=Utility.escapeTag(request.getParameter("r_review"));
	int r_rate=Integer.parseInt(request.getParameter("r_rate"));
	
	//review_SEQ 시퀸스의 다음값(자동 증가값)을 검색하여 반환하는 DAO 클래스의 메소드 호출
	// => 게시글(새글 또는 답글)의 글번호(NUM 컬럼값)로 저장
	// => 새글인 경우에는 게시글의 그룹번호(REF 컬럼값)로 저장
	int r_rnum=ReviewDAO.getDAO().selectNextNum();
	

	int r_status=1;
	if(request.getParameter("r_status")!=null) {
		r_status=Integer.parseInt(request.getParameter("r_status"));
	}
	
	//새글과 답글을 구분하여 review 테이블의 컬럼값으로 저장될 변수값 변경
	// => review_write.jsp 문서에서 hidden 타입으로 전달된 ref, reStep, reLevel 변수값
	//(새글 - 초기값, 답글 - 부모글) 변경
	if(r_ref==0) {//새글인 경우
		//review 테이블의 REF 컬럼값에는 자동 증가값(num 변수값)이 저장되도록 ref 변수값을 변경하고
		//RE_STEP 컬럼과 RE_LEVEL 컬럼에는 [0]이 저장되도록 reStep 변수와 reLevel 변수의 값 사용  
		r_ref=r_rnum;
	} else {//답글인 경우
		//부모글의 정보(ref 변수값과 reStep 변수값)를 전달받아 review 테이블에 저장된 게시글에서
		//REF 컬럼값과 ref 변수값이 같은 게시글 중 RE_STEP 컬럼값이 reStep 변수값보다 커다란
		//모든 게시글의 RE_STEP 컬럼값이 1씩 증가되도록 변경하는 DAO 클래스 메소드 호출
		// => 답글의 검색 순서가 변경되어 다시 정렬되도록 RE_STEP 컬럼값 변경
		ReviewDAO.getDAO().updateReStep(r_ref, r_restep);
		
		//review 테이블의 REF 컬럼값에는 부모글의 전달값이 저장되도록 ref 변수값을 사용하고
		//RE_STEP 컬럼과 RE_LEVEL 컬럼에는 reStep 변수와 reLevel 변수의 값을 1 증가시켜 저장되도록 변경
		r_restep++;
		r_relevel++;
		
		
	}	
	/*
	int p_pnum= Integer.parseInt(request.getParameter("p_pnum"));
	session.setAttribute("product", ProductDAO.getDAO().selectProduct(p_pnum));
	ProductDTO product=(ProductDTO)session.getAttribute("product");
	*/
	
	String p_pnum=request.getParameter("p_pnum");
	session.setAttribute("product", ProductDAO.getDAO().selectProduct(Integer.parseInt(p_pnum)));
	ProductDTO product=(ProductDTO)session.getAttribute("product");
	
	List<OrdersDTO> ordersList=OrdersDAO.getDAO().selecthewonOrders(loginHewon.getH_hewonid());
	for(OrdersDTO myshopping:ordersList){
		ProductDTO orderproduct=OrdersDAO.getDAO().selectProduct(myshopping.getO_pnum());
		if(orderproduct.getP_pnum()==product.getP_pnum()){
	
	//reviewDTO 객체를 생성하여 변수값으로 필드값 변경
	ReviewDTO review=new ReviewDTO();
	review.setR_rnum(r_rnum);
	review.setR_onum(myshopping.getO_onum());	
	review.setR_pnum(product.getP_pnum());
	review.setR_hewonid(loginHewon.getH_hewonid());
	review.setR_review(r_review);
	review.setR_rate(r_rate);
	review.setR_ref(r_ref);
	review.setR_restep(r_restep);
	review.setR_relevel(r_relevel);
	review.setR_review(r_review);
	review.setR_status(r_status);
	
	//게시글을 전달받아 review 테이블에 삽입하는 DAO 클래스의 메소드 호출
	ReviewDAO.getDAO().insertReview(review);

		}
	}
	
	
	
	//페이지 이동
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/index.jsp?menugroup=review&menu=review_list&p_pnum="+p_pnum+"&pageNum="+pageNum+"';");
	out.println("</script>");
%>   