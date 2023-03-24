<%@page import="java.text.DecimalFormat"%>
<%@page import="xyz.itwill.dao.ProductDAO"%>
<%@page import="xyz.itwill.dto.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<%@include file="/security/login_url.jspf" %>
<%
	
	if(request.getMethod().equals("GET")) {
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/index.jsp?menugroup=error&menu=error_400';");
	out.println("</script>");
	return;
	}	

	String o_pnum=request.getParameter("p_pnum");
	String o_quantity=request.getParameter("Pquantity");
	
	ProductDTO product=ProductDAO.getDAO().selectProduct(Integer.parseInt(o_pnum) );
%> 
<style type="text/css">
#totalpayfrom {
	text-align: center;
}
#paymentform {
	display: inline-block;
	width: 70%
}
.error {
	color: red;
	position: relative;
	display: none;
}
#paymentform h2 {
    padding: 20px;
    border-bottom: 1px solid #ececec;
    background-color: #f7f7f7;
    margin: 0 0 10px;
    font-size: 1.25em;
}
h2 {
    margin: 0 ;
    padding: 0;
    font-size: 20px;
    color: #333;
    line-height: 1.6em;
    font-family: 'Noto Sans KR', sans-serif;
    font-weight: bold;
    letter-spacing: -0.02em;
}
#paymentform ul {
    padding: 20px;
}
ul {
    margin: 0;
    padding: 0;
    font-size: 13px;
    color: #333;
    line-height: 1.6em;
    font-family: 'Noto Sans KR', sans-serif;
    font-weight: 400;
    letter-spacing: -0.02em;
    list-style: none;
}
li label {
	display: block;
    margin-bottom: 10px;
    line-height: 24px;
	margin-right: 20px;
}
section {
	align-content: center;
	text-align: left;
	margin: 10px auto;
}
div {
	align-content: center;
    margin: 10px;
    padding: 0;
    font-size: 13px;
    color: #333;
    line-height: 1.6em;
    font-family: 'Noto Sans KR', sans-serif;
    font-weight: 400;
    letter-spacing: -0.02em;
    display: block;
}
#wrapper_title {
    margin: 0px 0;
    font-size: 1.7em;
    font-weight: bold;
}
#sod_frm_paysel {
	text-align: center;
	margin: 10px auto;
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
.sod_img img {
	float: left;
}


</style>




<!-- .shop-content 시작 { -->
<div id="totalpayfrom" style="clear:both;">
<form name="paymentform" id="paymentform" method="post" action="<%=request.getContextPath()%>/index.jsp?menugroup=payment&menu=payment_action">
<div class="shop-content" id="paymentform">
<div id="wrapper_title">주문서 작성</div>

		<div class="tbl_head03 tbl_wrap">
			<table>
				<thead>
					<tr>
						<th scope="col" style="width: 400px;">상품명</th>	
						<th scope="col">총수량</th>	
						<th scope="col">판매가</th>	
						<th scope="col">배송비</th>	
						<th scope="col">소계</th>
					</tr>
				</thead>
				<tbody>
					<tr >		
						<td class="td_prd">
						
							<div class="sod_img">
								<a href="">
									<img src="<%=request.getContextPath()%>/product_image/<%=product.getP_mainimg()%>" width="100" height="100" alt="title">
								</a>
							</div>
							
	
							<div class="sod_name" style="text-align: left;">
								<input type="hidden" name="it_id[0]" value="BG420">
								<input type="hidden" name="it_name[0]" value="BG420">
								<input type="hidden" name="p_pnum" value="<%=product.getP_pnum() %>">
									<a href="" class="prd_name">
										<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=product.getP_name() %></b>
									</a>
								<div class="sod_opt">
									<ul>
										<li>제품번호 : <%=product.getP_pnum() %></li>
										<li>사이즈FREE</li>
									</ul>
								</div>
								<div class="sod_option_btn">
								</div>
							</div>		
						</td>	
						<td class="td_num"><input type="hidden" name="pay_quantity" value="<%=o_quantity %>"><%=o_quantity %></td>	
						<td class="td_numbig"><%=DecimalFormat.getCurrencyInstance().format(product.getP_price())%></td>	
						<td class="td_dvr">무료배송</td>
						<%String total=DecimalFormat.getCurrencyInstance().format(Integer.parseInt(o_quantity)*product.getP_price()); %>
						<td class="td_numbig text_right"><span id="smalltotal" class="total_prc"><input type="hidden" name="pay_total" value="<%=Integer.parseInt(o_quantity)*product.getP_price() %>"><%=total %></span></td>
					</tr>
				</tbody>		
			</table>
		</div>	


	<section id="sod_frm_orderer">
    	<h2>주문하시는 분</h2>
        <div class="tbl_frm01 tbl_wrap">
        	<ul>
                <li>
                	<label for="name">이름</label>
                	<input type="text" name="od_name" value=<%=loginHewon.getH_name()%> id="od_name" class="frm_input">
                	<div id="nameMsg" class="error">이름을 입력해 주세요.</div>
                </li>
                <li>
                	<label for="hp">핸드폰</label>
                	<input type="text" name="od_hp" value=<%=loginHewon.getH_phone() %> id="od_hp" class="frm_input">
                	<div id="phoneMsg" class="error">핸드폰 번호를 입력해 주세요.</div>
                	<br>
                </li>
                <li>우편번호
                    <button type="button" id="postSearch" class="btn_address" >우편번호 검색</button>
                    <input type="text" name="od_zip" value=<%=loginHewon.getH_zipcode() %> id="od_zip" class="frm_input" size="8" readonly="readonly">
                	<div id="zipMsg" class="error">우편번호를 입력해 주세요.</div>
                    <br>
                </li>
                <li>
                	<label for="addr1">기본주소</label>
                    <input type="text" name="od_addr1" value=<%=loginHewon.getH_address1() %> id="od_addr1" class="frm_input frm_address required" size="60" >
                	<div id="addr1Msg" class="error">기본주소를 입력해 주세요.</div>
                </li>
                <li>
                	<label for="addr2">상세주소</label>
                    <input type="text" name="od_addr2" value=<%=loginHewon.getH_address2() %> id="od_addr2" class="frm_input frm_address" size="60" placeholder="상세주소">
                	<div id="addr2Msg" class="error">상세주소를 입력해 주세요.</div>
                    <br>
                </li>
                <li>
                	<label for="email">E-mail</label>
                	<input type="text" name="od_email" value=<%=loginHewon.getH_email() %> id="od_email" class="frm_input" size="35" >
                	<div id="emailMsg" class="error">이메일 주소를 입력해 주세요.</div>
                </li>
         	</ul>
      	</div>
	</section>
<!-- } 주문하시는 분 입력 끝 -->




