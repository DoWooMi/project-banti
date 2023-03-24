<%@page import="xyz.itwill.dto.HewonDTO"%>
<%@page import="xyz.itwill.dao.ReviewDAO"%>
<%@page import="xyz.itwill.dto.ReviewDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
/*
	if(request.getParameter("r_rnum")==null) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?menugroup=error&menu=error_400';");
		out.println("</script>");
		return;			
	}
*/	
	int r_rnum=Integer.parseInt(request.getParameter("r_rnum"));
	String pageNum=request.getParameter("pageNum");
	
	ReviewDTO review=ReviewDAO.getDAO().selectReview(r_rnum);
	
	if(review==null || review.getR_status()==0) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?menugroup=error&menu=error_400';");
		out.println("</script>");
		return;
	}
	
	HewonDTO loginHewon=(HewonDTO)session.getAttribute("loginHewon");
	
%>

<link rel="stylesheet" href="http://www.bant.co.kr/theme/daontheme_shop01/skin/review/daon_basic/style.css?ver=191202">
<link rel="stylesheet" href="http://www.bant.co.kr/theme/daontheme_shop01/skin/latest/daon_shop_basic/style.css?ver=191202">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<div id="wrapper" style="clear:both;">  
	<!-- 콘텐츠 시작 { -->
	<div id="container">
		<!-- .shop-content 시작 { -->
		<div class="shop-content">
			<div id="wrapper_title">사용후기</div>	
			<article id="bo_v" >
    		<header>
        		<h2 id="bo_v_title">
            	<span class="bo_v_tit">
         		
				<%=review.getWriter() %>
				</span>
        		</h2>
    		</header>
    		</article>
    		
		<section id="bo_v_info">
		<div class="profile_info">	
						
	<table>
	<tr>
    	<td class="tg-0lax" colspan="2" rowspan="2">
        	<div class="pf_img"><img src="http://www.bant.co.kr/img/no_profile.gif" alt="profile_image"></div>			
		</td>
    	<td class="tg-0lax">
    		<%=review.getWriter() %>
    	</td>
  	</tr>
	<tr>
	    <td class="tg-0lax" >
	    	<%=review.getR_date() %>
	    </td>
	</tr>
</table>
</div>
</section>
<section id="bo_v_atc" >
<table>
	<tr >
    	<td id="bo_v_con">
    		<%=review.getR_review().replace("\n", "<br>") %>
    	</td>
  	</tr>	  
</table>
</section>
	<div class="view_bt">
		
	        <ul class="btn_bo_user bo_v_com">
				<li><button class="btn_b011 btn" type="button" id="listBtn" style="color: gray"><i class="fa fa-list" aria-hidden="true"></i> 목록</button></li>
				<% if(loginHewon!=null) { %>
	            <% } %>
	            <% if(loginHewon!=null && (loginHewon.getH_hewonid().equals(review.getR_hewonid())|| loginHewon.getH_status()==2)) { %>   											      
				<li><button  class="btn_b011 btn" type="button" id="removeBtn" style="color: gray"><i class="fa fa-trash" aria-hidden="true"></i> 삭제</button></li>
				<% } %>
		    </ul>
		   			
	      </div>
		</div>  <!-- } .shop-content 끝 -->
	</div>  <!-- } #container 끝 -->
	
</div> <!-- } #wrapper 전체 콘텐츠 끝 -->

	<%-- 요청 페이지에 값을 전달하기 위한 form 태그 --%>
	<form action="<%=request.getContextPath()%>/index.jsp" method="get" id="menuForm">
		<input type="hidden" name="menugroup" value="review">
		<input type="hidden" name="menu" id="menu">
	
		<%-- [글변경] 및 [글삭제]를 클릭한 경우 전달되는 값 --%>
		<input type="hidden" name="r_rnum" value="<%=review.getR_rnum()%>">
		
		<%-- [글변경] 및 [글목록]를 클릭한 경우 전달되는 값 --%>
		<input type="hidden" name="pageNum" value="<%=pageNum%>">

		
		<%-- [답글쓰기]를 클릭한 경우 전달되는 값 --%>
		<input type="hidden" name="r_ref" value="<%=review.getR_ref()%>">
		<input type="hidden" name="r_restep" value="<%=review.getR_restep()%>">
		<input type="hidden" name="r_relevel" value="<%=review.getR_relevel()%>">
	</form>

<script type="text/javascript">
$("#removeBtn").click(function() {
	if(confirm("게시글을 삭제 하시겠습니까?")) {
		$("#menu").val("review_remove_action");
		$("#menuForm").submit();
	}
});
$("#replyBtn").click(function() {
	$("#menu").val("review_write");
	$("#menuForm").submit();
});
$("#listBtn").click(function() {
	$("#menu").val("review_list");
	$("#menuForm").submit();
});
</script>
