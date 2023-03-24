<%@page import="xyz.itwill.dto.HewonDTO"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="xyz.itwill.dto.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="xyz.itwill.dao.BoardDAO"%>
<link rel="stylesheet" href="http://www.bant.co.kr/theme/daontheme_shop01/skin/board/daon_basic/style.css?ver=191202">
<link rel="stylesheet" href="http://www.bant.co.kr/theme/daontheme_shop01/skin/latest/daon_shop_basic/style.css?ver=191202">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- BOARD 테이블에 저장된 게시글을 검색하여 게시글 목록을 클라이언트에게 전달하는 JSP 문서 --%>
<%-- => 게시글 목록을 페이지로 구분 검색하여 응답 처리 - 페이징 처리 --%>
<%-- => [페이지 번호]를 클릭한 경우 게시글목록 출력페이지(board_list.jsp)로 이동 - 페이지번호,검색대상(컬럼명),검색단어 전달 --%>    
<%-- => [검색]을 클릭한 경우 게시글목록 출력페이지(board_list.jsp)로 이동 - 검색대상(컬럼명),검색단어 전달 --%>
<%-- => [글쓰기]를 클릭한 경우 게시글 입력페이지(board_write.jsp)로 이동 - 로그인 사용자에게만 링크 제공 --%>
<%-- => 게시글의 [제목]을 클릭한 경우 게시글 출력페이지(board_detail.jsp)로 이동 - 글번호,페이지번호,검색대상(컬럼명),검색단어 전달 --%>    
<%
	//검색대상과 검색단어를 반환받아 저장
	String search=request.getParameter("search");
	if(search==null) {
		search="";
	}
	
	String keyword=request.getParameter("keyword");
	if(keyword==null) {
		keyword="";
	}
	
	//페이징 처리 관련 전달값(요청 페이지 번호)를 반환받아 저장
	// => 요청 페이지 번호에 대한 전달값이 없는 경우 첫번째 페이지의 게시글 목록을 검색하여 응답
	int pageNum=1;
	if(request.getParameter("pageNum")!=null) {//전달값이 있는 경우
		pageNum=Integer.parseInt(request.getParameter("pageNum"));
	}
	
	//하나의 페이지에 검색되어 출력될 게시글의 갯수 설정 - 전달값을 반환받아 저장 가능
	int pageSize=10;
		
	//검색 관련 정보를 전달받아 BOARD 테이블에 저장된 특정 게시글의 갯수를 검색하여 반환하는
	//DAO 클래스의 메소드 호출 - 검색 기능 구현시 호출하는 메소드
	int totalBoard=BoardDAO.getDAO().selectBoardCount(search, keyword);
	            
	//전체 페이지의 갯수를 계산하여 저장
	//int totalPage=totalBoard/pageSize+totalBoard%pageSize==0?0:1;
	int totalPage=(int)Math.ceil((double)totalBoard/pageSize);
	  
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
	if(endRow>totalBoard) {
		endRow=totalBoard;
	}
	
	//검색 관련 정보 및 요청 페이지에 대한 시작 게시글의 행번호와 종료 게시글의 행번호를 
	//전달받아 BAORD 테이블에 저장된 특정 게시글에서 해당 범위의 게시글만을 검색하여 반환하는 
	//DAO 클래스의 메소드 호출 - 검색 기능 구현시 호출하는 메소드
	List<BoardDTO> boardList=BoardDAO.getDAO().selectBoardList(startRow, endRow, search, keyword);
	
	//세션에 저장된 권한 관련 정보를 반환받아 저장
	// => 로그인 사용자에게만 글쓰기 권한 제공
	// => 비밀 게시글인 경우 로그인 사용자가 게시글 작성자이거나 관리자인 경우에만 접근 권한 제공
	HewonDTO loginHewon=(HewonDTO)session.getAttribute("loginHewon");
	
	//서버 시스템의 현재 날짜를 반환받아 저장
	// => 게시글의 작성날짜를 현재 날짜와 비교하여 구분 출력
	String currentDate=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
	
	//요청 페이지에 검색되어 출력될 게시글의 일련번호에 대한 시작값을 계산하여 저장
	//ex)전체 게시글의 갯수 : 91 >> 1Page : 91~82, 2Page : 81~72, 3Page : 71~62,...
	int printNum=totalBoard-(pageNum-1)*pageSize;