<!-- 받으시는 분 입력 시작 { -->
    <section id="sod_frm_taker">
    <h2>받으시는 분</h2>
    	<div class="tbl_frm01 tbl_wrap">
        	<ul>
               	<li>배송지선택
					<div class="order_choice_place">
                       	<input type="radio" name="ad_sel_addr" value="same" id="ad_sel_addr_same" checked="checked">
						<label for="ad_sel_addr_same">주문자와 동일</label>&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" name="ad_sel_addr" value="new" id="od_sel_addr_new">
						<label for="od_sel_addr_new">신규배송지</label>
					</div>
                </li>
                
                
                <li><label for="od_b_name">이름</label>
                	<input type="text" name="od_b_name" id="od_b_name" class="frm_input required" value=<%=loginHewon.getH_name() %>>
                	<div id="nameMsg2" class="error">이름을 입력해 주세요.</div>
                </li>
                <li><label for="od_b_hp">핸드폰</label>
                	<input type="text" name="od_b_hp" id="od_b_hp" class="frm_input required" value=<%=loginHewon.getH_phone() %>>
                	<div id="phoneMsg2" class="error">핸드폰 번호를 입력해 주세요.</div>
                </li>
                <li>우편번호
                    <button type="button" id="postSearch2" class="btn_address" >우편번호 검색</button>
                    <input type="text" name="od_zip2" value=<%=loginHewon.getH_zipcode() %> id="od_zip2"  class="frm_input required" maxlength="6">
                	<div id="zipMsg2" class="error">우편번호를 입력해 주세요.</div>
                    <br>
                </li>
                <li>기본주소
                    <input type="text" name="od_addr12" value=<%=loginHewon.getH_address1() %> id="od_addr12"  class="frm_input required">
                	<div id="addr1Msg2" class="error">기본주소를 입력해 주세요.</div>
                </li>
                <li>상세주소
                    <input type="text" name="od_addr22" value=<%=loginHewon.getH_address2() %> id="od_addr22" class="frm_input required">
                	<div id="addr2Msg2" class="error">상세주소를 입력해 주세요.</div>
                    <br>
                </li>
				<li><label for="od_memo">전하실말씀 (단체주문서)</label>
                	<textarea rows="3" cols="80" name="od_memo" id="od_memo"></textarea>
                </li>
            </ul>
    	</div>
	</section>
<!-- } 받으시는 분 입력 끝 -->
	
	

	
	
	
	
	
	<section id="paymentmethod" >
	<div class="sod_right" style="border : 1px solid #ececec; float: right; ">
	    <!-- 결제정보 입력 시작 { -->
	    <h2>결제정보</h2>
        <div id="od_tot_price">
            <span>총 주문금액</span>
            <strong class="print_price"><%=DecimalFormat.getCurrencyInstance().format(Integer.parseInt(o_quantity)*product.getP_price()) %></strong>원
        </div>
	        
	        
			<div class="od_pay_buttons_el">
	  		<h2>결제수단</h2>    
	        <fieldset id="sod_frm_paysel">
		        <legend>결제방법 선택</legend>
		        	<input type="radio" id="od_settle_bank" name="od_settle_case" value=0> 
		        	<label for="od_settle_bank" class="lb_icon bank_icon">계좌이체</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" id="od_settle_card" name="od_settle_case" value=1 checked="checked"> 
					<label for="od_settle_card" class="lb_icon card_icon">신용카드</label>
					
					
					<div id="settle_bank" style="display:none;">
					<label for="od_bank_account" class="sound_only">입금할 계좌</label>
					<select name="od_bank_account" id="od_bank_account">
						<option value="">선택하십시오.</option>
						<option value="농협 박전광 3018000840811">농협 박전광 3018000840811</option>
					</select>
					<br>
					<label for="od_deposit_name">입금자명</label>
					<input type="text" name="od_deposit_name" id="od_deposit_name" size="10" maxlength="20">
					</div>
					
			</fieldset>            
			</div>
	        <!-- } 결제 정보 입력 끝 -->
	
	        
		<div id="display_pay_button" class="btn_confirm">
		    <button type="submit" value="주문하기" class="btn_submit">주문하기</button>
		    <button type="button" class="btn01">취소</button>
		</div>
	</div>
	</section>       
