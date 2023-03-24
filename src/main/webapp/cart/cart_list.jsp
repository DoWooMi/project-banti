<%@page import="xyz.itwill.dto.HewonDTO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="xyz.itwill.dao.CartDAO"%>
<%@page import="java.util.List"%>
<%@page import="xyz.itwill.dto.CartDTO"%>
<%@page import="xyz.itwill.dto.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/banti0.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/banti1.css">
<%@include file="/security/login_url.jspf" %>
<%
	
	List<CartDTO> cartList=CartDAO.getDAO().selectCartList(loginHewon.getH_hewonid());//장바구니 목록

	int cartCount=CartDAO.getDAO().selectCartCount(loginHewon.getH_hewonid());//장바구니 총수량
	
	
%>

<style type="text/css">
.chk_box input[type="checkbox"]:checked  {
    background: url(../img/chk.png) no-repeat 50% 50% #3a8afd;
    border-color: #1471f6;
    border-radius: 3px;
}
.chk_box input[type="checkbox"] {
    position: absolute;
    top: 2px;
    left: 0;
    width: 15px;
    height: 15px;
    display: block;
    margin: 0;
    border: 1px solid #d0d4df;
}
*, :after, :before {
    box-sizing: border-box;
}
.chk_box input[type="checkbox"]:checked +label {
    color: #000;
}
.chk_box input[type="checkbox"] + label{
    padding-left: 20px;
}
.chk_box input[type="checkbox"] +label {
    position: relative;
    padding-left: 20px;
}
.tbl_head03 td {
    background: #fff;
    background-clip: padding-box;
    padding: 25px 15px;
    border-top: 1px solid #ccd2d9;
    border-left: 1px solid #f6f6f6;
    line-height: 1.5em;
    word-break: break-all;
}

.td_chk {
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
li {
    display: list-item;
    line-height: 1.6em;
    font-family: 'Noto Sans KR', sans-serif;
    font-weight: 400;
    letter-spacing: -0.02em;
    list-style: none;
}
#sod_bsk #sod_bsk_tot li {
    float: left;
    font-size: 1.167em;
    border-left: 1px solid #ddd;
}
#sod_bsk #sod_bsk_tot li:first-child {
	
    border: 0;
}
@media (max-width: 480px)
#sod_bsk #sod_bsk_tot li {
    width: 50%;
    padding: 10px;
    text-align: right;
    height: auto;
}
@media (max-width: 768px)
#sod_bsk #sod_bsk_tot li[class~=sod_bsk_dvr] {
    background: #fff !important;
    color: #000;
}
#sod_bsk #sod_bsk_tot li[class~=sod_bsk_pt] {
    background: #f8f8f8 !important;
    color: #000;
}
#sod_bsk #sod_bsk_tot li {
    border-left: 1px solid #ddd;
}
#sod_bsk #sod_bsk_tot li {
    float: right;
    width: 45%;
    text-align: right;
    padding: 25px;
    font-size: 1.167em;
}
#sod_bsk #sod_bsk_tot .sod_bsk_cnt {
    width: 33.335%;
    background: #212a37;
    color: #fff;
    text-align: right;
    padding: 25px;
    font-size: 1.167em;
}

#smalltotal {
	width: 300px;
}

</style>
<div id="wrapper" style="clear:both;">
	<div id="container">
		<div class="shop-content">
			<div id="wrapper_title">장바구니</div>
			
		
