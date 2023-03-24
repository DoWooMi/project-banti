<%@page import="xyz.itwill.dto.HewonDTO"%>
<%@page import="xyz.itwill.dao.BoardDAO"%>
<%@page import="xyz.itwill.dto.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	if(request.getParameter("b_bnum")==null) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?menugroup=error&menu=error_400';");
		out.println("</script>");
		return;			
	}
	
	int b_bnum=Integer.parseInt(request.getParameter("b_bnum"));
	String pageNum=request.getParameter("pageNum");
	String search=request.getParameter("search");
	String keyword=request.getParameter("keyword");
	
	BoardDTO board=BoardDAO.getDAO().selectBoard(b_bnum);
	
	if(board==null || board.getB_status()==0) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?menugroup=error&menu=error_400';");
		out.println("</script>");
		return;
	}
	
	HewonDTO loginHewon=(HewonDTO)session.getAttribute("loginHewon");
	
	if(board.getB_status()==2) {//비밀 게시글인 경우
		//비로그인 사용자이거나 로그인 사용자가 게시글 작성자 또는 관리자가 아닌 경우 에러페이지로 이동
		// => 권한이 없는 사용자가 JSP 문서를 요청한 경우 - 비정상적인 요청
		if(loginHewon==null || !loginHewon.getH_hewonid().equals(board.getB_hewonid()) && loginHewon.getH_status()!=2) {
			out.println("<script type='text/javascript'>");
			out.println("location.href='"+request.getContextPath()+"/index.jsp?menugroup=error&menu=error_400';");
			out.println("</script>");
			return;
		}
	}
%>

<link rel="stylesheet" href="http://www.bant.co.kr/theme/daontheme_shop01/skin/board/daon_basic/style.css?ver=191202">
<link rel="stylesheet" href="http://www.bant.co.kr/theme/daontheme_shop01/skin/latest/daon_shop_basic/style.css?ver=191202">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<div id="wrapper" style="clear:both;">  
	<!-- 콘텐츠 시작 { -->
	<div id="container">
		<!-- .shop-content 시작 { -->
		<div class="shop-content">
			<div id="wrapper_title">문의/견적요청</div>	
			<article id="bo_v" >
    		<header>
        		<h2 id="bo_v_title">
            	<span class="bo_v_tit">
           		<% if(board.getB_status()==2) {//비밀 게시글인 경우 %>
					[비밀글]
				<% } %>				
				<%=board.getB_title() %>
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
    		<%=board.getWriter() %>
				<% if(loginHewon!=null && loginHewon.getH_status()==2) {//관리자인 경우 %>
					[관리자]
				<% } %>
    	</td>
  	</tr>
	<tr>
	    <td class="tg-0lax" >
	    	<%=board.getB_date() %>
	    </td>
	</tr>
	</table>
</div>
</section>

<section id="bo_v_atc" >
<table>
	<tr >
    	<td id="bo_v_con">
    		<%=board.getB_question().replace("\n", "<br>") %>
    	</td>
  	</tr>	  
</table>
</section>
	<div class="view_bt">
		
	        <ul class="btn_bo_user bo_v_com">
				<li><button class="btn_b011 btn" type="button" id="listBtn" style="color: gray"><i class="fa fa-list" aria-hidden="true"></i> 목록</button></li>
				<% if(loginHewon!=null) { %>
				<li><button class="btn_b011 btn" type="button" id="replyBtn" style="color: gray"><i class="fa fa-reply" aria-hidden="true"></i> 답변</button></li>
	            <% } %>
	            <% if(loginHewon!=null && (loginHewon.getH_hewonid().equals(board.getB_hewonid())|| loginHewon.getH_status()==2)) { %>   											      
				<li><button  class="btn_b011 btn" type="button" id="removeBtn" style="color: gray"><i class="fa fa-trash" aria-hidden="true"></i> 삭제</button></li>
				<% } %>
		    </ul>
		   			
	      </div>
		</div>  <!-- } .shop-content 끝 -->
	</div>  <!-- } #container 끝 -->
	
</div> <!-- } #wrapper 전체 콘텐츠 끝 -->

	<%-- 요청 페이지에 값을 전달하기 위한 form 태그 --%>
	<form action="<%=request.getContextPath()%>/index.jsp" method="get" id="menuForm">
		<input type="hidden" name="menugroup" value="board">
		<input type="hidden" name="menu" id="menu">
	
		<%-- [글변경] 및 [글삭제]를 클릭한 경우 전달되는 값 --%>
		<input type="hidden" name="b_bnum" value="<%=board.getB_bnum()%>">
		
		<%-- [글변경] 및 [글목록]를 클릭한 경우 전달되는 값 --%>
		<input type="hidden" name="pageNum" value="<%=pageNum%>">
		<input type="hidden" name="search" value="<%=search%>">
		<input type="hidden" name="keyword" value="<%=keyword%>">
		
		<%-- [답글쓰기]를 클릭한 경우 전달되는 값 --%>
		<input type="hidden" name="b_ref" value="<%=board.getB_ref()%>">
		<input type="hidden" name="b_restep" value="<%=board.getB_restep()%>">
		<input type="hidden" name="b_relevel" value="<%=board.getB_relevel()%>">
	</form>

<script type="text/javascript">
$("#removeBtn").click(function() {
	if(confirm("게시글을 삭제 하시겠습니까?")) {
		$("#menu").val("board_remove_action");
		$("#menuForm").submit();
	}
});
$("#replyBtn").click(function() {
	$("#menu").val("board_write");
	$("#menuForm").submit();
});
$("#listBtn").click(function() {
	$("#menu").val("board_list");
	$("#menuForm").submit();
});
</script>
