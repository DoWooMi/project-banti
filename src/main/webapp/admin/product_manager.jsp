<%@page import="java.text.DecimalFormat"%>
<%@page import="xyz.itwill.dto.ProductDTO"%>
<%@page import="xyz.itwill.dao.ProductDAO"%>
<%@page import="java.util.List"%>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/security/admin_check.jspf" %> 
<%List<ProductDTO> productList=ProductDAO.getDAO().selectProductList();%>

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

#btn{
	text-align: right;
	margin-bottom: 0px;
	margin-top: 0px;
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

.p_check { width: 60px; }
.p_pnum { width: 140px; }
.p_name { width: 140px; }
.p_price { width: 140px; }

</style>

<%-- body --%>
<div class="content">
	<h2>제품목록</h2>
	<form name="productForm" id="productForm">
	<div id="btn">
		<button type="button" id="addBtn">제품등록</button>
	</div>
	
	<table>
		<tr>
			<th><input type="checkbox" id="allCheck"></th>	
			<th class="p_pnum">제품번호</th>
			<th class="p_name">제품명</th>
			<th class="p_price">제품가격</th>
		</tr>
		
		<% if(productList.isEmpty()) { %>
		<tr>
			<td colspan="3">검색된 제품이 하나도 없습니다.</td>
		</tr>
		<% } else { %>
			<% for(ProductDTO product:productList) { %>
			<tr>
				<td class="p_check">
					<input type="checkbox" name="checkId" value="<%=product.getP_pnum()%>" class="check">
				</td>
				<td><%=product.getP_pnum() %></td>
				<td>
					<a href="<%=request.getContextPath() %>/index.jsp?menugroup=admin&menu=product_detail&p_pnum=<%=product.getP_pnum()%>">
						<%=product.getP_name() %>
					</a>
				</td>
				<td>
					<%=DecimalFormat.getCurrencyInstance().format(product.getP_price()) %>
				</td>	
			</tr>
			<% } %>
		<% } %>
	</table>
	<br>
	<p><button type="button" id="removeBtn">선택제품삭제</button></p>
	<div id="message" style="color: red;"></div>
	</form>
</div>

<script type="text/javascript">
<%--제품등록--%>
$("#addBtn").click(function() {
	location.href="<%=request.getContextPath()%>/index.jsp?menugroup=admin&menu=product_add";
});

<%--제품선택--%>
$("#allCheck").change(function() {
	if($(this).is(":checked")) {
		$(".check").prop("checked",true);
	} else {
		$(".check").prop("checked",false);
	}
});
<%--제품삭제--%>
$("#removeBtn").click(function() {
	if($(".check").filter(":checked").length==0) {
		$("#message").text("선택된 제품이 하나도 없습니다.");
		return;
	}
	
	$("#productForm").attr("action", "<%=request.getContextPath()%>/index.jsp?menugroup=admin&menu=product_remove_action");
	$("#productForm").attr("method","post");
	$("#productForm").submit();
});

</script>