</div>
</form>
</div>
<br>
<br>
<br>




<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">


$('input[name="ad_sel_addr"]').change(function(){
	if($("#od_sel_addr_new").is(":checked")) {
		$('input[class="frm_input required"]').prop("value","")	
	} else {
		$("#od_b_name").prop("value",$("#od_name").val())
		$("#od_b_hp").prop("value",$("#od_hp").val())
		$("#od_zip2").prop("value",$("#od_zip").val())
		$("#od_addr12").prop("value",$("#od_addr1").val())
		$("#od_addr22").prop("value",$("#od_addr2").val())
		
	}
});




$("#postSearch").click(function() {
	new daum.Postcode({
	    oncomplete: function(data) {
	        $("#od_zip").val(data.zonecode);
	        $("#od_addr1").val(data.address);
	    }
	}).open();
});



$("#postSearch2").click(function() {
	new daum.Postcode({
	    oncomplete: function(data) {
	        $("#od_zi2p").val(data.zonecode);
	        $("#od_addr12").val(data.address);
	    }
	}).open();
});



$('input[name="od_settle_case"]').change(function(){
	if($("#od_settle_card").is(":checked")) {
		$("#settle_bank").css("display","none")
	} else if ($("#od_settle_bank").is(":checked")){
		$("#settle_bank").css("display","block")
	}
});




$("#paymentform").submit(function() {
	var submitResult=true
	
	$(".error").css("display","none");
	
	if($("#od_name").val()=="") {
		$("#nameMsg").css("display","block");
		submitResult=false;
	}
		
	if($("#od_hp").val()=="") {
		$("#phoneMsg").css("display","block");
		submitResult=false;
	}
	
	if($("#od_zip").val()=="") {
		$("#zipMsg").css("display","block");
		submitResult=false;
	}
	
	if($("#od_addr1").val()=="") {
		$("#addr1Msg").css("display","block");
		submitResult=false;
	}
	
	if($("#od_addr2").val()=="") {
		$("#addr2Msg").css("display","block");
		submitResult=false;
	}
	
	if($("#od_email").val()=="") {
		$("#emailMsg").css("display","block");
		submitResult=false;
	}
	
	if($("#od_b_name").val()=="") {
		$("#nameMsg2").css("display","block");
		submitResult=false;
	}
		
	if($("#od_b_hp").val()=="") {
		$("#phoneMsg2").css("display","block");
		submitResult=false;
	}
	
	if($("#od_zip2").val()=="") {
		$("#zipMsg2").css("display","block");
		submitResult=false;
	}
	
	if($("#od_addr12").val()=="") {
		$("#addr1Msg2").css("display","block");
		submitResult=false;
	}
	
	if($("#od_addr22").val()=="") {
		$("#addr2Msg2").css("display","block");
		submitResult=false;
	}
	
	if ($("#od_settle_bank").is(":checked") && $("#od_deposit_name").val()==""){
		alert("임금자명을 입력해주세요.")
		submitResult=false;
	}
	return submitResult;

});


</script>