%>     


<style type="text/css">
</style>
<div id="wrapper" style="clear:both";>
	<div id="container">
		<div class="shop-content">
			<!-- 게시판 카테고리 시작 { -->
			<div id="wrapper_title">전체 문의</div>
			<div id="bo_list" style="width:100%">
        		<div id="bo_cate" >
        			<ul id="bo_cate_ul">
            			<li><a href="<%=request.getContextPath()%>/index.jsp?menugroup=board&menu=board_list" id="bo_cate_on">전체</a></li>
            			<li><a href="<%=request.getContextPath()%>/index.jsp?menugroup=board&menu=board_list_qna">질문과답변</a></li>
            			<li><a href="<%=request.getContextPath()%>/index.jsp?menugroup=board&menu=board_list_quot">견적요청</a></li>
            		</ul>
    			</div>
    			<!-- } 게시판 카테고리 끝 -->
    		
    		<%-- 사용자로부터 검색어를 입력받아 게시글 검색 기능 구현 --%>
			<form action="<%=request.getContextPath()%>/index.jsp?menugroup=board&menu=board_list" method="post">	
    		<!-- 게시판 페이지 정보 및 버튼 시작 -->
    		<div id="bo_btn_top">
       			<div id="bo_list_total">
            		<span>Total <%=totalBoard%>건 <%=pageNum%> 페이지</span>            		
        		</div>
        		
			<%-- 게시글 목록 출력 --%>
        		<ul class="btn_bo_user">
        	    	<li>
      				<select name="search" style="width:80px;height:25px;">
						<option value="b_name" selected="selected">&nbsp;작성자&nbsp;</option>
						<option value="b_title">&nbsp;제목&nbsp;</option>
						<option value="b_question">&nbsp;내용&nbsp;</option>
					</select>
					<input type="text" name="keyword">
						<button type="submit" class="btn_bo_sch btn_b01 btn" title="게시판 검색">
							<i class="fa fa-search" aria-hidden="true"></i>
							<span class="sound_only">게시판 검색</span>
						</button>
            		</li>
            	</ul>
    		</div>
    		</form>
   	 		<!-- 게시판 페이지 정보 및 버튼 끝 -->
   	 		<div class="tbl_head01 tbl_wrap">
        		<table>
       				<thead>
        				<tr>
	                        <th scope="col">번호</th>
				            <th scope="col" style="width: 700px;">제목</th>
				            <th scope="col" class="lview">작성자</th>
	                        <th scope="col" class="lview" >날짜</th>
			    		</tr>
			    	</thead>	
			    	
		    		<%-- 검색글이 없을경우 --%>
		    		<% if(totalBoard==0) { %>
						<tr>
							<td colspan="4"><span class="bo_tit" style="text-align: center;">검색된 게시글이 없습니다.</span></td>
						</tr>	
						
					<% } else { %>
						<% for(BoardDTO board:boardList) { %>
							<tr>
							<%-- 번호 --%>
							<td class="td_num2"  style="font-weight:bold;"><%=printNum %></td>
							<% printNum--; %>
					
							<%-- 제목 --%>
							<td class="subject">
								<div class="bo_tit">
								<%-- 게시글이 답글인 경우에 대한 응답 처리 --%>
								<% if(board.getB_restep()!=0) {//게시글이 답글인 경우 %>
									<%-- 게시글의 깊이에 의해 왼쪽 여백을 다르게 설정하여 응답되도록 처리 --%>
									<span style="margin-left: <%=board.getB_relevel()*20%>px;">└[답글]</span>
								<% } %>
								
								<%-- 게시글 상태를 구분하여 제목과 링크를 다르게 설정하여 응답되도록 처리 --%>
								<% if(board.getB_status()==1) {//일반 게시글인 경우 %>
									<%-- <a href="#" class="bo_cate_link">일반</a> --%>
									<a href="<%=request.getContextPath()%>/index.jsp?menugroup=board&menu=board_detail&b_bnum=<%=board.getB_bnum() %>&pageNum=<%=pageNum%>&search=<%=search%>&keyword=<%=keyword%>">
										<%=board.getB_title() %>
									</a>
									
								<% } else if(board.getB_status()==2) {//비밀 게시글인 경우 %>
								
									<span class="b_type">[비밀글]&nbsp <i class="fa fa-lock" aria-hidden="true"></i></span>
									<%-- 로그인 사용자가 작성자이거나 관리자인 경우 --%>
								
									<% if(loginHewon!=null && (loginHewon.getH_hewonid().equals(board.getB_hewonid()) 
											|| loginHewon.getH_status()==2)) { %>
										
										<a href="<%=request.getContextPath()%>/index.jsp?menugroup=board&menu=board_detail&b_bnum=<%=board.getB_bnum() %>&pageNum=<%=pageNum%>&search=<%=search%>&keyword=<%=keyword%>">
											<%=board.getB_title() %>
										</a>		
										
									<% } else { %>
										작성자 또는 관리자만 확인 가능합니다.
									<% } %>		
								<% } else if(board.getB_status()==0) {//삭제 게시글인 경우 %>
									<span class="remove">[삭제글]&nbsp <i class="fa fa-remove" aria-hidden="true"></i> </span>
									작성자 또는 관리자에 의해 삭제된 게시글입니다.	
								<% } %>
								</div>
							</td>
				
							<% if(board.getB_status()!=0) {//삭제 게시글이 아닌 경우 %>
							<%-- 작성자 --%>
							<td class="td_num lview"><%=board.getWriter() %></td>
						
							<%-- 작성일 : 오늘 작성된 게시글은 시간만 출력하고 오늘 작성된 게시글이
							아닌 게시글은 날짜와 시간 출력 --%>
							<td class="td_datetime lview"> 
								<% if(currentDate.equals(board.getB_date().substring(0,10))) {//오늘 작성된 게시글인 경우 %>
									<%=board.getB_date().substring(11) %>
								<% } else {//오늘 작성된 게시글이 아닌 경우 %>
									<%=board.getB_date() %>
								<% } %>
							</td>
							<% } else {//삭제 게시글인 경우 %>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<% } %>
						</tr>
					<% } %>	
				<% } %>
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
		<a href="<%=request.getContextPath()%>/index.jsp?menugroup=board&menu=board_list&pageNum=<%=startPage-blockSize%>&search=<%=search%>&keyword=<%=keyword%>" >[이전]</a>
	<% } %>
	
	<% for(int i=startPage;i<=endPage;i++) { %>
		<% if(pageNum!=i) {//요청 페이지 번호와 이벤트 페이지 번호가 다른 경우 - 링크 제공 %>			
			<a href="<%=request.getContextPath()%>/index.jsp?menugroup=board&menu=board_list&pageNum=<%=i%>&search=<%=search%>&keyword=<%=keyword%>">[<%=i %>]</a>			
		<% } else {//요청 페이지 번호와 이벤트 페이지 번호가 같은 경우 - 링크 미제공 %>
			[<%=i %>]
		<% } %>	
	<% } %>
	
	<% if(endPage!=totalPage) {//마지막 페이지 블럭이 아닌 경우 %>
		<a href="<%=request.getContextPath()%>/index.jsp?menugroup=board&menu=board_list&pageNum=<%=startPage+blockSize%>&search=<%=search%>&keyword=<%=keyword%>">[다음]</a>
	<% } %>
	</span></nav>
	

	<% if(loginHewon!=null) {//로그인 사용자가 JSP 문서를 요청한 경우 %>
		<div class="bo_fx">
    	<ul class="btn_bo_user">
        	<li><a href="<%=request.getContextPath()%>/index.jsp?menugroup=board&menu=board_write" class="btn_b011 btn" title="글쓰기" >
        	<i class="fa fa-pen" aria-hidden="true"></i>
        	<span class="">글쓰기</span></a></li>     
        </ul>	       
    </div>
    <% } %>
       		    
		    	</div><!-- } 게시판 목록 끝 -->
		</div><!-- } .shop-content 끝 -->
		</div>
	</div><!-- } #container 끝 -->
</div><!-- } #wrapper 전체 콘텐츠 끝 -->
