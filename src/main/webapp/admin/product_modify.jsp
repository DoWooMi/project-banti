<%@page import="xyz.itwill.dao.ProductDAO"%>
<%@page import="xyz.itwill.dto.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<%@include file="/security/admin_check.jspf" %> 
<%
	//비정상적인 요청에 대한 응답 처리
	if(request.getParameter("p_pnum")==null) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?menugroup=error&menu=error_400';");
		out.println("</script>");
		return;			
	}
	//전달값을 반환받아 저장
	int p_pnum=Integer.parseInt(request.getParameter("p_pnum"));
	
	//제품번호를 전달받아 PRODUCT 테이블에 저장된 해당 제품번호의 제품정보를 검색하여 
	//반환하는 DAO 클래스의 메소드 호출
	ProductDTO product=ProductDAO.getDAO().selectProduct(p_pnum);
	
	//검색된 제품정보가 없는 경우 에러페이지로 이동하여 응답 처리 - 비정상적인 요청
	if(product==null) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?menugroup=error&menu=error_400';");
		out.println("</script>");
		return;
	}
%>
<style type="text/css">
.product {
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

table {
	margin: 0 auto;
    border: 1px solid black;
    border-collapse: collapse;
}
.title {
	background-color: black;
	color: white;
	text-align: center;
	width: 100px;
}
td {
	border: 1px solid black;
	text-align: left;
}
#modBtn2{
	margin: 25px;
	text-align: center;
}
.value {
    padding: 5px;
    text-align: left;
    width: 500px;
}
</style>

<div class="product">
	<h2>제품수정</h2>
	
	<%-- 사용자로부터 파일을 입력받아 요청 페이지로 전달하기 위해서는 반드시 form 태그의
	enctype 속성값을 [multipart/form-data]으로 설정 --%>
	<form action="<%=request.getContextPath() %>/index.jsp?menugroup=admin&menu=product_modify_action" 
		method="post" enctype="multipart/form-data" id="productForm">
		<%-- 변경할 제품정보를 구분하기 위한 식별자로 제품번호 전달 --%>
		<input type="hidden" name="p_pnum" value="<%=product.getP_pnum()%>">
		<%-- 제품 관련 이미지를 변경하지 않을 경우 기존 제품 관련 이미지를 사용하기 위해 전달하거나
		제품 관련 이미지를 변경할 경우 기존 제품 관련 이미지를 서버 디렉토리에서 삭제하기 위해 전달 --%>
		<input type="hidden" name="currentP_mainimg" value="<%=product.getP_mainimg()%>">
		<input type="hidden" name="currentP_detailimg1" value="<%=product.getP_detailimg1()%>">
		<input type="hidden" name="currentP_detailimg2" value="<%=product.getP_detailimg2()%>">
		<table>
			<tr>
				<td class="title">제품명</td>
				<td class="value">
					<input type="text" name="p_name" id="p_name" value="<%=product.getP_name()%>">
				</td>
			</tr>
			<tr>
				<td class="title">대표이미지</td>
				<td class="value">
					<img src="<%=request.getContextPath()%>/product_image/<%=product.getP_mainimg()%>" width="200">
					<br>
					<span style="color: red;">이미지를 수정하지 않을 경우 입력하지 마세요.</span>
					<br>
					<input type="file" name="p_mainimg" id="p_mainimg">
				</td>
			</tr>
			<tr>
				<td class="title">상세이미지-1</td>
				<td class="value">
				<img src="<%=request.getContextPath()%>/product_image/<%=product.getP_detailimg1()%>" width="200">
					<br>
					<span style="color: red;">이미지를 수정하지 않을 경우 입력하지 마세요.</span>
					<br>
					<input type="file" name="p_detailimg1" id="p_detailimg1">
				</td>
			</tr>
			<tr>
				<td class="title">상세이미지-2</td>
				<td class="value">
				<img src="<%=request.getContextPath()%>/product_image/<%=product.getP_detailimg2()%>" width="200">
					<br>
					<span style="color: red;">이미지를 수정하지 않을 경우 입력하지 마세요.</span>
					<br>
					<input type="file" name="p_detailimg2" id="p_detailimg2">
				</td>
			</tr>
			<tr>
				<td class="title">제품가격</td>
				<td class="value">
					<input type="text" name="p_price" id="p_price" value="<%=product.getP_price()%>">
				</td>
			</tr>
		</table>	 
		<p><button type="submit" id="modBtn2">제품수정완료</button></p>
		<div id="message" style="color: red;"></div>
	</form>
	
</div>

<script>
$("#productForm").submit(function() {
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
	
});	
</script>