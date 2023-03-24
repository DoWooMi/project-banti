<%@page import="xyz.itwill.dao.HewonDAO"%>
<%@page import="xyz.itwill.dao.OrdersDAO"%>
<%@page import="xyz.itwill.dao.ProductDAO"%>
<%@page import="xyz.itwill.dto.HewonDTO"%>
<%@page import="xyz.itwill.dto.ProductDTO"%>
<%@page import="xyz.itwill.dao.ReviewDAO"%>
<%@page import="xyz.itwill.dto.ReviewDTO"%>
<%@page import="xyz.itwill.dto.OrdersDTO"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>

<link rel="stylesheet" href="http://www.bant.co.kr/theme/daontheme_shop01/skin/review/daon_basic/style.css?ver=191202">
<link rel="stylesheet" href="http://www.bant.co.kr/theme/daontheme_shop01/skin/latest/daon_shop_basic/style.css?ver=191202">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- REVIEW 테이블에 저장된 게시글을 검색하여 게시글 목록을 클라이언트에게 전달하는 JSP 문서 --%>
 
<%
	//페이징 처리 관련 전달값(요청 페이지 번호)를 반환받아 저장
	// => 요청 페이지 번호에 대한 전달값이 없는 경우 첫번째 페이지의 게시글 목록을 검색하여 응답
	int pageNum=1;
	if(request.getParameter("pageNum")!=null) {//전달값이 있는 경우
		pageNum=Integer.parseInt(request.getParameter("pageNum"));
	}
	
	//하나의 페이지에 검색되어 출력될 게시글의 갯수 설정 - 전달값을 반환받아 저장 가능
	int pageSize=10;
		
	//REVIEW 테이블에 저장된 전체 게시글의 갯수를 검색하여 반환하는 DAO 클래스의 메소드 호출
	// => 검색 기능 미구현시 호출하는 메소드
	int totalReview=ReviewDAO.getDAO().selectReviewCount();
        
	//전체 페이지의 갯수를 계산하여 저장
	int totalPage=(int)Math.ceil((double)totalReview/pageSize);
	  
	//요청 페이지 번호에 대한 검증
	if(pageNum<=0 || pageNum>totalPage) {//비정상적인 요청 페이지 번호인 경우
		pageNum=1;//첫번째 페이지의 게시글 목록이 검색되어 응답되도록 요청 페이지 번호 변경
	}
	
	//요청 페이지 번호에 대한 시작 게시글의 행번호를 계산하여 저장
	//ex) 1Page : 1, 2Page : 11, 3Page : 21, 4Page : 31, ...
	int startRow=(pageNum-1)*pageSize+1;
                     
	//요청 페이지 번호에 대한 종료 게시글의 행번호를 계산하여 저장
	//ex) 1Page : 10, 2Page : 20, 3Page : 30, 4Page : 40, ...
	int endRow=pageNum*pageSize;
	
	//마지막 페이지에 대한 종료 게시글의 행번호를 검색 게시글의 갯수로 변경
	if(endRow>totalReview) {
		endRow=totalReview;
	}
	
	//요청 페이지에 대한 시작 게시글의 행번호와 종료 게시글의 행번호를 전달받아 REVIEW 테이블에
	//저장된 게시글에서 해당 범위의 게시글만을 검색하여 반환하는 DAO 클래스의 메소드 호출
	// => 검색 기능 미구현시 호출하는 메소드
	List<ReviewDTO> reviewList=ReviewDAO.getDAO().selectReviewList(startRow, endRow);
	
	//**********************************************************************************************************************************************
	//세션에 저장된 권한 관련 정보를 반환받아 저장
	// => 로그인 사용자에게만 글쓰기 권한 제공
	// => 비밀 게시글인 경우 로그인 사용자가 게시글 작성자이거나 관리자인 경우에만 접근 권한 제공
	HewonDTO loginHewon=(HewonDTO)session.getAttribute("loginHewon");
	//ProductDTO orderProduct=(ProductDTO)session.getAttribute("orderProduct")

	//**********************************************************************************************************************************************

	
	//서버 시스템의 현재 날짜를 반환받아 저장
	// => 게시글의 작성날짜를 현재 날짜와 비교하여 구분 출력
	String currentDate=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
	
	//요청 페이지에 검색되어 출력될 게시글의 일련번호에 대한 시작값을 계산하여 저장
	//ex)전체 게시글의 갯수 : 91 >> 1Page : 91~82, 2Page : 81~72, 3Page : 71~62,...
	int printNum=totalReview-(pageNum-1)*pageSize;
	
	//HewonDTO orderedhewon=HewonDAO.getDAO().selectProductOrderedHewon(loginHewon.getH_hewonid());
/*
	int p_pnum= Integer.parseInt(request.getParameter("p_pnum"));
	
	session.setAttribute("product", ProductDAO.getDAO().selectProduct(p_pnum));
	ProductDTO product = (ProductDTO)session.getAttribute("product");
*/
	String p_pnum=request.getParameter("p_pnum");
	session.setAttribute("product", ProductDAO.getDAO().selectProduct(Integer.parseInt(p_pnum)));
	ProductDTO product=(ProductDTO)session.getAttribute("product");
	
	//List<OrdersDTO> ordersList=OrdersDAO.getDAO().selecthewonOrders(loginHewon.getH_hewonid());
%>     

<style type="text/css">

