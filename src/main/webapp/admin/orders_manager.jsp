<%@page import="java.util.List"%>
<%@page import="xyz.itwill.dto.OrdersDTO"%>
<%@page import="xyz.itwill.dao.OrdersDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<%@include file="/security/admin_check.jspf" %> 

<%List<OrdersDTO> ordersList=OrdersDAO.getDAO().selectOrdersList();%>

<style type="text/css">

form {
    display: block;
    margin-top: 0em;
}
.content {
    margin: 5px;
    padding: 10px;
    min-height: 600px;
    border: 1px solid #BDBDBD;
    border-radius: 20px;
    text-align: center;
}
h2 {
    display: block;
    font-size: 1.5em;
    margin-block-start: 0.83em;
    margin-block-end: 0.83em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-weight: bold;
}

#removeBtn{
	margin-top: 25px;
}

table {
    margin: 0 auto;
    border: 1px solid black;
    border-collapse: collapse;
}
tr {
    display: table-row;
    vertical-align: inherit;
    border-color: inherit;
}
th, td {
	border: 1px solid black;
	padding: 3px;
	text-align: center;
	font-size: 12px;
}
th {
	background-color: black;
	color: white;
}

.o_check { width: 60px; }
.o_hewonid { width: 80px; }
.h_phone { width: 140px; }
.o_onum { width: 80px; }
.o_pnum { width: 80px; }
.o_quantity { width: 80px; }
.o_date { width: 80px; }
.o_comment { width: 250px; }

</style>

<%-- body --%>
<div class="content">
	<h2>주문목록</h2>
		<form name="ordersForm" id="ordersForm">
			<table>
				<tr>
					<th><input type="checkbox" id="allCheck"></th>
					<th>아이디</th>
					<th>전화번호</th>
					<th>주문번호</th>
					<th>제품번호</th>
					<th>제품수량</th>							
					<th>배송주소</th>
					<th>주문날짜</th>
					<th>요구사항</th>
					<th>주문상태</th>
				</tr>
					
				<%-- 회원정보 --%>
				<% for(OrdersDTO orders:ordersList) { %>
				<tr>
					<td class="o_check">
						<input type="checkbox" name="checkId" value="<%=orders.getO_onum()%>" class="check">
					</td>
					<td class="o_hewonid"><%=orders.getO_hewonid() %></td>
					<td class="o_phone"><%=orders.getO_phone() %></td>
					<td class="o_onum"><%=orders.getO_onum() %></td>
					<td class="o_pnum"><%=orders.getO_pnum() %></td>
					<td class="o_hewonid"><%=orders.getO_quantity() %></td>					
					<td class="o_address">
						[<%=orders.getO_zipcode() %>]<%=orders.getO_address1() %> <%=orders.getO_address2() %>
					</td>
					<td class="o_date"><%=orders.getO_date() %></td>
					<td class="o_comment"><%=orders.getO_comment() %></td>	
					<td class="o_statusd">
					<select class="o_status" name="<%=orders.getO_hewonid() %>">
						<option value="0" <% if(orders.getO_status()==0) { %> selected="selected" <% } %> >주문확인</option>
						<option value="1" <% if(orders.getO_status()==1) { %> selected="selected" <% } %> >배송준비</option>
						<option value="2" <% if(orders.getO_status()==2) { %> selected="selected" <% } %> >배송중</option>					
						<option value="3" <% if(orders.getO_status()==3) { %> selected="selected" <% } %> >배송완료</option>					
					</select>
				</td>			
			</tr>	
			<% } %>
		</table>
		<p><button type="button" id="removeBtn">선택주문삭제</button></p>
		<div id="message" style="color: red;"></div>
	</form>
</div>				

<script type="text/javascript">
$("#allCheck").change(function() {
	if($(this).is(":checked")) {
		$(".check").prop("checked",true);
	} else {
		$(".check").prop("checked",false);
	}
});
$("#removeBtn").click(function() {
	if($(".check").filter(":checked").length==0) {
		$("#message").text("선택된 주문이 하나도 없습니다.");
		return;
	}
	
	$("#ordersForm").attr("action", "<%=request.getContextPath()%>/index.jsp?menugroup=admin&menu=orders_remove_action");
	$("#ordersForm").attr("method","post");
	
	$("#ordersForm").submit();
});
$(".o_status").change(function() {
	var o_hewonid=$(this).attr("name");
	var o_status=$(this).val();
	
	location.href="<%=request.getContextPath()%>/index.jsp?menugroup=admin&menu=orders_status_action&o_hewonid="+o_hewonid+"&o_status="+o_status;
});
</script>
