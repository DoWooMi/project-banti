<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/security/login_check.jspf" %>     
<%
	//전달값을 반환받아 저장 - 전달값이 없는 경우(새글인 경우) 초기값 저장
	String b_ref="0", b_restep="0",b_relevel="0",pageNum="1";
	if(request.getParameter("b_ref")!=null) {//전달값이 있는 경우(답글인 경우)
		b_ref=request.getParameter("b_ref");
		b_restep=request.getParameter("b_restep");
		b_relevel=request.getParameter("b_relevel");
		pageNum=request.getParameter("pageNum");
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
	           		<% if(b_ref.equals("0")) {//새글인 경우 %>
						새글쓰기
					<% } else {//답글인 경우 %>
						답글쓰기
					<% } %>
					</span>
	        		</h2>
	    		</header>
    		</article>
    		
				<section id="bo_w">
    			
    			<!-- 게시물 작성/삭제 시작 { -->
    			<form action="<%=request.getContextPath()%>/index.jsp?menugroup=board&menu=board_write_action" method="post" id="boardForm">    			
    				<input type="hidden" name="b_ref" value="<%=b_ref%>">	
					<input type="hidden" name="b_restep" value="<%=b_restep%>">	
					<input type="hidden" name="b_relevel" value="<%=b_relevel%>">	
					<input type="hidden" name="pageNum" value="<%=pageNum%>">
				<table>
			<tr>
				<td>
					<select id="board_type" style="height: 25px; border-width:2px !important" required="required" name="b_type">
            			<option value="">분류를 선택하세요</option>
           				<option value="0" name="b_type">질문과답변</option>
						<option value="1" name="b_type">견적요청</option>
        			</select>
					<input type="text" id="b_title" size="40" placeholder ="제목" name="b_title">
					
					<select id="board_status" style="height: 25px; border-width:2px !important" required="required" name="b_status">
            			<option value="">공개여부</option>
           				<option value="2" name="b_status">비밀글</option>
						<option value="1" name="b_status">일반글</option>
        			</select>
					
				</td>	
			</tr>
		<tr>
			<td>
				<textarea rows="7" cols="200" name="b_question" id="b_question"></textarea>
			</td>
		</tr>
		<tr>
			<th>
  
				<a href="<%=request.getContextPath()%>/index.jsp?menugroup=board&menu=board_list" id="cancelBtn" class="btn_cancel btn" style="border-radius: 5px;width: 20px; !important">
				취소</a>
				<button type="submit" class="btn_submit btn" style="border-radius: 5px;width: 100px;!important">작성완료</button>				
			</th>
		</tr>
	</table>	
</form>
		
<div id="message" style="color: red;"></div>
<script type="text/javascript">
$("#b_title").focus();
$("#boardForm").submit(function() {
	if($("#b_title").val()=="") {
		$("#message").text("제목을 입력해 주세요.");
		$("#b_title").focus();
		return false;
	}
	
	if($("#b_question").val()=="") {
		$("#message").text("내용을 입력해 주세요.");
		$("#b_question").focus();
		return false;
	}
});
$("#cancelBtn").click(function() {
	$("#b_title").focus();
	$("#message").text("");
});
</script>

</section>
<!-- } 게시물 작성/수정 끝 -->
		</div>  <!-- } .shop-content 끝 -->
	</div>  <!-- } #container 끝 -->
	
</div> <!-- } #wrapper 전체 콘텐츠 끝 -->

