<%@page import="java.text.DecimalFormat"%>
<%@page import="java.awt.Image"%>
<%@page import="xyz.itwill.dao.ProductDAO"%>
<%@page import="xyz.itwill.dto.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
.detail {
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

#modBtn1{
	margin: 25px;
	text-align: center;
}

table {
	margin: 0 auto;
	border: 1px solid black;
	border-collapse: collapse;	
}
td {
	border: 1px solid black;
}
.title {
	background-color: black;
	color: white;
	text-align: center;
	width: 100px;
}
.value {
	padding: 5px;
	text-align: left;
	width: 500px;
}
</style>
<div class="detail">
<h2>제품상세정보</h2>
<table>
	<tr>
		<td class="title">제품번호</td>
		<td class="value"><%=product.getP_pnum() %></td>
	</tr>
	<tr>
		<td class="title">제품명</td>
		<td class="value"><%=product.getP_name() %></td>
	</tr>
	<tr>
		<td class="title">대표이미지</td>
		<td class="value">
			<img src="<%=request.getContextPath()%>/product_image/<%=product.getP_mainimg()%>" width="200">
		</td>
	</tr>
	<tr>
		<td class="title">상세이미지1</td>
		<td class="value">
			<img src="<%=request.getContextPath()%>/product_image/<%=product.getP_detailimg1()%>" width="200">
		</td>
	</tr>
	<tr>
		<td class="title">상세이미지2</td>
		<td class="value">
			<img src="<%=request.getContextPath()%>/product_image/<%=product.getP_detailimg2()%>" width="200">
		</td>
	</tr>
	<tr>
		<td class="title">제품가격</td>
		<td class="value"><%=DecimalFormat.getInstance().format(product.getP_price()) %>원</td>
	</tr>
</table>
<p><button type="button" id="modBtn1" onclick="location.href='<%=request.getContextPath()%>/index.jsp?menugroup=admin&menu=product_modify&p_pnum=<%=product.getP_pnum()%>';">제품정보수정</button></p>
</div>