</style>
<div id="wrapper" style="clear:both;">
	<div id="container">
		<div class="shop-content">
			<!-- 게시판 카테고리 시작 { -->
			<div id="wrapper_title">상품후기</div>
			<div id="bo_list" style="width:100%">  
    		<!-- 게시판 페이지 정보 및 버튼 시작 -->
    		<div id="bo_btn_top">
    
    			
    		<% if(loginHewon!=null && loginHewon.getH_status()==1) {//로그인 사용자가 JSP 문서를 요청한 경우 --%>
			<div class="bo_fx" style="text-align: right;">
    		<ul class="btn_bo_user">
        		<li style="align:left"><a href="index.jsp?menugroup=review&p_pnum=<%=product.getP_pnum() %>&menu=review_write" class="btn_b011 btn" title="리뷰 작성" >
        		<i class="fa fa-pen" aria-hidden="true"></i>
        		<span class="">리뷰 작성</span></a></li>     
        	</ul>	       
    	</div>
    	<% } %>

    	 
	
       	
    		</div>

   	 		<!-- 게시판 페이지 정보 및 버튼 끝 -->
   	 		<div class="tbl_head01 tbl_wrap">
   	      		<table style="width: 100%;">
   	      		
       				<thead >
        				<tr>
				            <th  colspan="4" >사용후기</th>
			    		</tr>
			    	</thead>	
			    	<tbody>
		    		<%-- 검색글이 없을경우 --%>
					
		    		<% if(totalReview==0) { %>
						<tr>
							<td><span class="bo_tit" style="text-align: center;">사용 후기가 없습니다.</span></td>
						</tr>	
						
					<% } else { %>
						<% for(ReviewDTO review:reviewList) { %>
						<%-- if(review.getR_status()==1 ) {//일반 게시글인 경우 --%>	
							<% if(review.getR_status()==1 && review.getR_pnum() == product.getP_pnum()) {//일반 게시글인 경우 %> 
							<tr>
							<%-- 이미지 --%>
	    						<td class="tg-0lax" rowspan="3" width="90" ><img src="http://www.bant.co.kr/img/no_profile.gif" alt="profile_image" style="border-radius: 70%"></td>
	    						<%-- 별점 --%>
	    						<td height="30" style="padding: 0; color:gold">
	    		  	    		    	
	      		    				<% if(review.getR_rate()==5) { %>
	    								★★★★★
	    							<% } else if(review.getR_rate()==4) { %>
	    								★★★★
	    							<% } else if(review.getR_rate()==3) { %>
	    								★★★
	    							<% } else if(review.getR_rate()==2) { %>
	    								★★
	    							<% } else {%>
	    								★
	    							<%} %>	
	    						</td>					
	        				</tr>
	        				<tr>
	        					<%-- 이름 --%>
	        					<td class="tg-0lax" height="30" style="padding: 0; border-top: 0;"><%=review.getWriter()%></td>
	        				</tr>	
							<tr>
								<%-- 리뷰날짜 --%>
								<td height="30" style="padding: 0; border-top: 0;">
								<% if(currentDate.equals(review.getR_date().substring(0,10))) {//오늘 작성된 게시글인 경우 %>
									<%=review.getR_date().substring(11) %>
								<% } else {//오늘 작성된 게시글이 아닌 경우 %>
									<%=review.getR_date() %>
								<% } %>
								
								<tr>
									<td colspan="2"><%=review.getR_review() %></td>
							</tr>	
						    <tr>
						  
							</tr>
														
						<% } %>
						

				<% } %>
				<% } %>
				</tbody>
			</table>		

			<!-- 페이지 -->
			<%-- 페이지 번호 출력 및 링크 설정 - 블럭화 처리 --%>
	<%
		//하나의 페이지 블럭에 출력될 페이지 번호의 갯수를 설정
		int blockSize=5;
	
		//페이지 블럭에 출력될 시작 페이지 번호를 계산하여 저장
		//ex)1Block : 1, 2Block : 6, 3Block : 11, 4Block : 16,... 
		int startPage=(pageNum-1)/blockSize*blockSize+1;
		//페이지 블럭에 출력될 종료 페이지 번호를 계산하여 저장
		//ex)1Block : 5, 2Block : 10, 3Block : 15, 4Block : 20,...
		int endPage=startPage+blockSize-1;
		//마지막 페이지 블럭의 종료 페이지 번호 변경
		if(endPage>totalPage) {
			endPage=totalPage;
		}
	%>

	<nav class="pg_wrap"><span class="pg">
	
	<% if(startPage>blockSize) {//첫번째 페이지 블럭이 아닌 경우%>
		<a href="<%=request.getContextPath()%>/index.jsp?menugroup=review&menu=review_list&p_pnum=<%=product.getP_pnum() %>&pageNum=<%=startPage-blockSize%>" >[이전]</a>
	<% } %>
	
	<% for(int i=startPage;i<=endPage;i++) { %>
		<% if(pageNum!=i) {//요청 페이지 번호와 이벤트 페이지 번호가 다른 경우 - 링크 제공 %>			
			<a href="<%=request.getContextPath()%>/index.jsp?menugroup=review&menu=review_list&p_pnum=<%=product.getP_pnum() %>&pageNum=<%=i%>">[<%=i %>]</a>			
		<% } else {//요청 페이지 번호와 이벤트 페이지 번호가 같은 경우 - 링크 미제공 %>
			[<%=i %>]
		<% } %>	
	<% } %>
	
	<% if(endPage!=totalPage) {//마지막 페이지 블럭이 아닌 경우 %>
		<a href="<%=request.getContextPath()%>/index.jsp?menugroup=review&menu=review_list&p_pnum=<%=product.getP_pnum() %>&pageNum=<%=startPage+blockSize%>">[다음]</a>
	<% } %>
	</span></nav>

		    	</div><!-- } 게시판 목록 끝 -->
		</div><!-- } .shop-content 끝 -->
		</div>
	</div><!-- } #container 끝 -->
</div><!-- } #wrapper 전체 콘텐츠 끝 -->