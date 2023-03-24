<%@page import="java.text.DecimalFormat"%>
<%@page import="xyz.itwill.dao.CartDAO"%>
<%@page import="xyz.itwill.dto.ProductDTO"%>
<%@page import="xyz.itwill.dao.OrdersDAO"%>
<%@page import="xyz.itwill.dto.OrdersDTO"%>
<%@page import="xyz.itwill.dto.HewonDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>

</script>
<!-- } 상단 끝 -->
<%@include file="/security/login_url.jspf" %>
<%

	List<OrdersDTO> ordersList=OrdersDAO.getDAO().selecthewonOrders(loginHewon.getH_hewonid());
		

%>


<style type="text/css">
.tbl_head03 td {
    background: #fff;
    background-clip: padding-box;
    padding: 25px 15px;
    border-top: 1px solid #ccd2d9;
    border-left: 1px solid #f6f6f6;
    line-height: 1.5em;
    word-break: break-all;
}

.ordertable {
    width: 30px;
    text-align: center;
}
td {
    margin: 0;
    padding: 0;
    font-size: 13px;
    font-family: 'Noto Sans KR', sans-serif;
    font-weight: 400;
    letter-spacing: -0.02em;
}
.tbl_wrap table {
    width: 100%;
    border-collapse: collapse;
    border-spacing: 0;
}

table {
    text-indent: initial;
}

p {
	align-content: center;
	margin: 0;
    padding: 0;
    font-size: 13px;
    color: #333;
    line-height: 1.6em;
    font-family: 'Noto Sans KR', sans-serif;
    font-weight: 400;
    letter-spacing: -0.02em;
}
</style>

<div id="wrapper" style="clear:both;">  
	<!-- 콘텐츠 시작 { -->
	<div id="container">
	 	<!-- .shop-content 시작 { -->
		<div class="shop-content">
			<div id="wrapper_title">마이페이지</div>
				<!-- 마이페이지 시작 { -->
				<div id="smb_my">
				    <!-- 회원정보 개요 시작 { -->
				    <section id="smb_my_ov">
				        <h2>회원정보 개요</h2>
				        
				       <div class="smb_me">
					        <strong class="my_ov_name"><img src="http://bant.co.kr/img/no_profile.gif" alt="profile_image"><br><%=loginHewon.getH_name() %></strong>
					        <br>
					        <a href="<%=request.getContextPath()%>/index.jsp?menugroup=hewon&menu=password_confirm&action=modify" >정보수정</a>
					        <a href="<%=request.getContextPath()%>/index.jsp?menugroup=login&menu=hewon_logout_action">로그아웃</a>
				        </div>
				        
				        <ul id="smb_private">
					    	<li>
					    		&nbsp;&nbsp;&nbsp;
					            <button type="button" class="win_point" id="orderpoint">
									<i class="fa fa-database" aria-hidden="true"></i>보유 포인트&nbsp;&nbsp;
					            </button>
					        </li>
					    </ul>
					    
				        <h3>내정보</h3>
				        <dl class="op_area">
				            <dt>연락처</dt>
				            <dd><%=loginHewon.getH_phone() %></dd>
				            <dt>E-Mail</dt>
				            <dd><%=loginHewon.getH_email() %></dd>
				            <dt>최종접속일시</dt>
				            <dd><%=loginHewon.getH_lastlogin() %></dd>
				            <dt>회원가입일시</dt>
				            <dd><%=loginHewon.getH_joindate() %></dd>
				            <dt id="smb_my_ovaddt">주소</dt>
				            <dd id="smb_my_ovaddd">&nbsp;&nbsp;[<%=loginHewon.getH_zipcode() %>]&nbsp;&nbsp;<%=loginHewon.getH_address1() %>&nbsp;&nbsp;<%=loginHewon.getH_address2() %></dd>
				        </dl>
				        
				        <a href="<%=request.getContextPath()%>/index.jsp?menugroup=hewon&menu=password_confirm&action=remove" class="withdrawal" >회원탈퇴</a>
				    </section>
				    <!-- } 회원정보 개요 끝 -->
				
					<div id="smb_my_list">
					    <!-- 최근 주문내역 시작 { -->
					    <section id="smb_my_od">
					        <h2>주문내역조회</h2>
	        
							<!-- 주문 내역 목록 시작 { -->
							
							<div class="tbl_head03 tbl_wrap">
							    <table>
								    <thead>
									    <tr>
									        <th scope="col">주문서번호</th>
									        <th scope="col">주문일시</th>
									        <th scope="col">주문수량</th>
									        <th scope="col">주문금액</th>
									        <th scope="col">상태</th>
									    </tr>
								    </thead>
							    	<tbody>
							    		<%if(ordersList==null) {%>
							   			 <tr>
							   			 	<td colspan="7" class="empty_table">주문 내역이 없습니다.</td>
							   			 </tr>    
							    		<%} else {%> 
							    		<% for(OrdersDTO myshopping:ordersList) {%>
							    		<% ProductDTO orderproduct=OrdersDAO.getDAO().selectProduct(myshopping.getO_pnum()); %>  
							   			 <tr>
							   			 	<td class="ordertable" id="ordersnumber"><%=myshopping.getO_onum() %></td>
							   			 	<td class="ordertable" id="ordersdate"><%=myshopping.getO_date() %></td>
							   			 	<td class="ordertable" id="ordersproductqty"><%=myshopping.getO_quantity() %></td>
							   			 	<td class="ordertable" id="ordersprice"><%=DecimalFormat.getCurrencyInstance().format(myshopping.getO_quantity()*orderproduct.getP_price()) %></td>
							   			 	<% if(myshopping.getO_status()==0) {%>
							   			 		<td class="ordertable" id="ordersstatus">주문확인</td>
									    		<%}else if(myshopping.getO_status()==1) { %>
							   			 		<td class="ordertable" id="ordersstatus">배송준비</td>
									    		<%}else if(myshopping.getO_status()==2) { %>
							   			 		<td class="ordertable" id="ordersstatus">배송중</td>
									    		<%}else if(myshopping.getO_status()==3) { %>
							   			 		<td class="ordertable" id="ordersstatus">배송완료</td>
							    			<%} %>
							   			 </tr>    
							    		<%} %>
							    		<%} %>
							   	    </tbody>
							    </table>
							</div>
							<!-- } 주문 내역 목록 끝 -->	

	    </section>
	    <!-- } 최근 주문내역 끝 -->

	</div>
</div>

<script>

$("#orderpoint").click(function() {
	window.open("<%=request.getContextPath()%>/order/order_point.jsp","point","width=800,height=300,left=700,top=400");
});





</script>
<!-- } 마이페이지 끝 -->
		</div>  <!-- } .shop-content 끝 -->
	</div>  <!-- } #container 끝 -->
</div> <!-- } #wrapper 전체 콘텐츠 끝 -->