<div id="sod_bsk" class="od_prd_list">
	<form action="" name="frmcartlist" id="sod_bsk_list" class="2017_renewal_itemform" method="post">
		<div class="tbl_head03 tbl_wrap">
			<table>
				<thead>
					<tr>
						<th scope="col" class="chk_box">
							<input type="checkbox" id="ct_all" checked="checked" class="selec_chk">
							<label for="ct_all">
								<span></span>
							</label>
						</th>
						<th scope="col" style="width: 400px;">상품명</th>	
						<th scope="col">총수량</th>	
						<th scope="col">판매가</th>	
						<th scope="col">배송비</th>	
						<th scope="col">소계</th>
					</tr>
				</thead>
				<tbody>
						<% if(cartCount==0) { //장바구니에 상품이 없는 경우%>
					<tr>
						<td colspan="7" class="empty_table">장바구니에 담긴 상품이 없습니다.</td>
					</tr>	
							<% } else {%>
							<% for(CartDTO cart :cartList) { %>
							<%ProductDTO cartproduct= CartDAO.getDAO().selectProduct(cart.getC_pnum());%>
					<tr>		
						<td class="td_chk chk_box">
							<input type="checkbox" name="check" id="cartcheck<%=cart.getC_cnum() %>" value="<%=cart.getC_cnum() %>" checked="checked" class="selec_chk">
							<label for="cartcheck<%=cart.getC_cnum() %>" >
							<span><input type="hidden" name="p_pnum" value="<%=cartproduct.getP_pnum()%>"></span>
							</label>
						</td>
						<td class="td_prd">
						
							<div class="sod_img">
								<a href="">
									<img src="<%=request.getContextPath()%>/product_image/<%=cartproduct.getP_mainimg()%>" width="80" height="80" alt="title">
								</a>
							</div>

							<div class="sod_name">
								<input type="hidden" name="it_id[0]" value="BG420">
								<input type="hidden" name="it_name[0]" value="BG420">
									<a href="" class="prd_name">
										<b><%=cartproduct.getP_name() %></b>
									</a>
								<div class="sod_opt">
									<ul>
										<li>제품번호 : <%=cart.getC_pnum() %></li>
										<li>FREE SIZE</li>
									</ul>
								</div>
								<div class="sod_option_btn">
									
								</div>
							</div>		
						</td>	
						<td class="td_num"><input type="hidden" name="Pquantity" value="<%=cart.getC_quantity() %>"><%=cart.getC_quantity() %></td>	
						<td class="td_numbig"><%=DecimalFormat.getCurrencyInstance().format(cartproduct.getP_price()) %></td>	
							
						<td class="td_dvr">무료배송</td>
						<%String smalltotal=DecimalFormat.getCurrencyInstance().format(cartproduct.getP_price()*cart.getC_quantity()); %>	
						<td class="td_numbig text_right"><span id="smalltotal" class="total_prc"><input type="hidden" id="smalltotal" name="smalltotal"><%=smalltotal%></span></td>
					</tr>
							<% } %>
						<% } %>
				</tbody>		
			</table>
			<div class="btn_cart_del">
				<button type="button" id="checkdelete">선택삭제</button>
				<button type="button" id="alldelete" name="alldelete" value="all">비우기</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id="message" style="color: red;"></span>
			</div>
		</div>
		<div id="sod_bsk_tot">
			<ul>
				<% int total=0; %>
				<% for(CartDTO cart :cartList) {%>
				<%ProductDTO cartproduct= CartDAO.getDAO().selectProduct(cart.getC_pnum());%>
				<% int smalltotal=cartproduct.getP_price()*cart.getC_quantity(); %>
				<% total=total+smalltotal; %>
				<%} %>
				<% String Ctotal=DecimalFormat.getCurrencyInstance().format(total);%>
				<li class="sod_bsk_cnt"><span>총금액</span><strong><%=Ctotal %></strong>원</li>
			</ul>
         </div>
		<div id="sod_bsk_act">
			<input type="hidden" name="url" value="index.jsp">
			<input type="hidden" name="records" value="2">
			<input type="hidden" name="act" value="index.jsp">
			<a href="index.jsp" class="btn01">쇼핑 계속하기</a>
			<button type="button" onclick="return form_check('buy');" class="btn_submit">주문하기</button>
		</div>	
	</form>	
</div>	
</div>
</div>
</div>



<script>


$("#ct_all").change(function() {
	if($(this).is(":checked")) {
		$(".selec_chk").prop("checked",true);
	} else {
		$(".selec_chk").prop("checked",false);
	}
});



$("#checkdelete").click(function() {
	if($(".selec_chk").filter(":checked").length==0) {
		$("#message").text("선택된 상품이 하나도 없습니다.");
		return;
	}
	
	$("#sod_bsk_list").attr("action", "<%=request.getContextPath()%>/index.jsp?menugroup=cart&menu=cart_remove_action");
	$("#sod_bsk_list").attr("method","post");
	$("#sod_bsk_list").submit();
});


$("#alldelete").click(function() {
	$("#sod_bsk_list").attr("action", "<%=request.getContextPath()%>/index.jsp?menugroup=cart&menu=cart_removeall_action");
	$("#sod_bsk_list").attr("method","post");
	$("#sod_bsk_list").submit();
});


$(".btn_submit").click(function() {
	if($(".selec_chk").filter(":checked").length==0) {
		$("#message").text("선택된 상품이 하나도 없습니다.");
		return;
	}
	
	$("#sod_bsk_list").attr("action", "<%=request.getContextPath()%>/index.jsp?menugroup=payment&menu=paymentform_cart");
	$("#sod_bsk_list").attr("method","post");
	$("#sod_bsk_list").submit();
});



</script>

