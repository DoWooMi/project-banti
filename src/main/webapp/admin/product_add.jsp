<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<%@include file="/security/admin_check.jspf" %> 

<style type="text/css">
table {
	margin: 0 auto;
}
td {
	text-align: left;
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
.content {
    margin: 5px;
    padding: 10px;
    min-height: 600px;
    border: 1px solid #BDBDBD;
    border-radius: 20px;
    text-align: center;
}
</style>


<div class="content">
	<h2>제품등록</h2>
	
	<form action="<%=request.getContextPath()%>/index.jsp?menugroup=admin&menu=product_add_action" 
		method="post" enctype="multipart/form-data" id="productForm">
		<table>
			<tr>
				<td>제품번호</td>
				<td>
					<input type="text" name="p_pnum" id="p_pnum">
				</td>
			</tr>

			<tr>
				<td>제품명</td>
				<td>
					<input type="text" name="p_name" id="p_name">
				</td>
			</tr>
			<tr>
				<td>제품가격</td>
				<td>
					<input type="text" name="p_price" id="p_price">
				</td>
			</tr>
			<tr>
				<td>대표이미지</td>
				<td>
					<input type="file" name="p_mainimg" id="p_mainimg">
				</td>
			</tr>
			<tr>
				<td>상세이미지-1</td>
				<td>
					<input type="file" name="p_detailimg1" id="p_detailimg1">
				</td>
			</tr>
			<tr>
				<td>상세이미지-2</td>
				<td>
					<input type="file" name="p_detailimg2" id="p_detailimg2">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="submit">제품등록</button>
					<div id="message" style="color: red;"></div>
				</td>
			</tr>
		</table>	
	</form>
</div>

<script>
$("#productForm").submit(function() {
	
	if($("#p_pnum").val()=="") {
		$("#message").text("제품번호를 입력해 주세요.");
		$("#name").focus();
		return false;
	}

	if($("#p_name").val()=="") {
		$("#message").text("제품명을 입력해 주세요.");
		$("#name").focus();
		return false;
	}

	if($("#p_price").val()=="") {
		$("#message").text("제품가격을 입력해 주세요.");
		$("#name").focus();
		return false;
	}
	
	if($("#p_mainimg").val()=="") {
		$("#message").text("대표이미지를 입력해 주세요.");
		$("#name").focus();
		return false;
	}
	
	if($("#p_detailimg1").val()=="") {
		$("#message").text("상세이미지1을 입력해 주세요.");
		$("#name").focus();
		return false;
	}

	if($("#p_detailimg2").val()=="") {
		$("#message").text("상세이미지2를 입력해 주세요.");
		$("#name").focus();
		return false;
	}
	
	
});	

</script>