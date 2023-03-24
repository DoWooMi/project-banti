<%@page import="xyz.itwill.dao.ProductDAO"%>
<%@page import="java.util.List"%>
<%@page import="xyz.itwill.dto.ProductDTO"%>
<%@page import="xyz.itwill.dao.ReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
int totalReview=ReviewDAO.getDAO().selectReviewCount();
%>

<!doctype html>
<html lang="ko">
<head>
<style type="text/css">
#productqty{
	font-weight: bold;
	font-size: 30px;
	text-align: right;
	border: 1px solid #cdcdcd;
	margin: 0 0 10px;
    height: 50px;
    padding: 0 10px;
	
}
.qty {
	text-align: right;
}
#producttotalprice {
	border: 1px solid #cdcdcd;
	margin: 0 0 10px;
    height: 50px;
    padding: 0 10px;
    line-height: 50px;
    
}
#sit_sel_option {
	display: none;
}

</style>

<title>삐에로 반티 풀세트/졸업사진 컨셉/맥도날드 &gt; 반티세트 | 반티세트</title>
<%-- 주석처리후 Header 검은색으로 나오는 부분 해결 --%>
<%--<link rel="stylesheet" href="http://www.bant.co.kr/theme/daontheme_shop01/css/default_shop.css?ver=191202">--%>

<%-- 주석처리해도 변화 없음 --%>
<%--<link rel="stylesheet" href="http://www.bant.co.kr/js/font-awesome/css/font-awesome.min.css?ver=191202">--%>

<%-- 주석처리해도 변화 없음 --%>
<%--<link rel="stylesheet" href="http://www.bant.co.kr/js/owlcarousel/owl.carousel.css?ver=191202">--%>

<%-- 주석처리하면 이미지 위치 틀어짐 --%>
<link rel="stylesheet" href="http://www.bant.co.kr/theme/daontheme_shop01/skin/shop/daon/style.css?ver=191202">

<%-- 주석처리해도 변화 없음 --%>
<%--<link rel="stylesheet" href="http://www.bant.co.kr/theme/daontheme_shop01/skin/outlogin/shop_basic_mobile/style.css?ver=191202">--%>

<%-- 주석처리해도 변화 없음 --%>
<%--<link rel="stylesheet" href="http://www.bant.co.kr/theme/daontheme_shop01/skin/outlogin/shop_side/style.css?ver=191202">--%>

<%-- 주석처리해도 변화 없음 --%>
<%--<link rel="stylesheet" href="http://www.bant.co.kr/theme/daontheme_shop01/skin/latest/daon_shop_basic/style.css?ver=191202">--%>


<script>
// 자바스크립트에서 사용하는 전역변수 선언
var g5_url       = "http://www.bant.co.kr";
var g5_bbs_url   = "http://www.bant.co.kr/bbs";
var g5_is_member = "";
var g5_is_admin  = "";
var g5_is_mobile = "";
var g5_bo_table  = "";
var g5_sca       = "";
var g5_editor    = "";
var g5_cookie_domain = "";
var g5_theme_shop_url = "http://www.bant.co.kr/theme/daontheme_shop01/shop";
var g5_shop_url = "http://www.bant.co.kr/shop";
</script>
<script src="http://www.bant.co.kr/js/jquery-1.12.4.min.js"></script>
<script src="http://www.bant.co.kr/js/jquery-migrate-1.4.1.min.js"></script>
<script src="http://www.bant.co.kr/js/jquery.shop.menu.js?ver=191202"></script>
<script src="http://www.bant.co.kr/js/common.js?ver=191202"></script>
<script src="http://www.bant.co.kr/js/wrest.js?ver=191202"></script>
<script src="http://www.bant.co.kr/js/placeholders.min.js"></script>
<script src="http://www.bant.co.kr/js/owlcarousel/owl.carousel.min.js"></script>
<script src="http://www.bant.co.kr/js/jquery.bxslider.js"></script>
<script src="http://www.bant.co.kr/js/shop.category.navigation.js"></script>
</head>
<body>
<link href="http://www.bant.co.kr/theme/daontheme_shop01/shop/html/css_js/font.css?ver=191202" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="http://www.bant.co.kr/theme/daontheme_shop01/shop/html/css_js/css.php?fname=Y29tbW9u&type=css&token=V2VkbmVzZGF5Mjh0aG9mRGVjZW1iZXIyMDIyMDk6NDk6MjhBTV8xNjcyMTg4NTY4" />
<link rel="stylesheet" href="http://www.bant.co.kr/theme/daontheme_shop01/shop/html/css_js/swiper.min.css">
<script src="http://www.bant.co.kr/theme/daontheme_shop01/shop/html/css_js/swiper.min.js"></script>
<script src="http://www.bant.co.kr/theme/daontheme_shop01/shop/html/css_js/swiper-animation.min.js"></script>
<script src="http://www.bant.co.kr/theme/daontheme_shop01/shop/html/css_js/jquery.mb.YTPlayer.js"></script>
<link href="http://www.bant.co.kr/theme/daontheme_shop01/shop/html/css_js/core.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="http://www.bant.co.kr/theme/daontheme_shop01/shop/html/css_js/animate.css">
<script>

jQuery(function ($){
	
	var active_class = "btn_sm_on",
	side_btn_el = "#quick .btn_sm",
	quick_container = ".qk_con";
	
	
	$(".btn_member_mn").on("click", function() {
        $(".member_mn").toggle();
        $(".btn_member_mn").toggleClass("btn_member_mn_on");
	});
    
	$(document).on("click", ".sop_bt", function(e){
		$(".side_mn_wr1").show();
		$("#side_menu").stop().animate({'right':'0px'},500);	
		$(this).removeClass('sop_bt');		 
		$(this).addClass('scl_bt');		 	 
		$(this).find('i').removeClass('fa-chevron-left'); 	 
		$(this).find('i').addClass('fa-chevron-right');				
	});
	
	$(document).on("click", ".scl_bt", function(e){
	$(".side_mn_wr1").show();
	$("#side_menu").stop().animate({'right':'-281px'},500);	
	$(this).removeClass('scl_bt');		 
	$(this).addClass('sop_bt');		 	 
	$(this).find('i').removeClass('fa-chevron-right'); 	 
	$(this).find('i').addClass('fa-chevron-left');	
	$(side_btn_el).removeClass(active_class);
 	});


   	$(document).on("click", side_btn_el, function(e){
       	e.preventDefault();	
       	var $this = $(this);
        
      	 	if (!$this.hasClass(active_class)) {
           	$(side_btn_el).removeClass(active_class);
           	$this.addClass(active_class);
       	}
		$(quick_container).hide();		

		if( $this.hasClass("btn_sm_cl1") ){
            $(".side_mn_wr1").fadeIn();
   	    } else if( $this.hasClass("btn_sm_cl2") ){
       	    $(".side_mn_wr2").fadeIn();
        } else if( $this.hasClass("btn_sm_cl3") ){
        	$(".side_mn_wr3").fadeIn();
		} else if( $this.hasClass("btn_sm_cl4") ){
			$(".side_mn_wr4").fadeIn();
		}
	}).on("click", ".con_close", function(e){
		$(quick_container).fadeOut();
 		$(side_btn_el).removeClass(active_class);
	});

	$(window).scroll(function(){
		$(".scl_bt").trigger("click");
	});
	

	$("#top_btn").on("click", function() {
		$("html, body").animate({scrollTop:0}, '500');
		return false;
    });
});
</script>
<%
	
	List<ProductDTO> productList=ProductDAO.getDAO().selectProductList();
	String p_pnum=request.getParameter("p_pnum");
	ProductDTO product=ProductDAO.getDAO().selectProduct(Integer.parseInt(p_pnum));
%>

<div id="wrapper" style="clear:both;">  
		<!-- 콘텐츠 시작 { -->
	<div id="container">

	 	<!-- .shop-content 시작 { -->
		<div class="shop-content is_item">
					
			<div id="wrapper_title">삐에로 반티 풀세트/졸업사진 컨셉/맥도날드 &gt; 반티세트</div>
			<div id="text_size">
				<button class="no_text_resize" onclick="font_resize('container', 'decrease');">작게</button>
				<button class="no_text_resize" onclick="font_default('container');">기본</button>
				<button class="no_text_resize" onclick="font_resize('container', 'increase');">크게</button>
			</div>
		
			<script>
			jQuery(function($){
			    $(document).ready(function() {
			        $("#sct_location select").on("change", function(e){
			            var url = $(this).find(':selected').attr("data-url");
			            
			            if (typeof itemlist_ca_id != "undefined" && itemlist_ca_id === this.value) {
			                return false;
			            }
			
			            window.location.href = url;
			        });
			
					$("select.shop_hover_selectbox").shop_select_to_html();
			    });
			});
			</script>
			
			<!-- 상품 상세보기 시작 { -->
			<script src="http://www.bant.co.kr/js/shop.js"></script>
			<div id="sit">
			    <div id="sit_ov_from">
					<form name="fitem" method="post" id="detailForm">
					<input type="hidden" name="it_id[]" value="BG420">
					<input type="hidden" name="sw_direct">
					<input type="hidden" name="url">
					<input type="hidden" id="p_pnum" name="p_pnum" value="<%=p_pnum%>">
				
					<div id="sit_ov_wrap">
				    	<!-- 상품이미지 미리보기 시작 { -->
				    	<div id="sit_pvi">
				       		<div id="sit_pvi_big">
				        		<a href="http://www.bant.co.kr/shop/largeimage.php?it_id=BG420&amp;no=1" target="_blank" class="popup_item_image">
				        			<img src="<%=request.getContextPath()%>/product_image/<%=product.getP_mainimg()%>" width="645" height="645" alt="">
				        		</a>
				        		<a href="http://www.bant.co.kr/shop/largeimage.php?it_id=BG420&amp;no=2" target="_blank" class="popup_item_image">
				        			<img src="<%=request.getContextPath()%>/product_image/<%=product.getP_detailimg1()%>" width="645" height="645" alt="">
				        		</a>
								<a href="http://www.bant.co.kr/shop/largeimage.php?it_id=BG420&amp;no=1" target="_blank" id="popup_item_image" class="popup_item_image" style="border: none;">
									<i class="fa fa-search-plus" aria-hidden="true" ></i>
									<span class="sound_only">확대보기</span>
								</a>
				        	</div>
				        	<ul id="sit_pvi_thumb">
				        		<li>
				        			<a href="#none" class="img_thumb">
				        				<img src="<%=request.getContextPath()%>/product_image/<%=product.getP_detailimg1()%>" width="150" height="150" alt="">
				        				<span class="sound_only"> 1번째 이미지 새창</span>
				        			</a>
				        		</li>
				        		<li >
				        			<a href="#none" class="img_thumb">
				        				<img src="<%=request.getContextPath()%>/product_image/<%=product.getP_detailimg2()%>" width="150" height="150" alt="">
				        				<span class="sound_only"> 2번째 이미지 새창</span>
				        			</a>
				        		</li>
				        	</ul>	    
				        </div>
				    	<!-- } 상품이미지 미리보기 끝 -->
				
				    	<!-- 상품 요약정보 및 구매 시작 { -->
				    	<section id="sit_ov" class="2017_renewal_itemform">
				        	<h2 id="sit_title"><%=product.getP_name() %><span class="sound_only">요약정보 및 구매</span></h2>
				        	<p id="sit_desc">상하의 세트 or 상의 or 하의 (신발은 소품)</p>
				        	        
				        	<div id="sit_star_sns">
					        	<br>
					            <div id="sit_btn_opt">					       
					            	<button type="button" class="btn_sns_share"><i class="fa fa-share-alt" aria-hidden="true"></i><span class="sound_only">sns 공유</span></button>
					            	<div class="sns_area">
					            		<a href="https://www.facebook.com/sharer/sharer.php?u=http%3A%2F%2Fwww.bant.co.kr%2Fshop%2Fitem.php%3Fit_id%3DBG420&amp;p=%EC%82%90%EC%97%90%EB%A1%9C+%EB%B0%98%ED%8B%B0+%ED%92%80%EC%84%B8%ED%8A%B8%2F%EC%A1%B8%EC%97%85%EC%82%AC%EC%A7%84+%EC%BB%A8%EC%85%89%2F%EB%A7%A5%EB%8F%84%EB%82%A0%EB%93%9C+%7C+%EB%B0%98%ED%8B%B0%EC%84%B8%ED%8A%B8" class="share-facebook" target="_blank"><img src="http://www.bant.co.kr/theme/daontheme_shop01/skin/shop/daon/img/facebook.png" alt="페이스북에 공유"></a> <a href="https://twitter.com/share?url=http%3A%2F%2Fwww.bant.co.kr%2Fshop%2Fitem.php%3Fit_id%3DBG420&amp;text=%EC%82%90%EC%97%90%EB%A1%9C+%EB%B0%98%ED%8B%B0+%ED%92%80%EC%84%B8%ED%8A%B8%2F%EC%A1%B8%EC%97%85%EC%82%AC%EC%A7%84+%EC%BB%A8%EC%85%89%2F%EB%A7%A5%EB%8F%84%EB%82%A0%EB%93%9C+%7C+%EB%B0%98%ED%8B%B0%EC%84%B8%ED%8A%B8" class="share-twitter" target="_blank"><img src="http://www.bant.co.kr/theme/daontheme_shop01/skin/shop/daon/img/twitter.png" alt="트위터에 공유"></a> <a href="https://plus.google.com/share?url=http%3A%2F%2Fwww.bant.co.kr%2Fshop%2Fitem.php%3Fit_id%3DBG420" class="share-googleplus" target="_blank"><img src="http://www.bant.co.kr/theme/daontheme_shop01/skin/shop/daon/img/gplus.png" alt="구글플러스에 공유"></a>	            		<a href="javascript:popup_item_recommend('BG420');" id="sit_btn_rec"><i class="fa fa-envelope-o" aria-hidden="true"></i><span class="sound_only">추천하기</span></a>
					            	</div>
					        	</div>
				        	</div>
				        <script>
				        $(".btn_sns_share").click(function(){
				            $(".sns_area").show();
				        });
				        $(document).mouseup(function (e){
				            var container = $(".sns_area");
				            if( container.has(e.target).length === 0)
				            container.hide();
				        });
				        </script>
			
				        			<div class="sit_info">
				            		<table class="sit_ov_tbl">
				            		<colgroup>
				                		<col class="grid_3">
				               			<col>
				            		</colgroup>
				            		<tbody>   	
				            		<tr class="tr_price">
				                		<th scope="row"><strong>판매가격</strong></th>
				               	 		<td>
				            				<strong><%=product.getP_price() %>원 (풀세트 가격)</strong>
				                    		<input type="hidden" id="it_price" value="<%=product.getP_price() %>">
				               			</td>
			            			</tr>      	            	
				            		<tr>
				                		<th scope="row">브랜드</th>
				                		<td><font color="red">반티</font></td>
				            		</tr>
									<tr>
				                		<th scope="row">원산지</th>
				                		<td>한국/중국</td>
				            		</tr>	
				            	   	
									<tr>
				               			<th>배송비 안내</th>
										<td>3,000원(10만원이상 무료배송)</td>
				            		</tr>
									<tr>
				               			<th>최소구매수량</th>
				                		<td>100 개</td>
				            		</tr>
								</tbody>
				            </table>
				        </div>
						<div id="btn_option">
						<div class="sl_option">
						
						<!-- 선택옵션 시작 -->
				        <section class="sit_option">
							<h3><font color="red"><b>선택옵션(복수선택가능)</b></font></h3>
				 
				          	<div class="get_item_options">
							<label for="it_option_1"></label>
							<span>
								<select id="it_option_1" class="it_option">
									<option value="">선택</option>
									<option value="삐에로 FREE,0,9999">상하의 세트 FREE&nbsp;&nbsp;+ 0원</option>
								</select>
							</span>
							</div>
				        </section>
						<!-- 선택옵션 끝 --> 
				        	
						<!-- 추가옵션 시작 { -->
				        <section  class="sit_option">
				            <h3><font color="red"><b>추가옵션(인쇄옵션/1벌 할인옵션)</b></font></h3>
				            <div class="get_item_supply">
								<label for="it_supply_1" class="label-title">★한 벌 할인★</label>
								<span class="td_sit_sel">
									<select id="it_supply_1" class="it_supply">
										<option value="">★한 벌 할인★</option>
										<%-- 
										<option value="삐에로 25세트 이상 구매시 1세트 할인,-19000,9998">삐에로 25세트 이상 구매시 1세트 할인&nbsp;&nbsp; -19,000원</option>
										--%>
									</select>
								</span>
							</div>
							<div class="get_item_supply">
								<label for="it_supply_2" class="label-title">인쇄</label>
								<span class="td_sit_sel">
									<select id="it_supply_2" class="it_supply">
										<option value="">인쇄</option>
										<%-- 
										<option value="각자닉네임_가슴,2000,9999">각자닉네임_가슴&nbsp;&nbsp;+ 2,000원</option>
										<option value="각자닉네임_등판,2000,9974">각자닉네임_등판&nbsp;&nbsp;+ 2,000원</option>
										<option value="각자백넘버,2000,9999">각자백넘버&nbsp;&nbsp;+ 2,000원</option>
										<option value="각자백넘버+닉네임,4000,9999">각자백넘버+닉네임&nbsp;&nbsp;+ 4,000원</option>
										<option value="공통인쇄_단색(30장이상),1000,9999">공통인쇄_단색(30장이상)&nbsp;&nbsp;+ 1,000원</option>
										<option value="공통인쇄_단색(20장이상),1500,9999">공통인쇄_단색(20장이상)&nbsp;&nbsp;+ 1,500원</option>
										<option value="공통인쇄_칼라(20장이상),3000,9999">공통인쇄_칼라(20장이상)&nbsp;&nbsp;+ 3,000원</option>
										--%>
									</select>
								</span>
							</div>
							<div class="get_item_supply">
								<label for="it_supply_3" class="label-title">맥도날드 인쇄</label>
								<span class="td_sit_sel">
									<select id="it_supply_3" class="it_supply">
										<option value="">맥도날드 인쇄</option>
										<%-- 
										<option value="맥도날드 인쇄 왼쪽가슴,2000,9993">맥도날드 인쇄 왼쪽가슴&nbsp;&nbsp;+ 2,000원</option>
										--%>
									</select>
								</span>
							</div>
				        </section>
				        <!-- } 추가옵션 끝 -->
				        	
				        	    <!-- 선택된 옵션 시작 { -->
				        		<section id="sit_sel_option">
									<h3>선택된 옵션</h3>
				            	</section>
				            	
				            	
				            	<div id="productqty"  >
									<span style="font-weight: bold; font-size: 15px; float: left; color: red; vertical-align: middle;">수량</span>
									<button type="button" id="sub">&nbsp;&nbsp;-&nbsp;&nbsp;</button>
									<input id="Pquantity" name="Pquantity" type="number" class="qty" value="1" size="5">
									<button type="button" id="add">&nbsp;&nbsp;+&nbsp;&nbsp;</button>
								</div>
								
								<div id="producttotalprice" style="text-align: right;">
									<span style="font-weight: bold; font-size: 15px; float: left; color: red; vertical-align: middle;">총금액</span><input type="hidden" id="totalPrice" name="totalPrice">
									<span class="totalPrice"></span>원
								</div>
								        		<!-- } 선택된 옵션 끝 -->
				
				       			<!-- 총 구매액
						        <div id="sit_tot_price"></div>	
						         --> 
								<div id="sit_ov_btn">
									<button type="submit" onclick="submitcheck1();" value=0 class="sit_btn_cart" >장바구니</button>
									<button type="submit" onclick="submitcheck2();" value=1 class="sit_btn_buy" >바로구매</button>
									<a href="javascript:item_wish(document.fitem, 'BG420');" class="sit_btn_wish"><i class="fa fa-heart" aria-hidden="true" style="margin-top: 15px;"></i><span class="sound_only">위시리스트</span></a>  	            			
								</div>
							</div>
						</div>
						<script>
						$(function (){
							$(".btn_cart_op").click(function(){
								$("#btn_option").show();
							});
							$("#btn_option .btn_close").click(function(){
								$("#btn_option").hide();
							});
						});
						</script>
						
			
				
				        <script>
				        // 상품보관
				        function item_wish(f, it_id) {
				            f.url.value = "http://www.bant.co.kr/shop/wishupdate.php?it_id="+it_id;
				            f.action = "http://www.bant.co.kr/shop/wishupdate.php";
				            f.submit();
				        }
				
				        // 추천메일
				        function popup_item_recommend(it_id){
				            if(!g5_is_member) {
				                if(confirm("회원만 추천하실 수 있습니다."))
				                	document.location.href = "http://www.bant.co.kr/bbs/login.php?url=http%3A%2F%2Fwww.bant.co.kr%2Fshop%2Fitem.php%3Fit_id%3DBG420";
				            } else {
				                url = "./itemrecommend.php?it_id=" + it_id;
				                opt = "scrollbars=yes,width=616,height=420,top=10,left=10";
				                popup_window(url, "itemrecommend", opt);
				            }
				        }
				
				        // 재입고SMS 알림
				        function popup_stocksms(it_id) {
				            url = "http://www.bant.co.kr/shop/itemstocksms.php?it_id=" + it_id;
				            opt = "scrollbars=yes,width=616,height=420,top=10,left=10";
				            popup_window(url, "itemstocksms", opt);
				        }
				        </script>
				    </section>
				    <!-- } 상품 요약정보 및 구매 끝 -->
				</div>
				<!-- 다른 상품 보기 시작 { -->
			    <div id="sit_siblings">
				    <span class="sound_only">이 분류에 등록된 다른 상품이 없습니다.</span>
				</div>   
			    <!-- } 다른 상품 보기 끝 -->
			</form>
		</div>

		<script>
		
		
		
		
		
		
		$(function(){
		    // 상품이미지 첫번째 링크
		    $("#sit_pvi_big a:first").addClass("visible");
		
		    // 상품이미지 미리보기 (썸네일에 마우스 오버시)
		    $("#sit_pvi .img_thumb").bind("mouseover focus", function(){
		        var idx = $("#sit_pvi .img_thumb").index($(this));
		        $("#sit_pvi_big a.visible").removeClass("visible");
		        $("#sit_pvi_big a:eq("+idx+")").addClass("visible");
		    });
			
		    // 상품이미지 크게보기
		    $(".popup_item_image").click(function() {
		        var url = $(this).attr("href");
		        var top = 10;
		        var left = 10;
		        var opt = 'scrollbars=yes,top='+top+',left='+left;
		        popup_window(url, "largeimage", opt);
			
		        return false;
		    });
		});
		
		
		var qnty=1;
		var price=$("#it_price").val();
		$("#totalPrice").val(qnty*price);
		$(".totalPrice").text(qnty*price);

		$("#Pquantity").val(qnty);
		
		
		$("#add").click(function() {
			qnty++;
			$("#Pquantity").val(qnty);
			$("#totalPrice").val(qnty*price);
			$(".totalPrice").text(qnty*price);
		});

		$("#sub").click(function() {
			qnty--;
			$("#Pquantity").val(qnty);
			$("#totalPrice").val(qnty*price);
			$(".totalPrice").text(qnty*price);

		});
		
		
		function submitcheck1() {
		
		    // 판매가격이 0 보다 작다면
		    if (document.getElementById("it_price").value < 0) {
		        alert("전화로 문의해 주시면 감사하겠습니다.");
		        return false;
		    }
			
		    if($(".sit_opt_list").size() < 1) {
		        alert("상품의 선택옵션을 선택해 주십시오.");
		        return false;
		    }
			
			
			if ($("#Pquantity").val() <100){
				alert("100개 이상 주문 부탁드립니다.");
		        return false;	
			}
			
			$("#detailForm").attr("action","index.jsp?menugroup=cart&menu=cart_list_action");
			return true;
		}
		
		
		
		function submitcheck2() {
			
		    // 판매가격이 0 보다 작다면
		    if (document.getElementById("it_price").value < 0) {
		        alert("전화로 문의해 주시면 감사하겠습니다.");
		        return false;
		    }
			
		    if($(".sit_opt_list").size() < 1) {
		        alert("상품의 선택옵션을 선택해 주십시오.");
		        return false;
		    }
			
			
			if ($("#Pquantity").val() <100){
				alert("100개 이상 주문 부탁드립니다.");
		        return false;	
			}
			
		    $("#detailForm").attr("action","index.jsp?menugroup=payment&menu=paymentform");
			return true;
		}	

			
		
		
	
		    

		</script>
		<script src="http://www.bant.co.kr/js/shop.override.js"></script>
    
		<script src="http://www.bant.co.kr/js/viewimageresize.js"></script>

<!------------- 관련상품 삭제-------------->

		<section id="sit_info">
			<div id="sit_tab" style="width: 100%">
				<ul class="tab_tit" style="width: 100%">
	      			<li style="position:relative; width:33%;" ><button type="button" rel="#sit_inf" class="selected">상품정보</button></li>
			        <li style="position:relative; width:33%;"><button type="button" rel="#sit_use">사용후기 </button></li>
			        <%-- 
			        <li><button type="button" rel="#sit_qa">상품문의  <span class="item_qa_count">0</span></button></li>
			        --%>
			        <li style="position:relative; width:33%;"><button type="button" rel="#sit_dex">배송/교환</button></li>
				</ul>
				<ul class="tab_con">
		        <!-- 상품 정보 시작 { -->
	        		<li id="sit_inf">
	            		<h2 class="contents_tit"><span>상품 정보</span></h2>
						<h3>상품 상세설명</h3>
	            		<div id="sit_inf_explan">
	                		<p style="text-align:center;"><br/></p>
							<blockquote style="margin:0px 0px 30px;padding:5px 10px;border:1px solid rgb(222,223,223);background-color:#f7f7f7;">
	  							<p><b><span style="font-family:'맑은 고딕', 'malgun gothic';font-size:14px;color:#ff0000;">《판매가격》</span></b></p>
	  							<p><span style="font-family:'맑은 고딕', 'malgun gothic';font-size:14px;color:#434343;">반팔 티셔츠 </span><strong style="font-weight:bold;"><span style="font-family:'맑은 고딕', 'malgun gothic';font-size:14px;color:#434343;">: 5,000원</span></strong><b></b></p>
								<p><font color="#434343" face="맑은 고딕, malgun gothic"><span style="font-size:14px;"><b>구성품 : 상의 하의 세트 소품 </b></span></font></p>
								<p><font color="#434343" face="맑은 고딕, malgun gothic"><span style="font-size:14px;"><b>(신발은 소품입니다.)</b></span></font></p>
								<p><br /></p>
								<p><b><span style="font-family:'맑은 고딕', 'malgun gothic';font-size:14px;color:#ff0000;">《소품》</span></b></p>
								<p><b></b></p>
								<p><span style="font-family:'맑은 고딕', 'malgun gothic';font-size:14px;color:#434343;">철심스카프 <b>:  2</b></span><b><strong><span style="font-family:'맑은 고딕', 'malgun gothic';font-size:14px;color:#434343;">,000원</span></strong></b></p>
								<p><b><span style="font-family:'맑은 고딕', 'malgun gothic';font-size:14px;color:#ff0000;">《인쇄》</span></b></p>
								<p><span style="font-family:'맑은 고딕', 'malgun gothic';font-size:14px;color:#434343;">이름 인쇄 왼쪽가슴<b> : 2,000원 </b></span></p>
							</blockquote>
							<p style="text-align:center;"><br /></p>
							<p style="text-align:center;"><img src="<%=request.getContextPath()%>/images/<%=product.getP_mainimg()%>" alt="반티" /></p>
							<!-- 상품하단설명 이동 추가 -->
							<p style="text-align:center;"><br /></p>
							<p style="text-align:center;"><img src="http://bants.cdn3.cafe24.com/dum2015.jpg" alt="반티 사은품" /></p>
						</div>
					</li>
	        		<!-- 사용후기 시작 { -->
	        		<li id="sit_use">
	            		<h2>사용후기</h2>
	            		<div id="itemuse">
							<script src="http://www.bant.co.kr/js/viewimageresize.js"></script>
							<!-- 상품 사용후기 시작 { -->
							<section id="sit_use_list">
    							<h3>등록된 사용후기</h3>
    							<div class="sit_use_top">
               						<div id="sit_use_wbtn">
            							<a href="http://www.bant.co.kr/shop/itemuseform.php?it_id=BG420" class="btn02 itemuse_form">사용후기 쓰기<span class="sound_only"> 새 창</span></a>
            							<a href="<%=request.getContextPath()%>/index.jsp?menugroup=review&menu=review_list" class="btn01 itemuse_list">더보기</a>
        							</div>
    							</div>  
    							<div>
    								<jsp:include page="/review/review_list.jsp"/> 
    							</div>
    						</section>
							<script>
							$(function(){
							    $(".itemuse_form").click(function(){
							        window.open(this.href, "itemuse_form", "width=810,height=680,scrollbars=1");
							        return false;
							    });
							
							    $(".itemuse_delete").click(function(){
							        if (confirm("정말 삭제 하시겠습니까?\n\n삭제후에는 되돌릴수 없습니다.")) {
							            return true;
							        } else {
							            return false;
							        }
							    });
							
							    $(".sit_use_li_title").click(function(){
							        var $con = $(this).siblings(".sit_use_con");
							        if($con.is(":visible")) {
							            $con.slideUp();
							        } else {
							            $(".sit_use_con:visible").hide();
							            $con.slideDown(
							                function() {
							                    // 이미지 리사이즈
							                    $con.viewimageresize2();
							                }
							            );
							        }
							    });
							
							    $(".pg_page").click(function(){
							        $("#itemuse").load($(this).attr("href"));
							        return false;
							    });
							});
							</script>
							<!-- } 상품 사용후기 끝 -->
						</div>
	        		</li>
	        		<!-- } 사용후기 끝 -->
			<%--  
	        		<!-- 상품문의 시작 { -->
	        		<li id="sit_qa">
	            		<h2>상품문의</h2>
	            			<div id="itemqa">
								<script src="http://www.bant.co.kr/js/viewimageresize.js"></script>
								<!-- 상품문의 목록 시작 { -->
								<section id="sit_qa_list">
    								<h3>등록된 상품문의</h3>
    								<div class="sit_qa_top">
									    <div id="sit_qa_wbtn">
									   	 	<%-- 
									        <a href="http://www.bant.co.kr/shop/itemqaform.php?it_id=BG420" class="btn02 itemqa_form">상품문의 쓰기<span class="sound_only">새 창</span></a>
									        <a href="http://www.bant.co.kr/shop/itemqalist.php" id="itemqa_list" class="btn01">더보기</a>
									        --%>
			<%-- 						        
									        <a href="https://www.daum.net/" class="btn02 itemqa_form">상품문의 쓰기<span class="sound_only">새 창</span></a>
									        <a href="index.jsp?menugroup=board&menu=board_list" id="itemqa_list" class="btn01">더보기</a>   
									    </div>
									</div>
    								<p class="sit_empty">상품문의가 없습니다.</p>
    							</section>

								<script>
								$(function(){
								    $(".itemqa_form").click(function(){
								        window.open(this.href, "itemqa_form", "width=810,height=680,scrollbars=1");
								        return false;
								    });
								
								    $(".itemqa_delete").click(function(){
								        return confirm("정말 삭제 하시겠습니까?\n\n삭제후에는 되돌릴수 없습니다.");
								    });
								
								    $(".sit_qa_li_title").click(function(){
								        var $con = $(this).siblings(".sit_qa_con");
								        if($con.is(":visible")) {
								            $con.slideUp();
								        } else {
								            $(".sit_qa_con:visible").hide();
								            $con.slideDown(
								                function() {
								                    // 이미지 리사이즈
								                    $con.viewimageresize2();
								                }
								            );
								        }
								    });
								
								    $(".qa_page").click(function(){
								        $("#itemqa").load($(this).attr("href"));
								        return false;
								    });
								});
								</script>
								<!-- } 상품문의 목록 끝 -->
							</div>
	       				</li>
	        			<!-- } 상품문의 끝 -->
	        --%>
				        <!-- 배송/교환 시작 { -->
				        <li id="sit_dex">
				            <h2>배송/교환정보</h2>
				            
							<!-- 배송 시작 { -->
				            <div id="sit_dvr">
								<h3>배송</h3>
								<p><b>택배사</b> : 로젠택배</p>
								<p><b>택배비</b> : <b><span style="color:#ff0000;">3,000원</span></b>(<span style="color:#0000ff;"><b>10만원</b></span> 이상 구매시 무료배송)<span style="color:#4c9900;">(자켓종류 무료배송 제외,일부상품 제외)</span></p>
								<p><b>배송기간</b> :2일~4일(주문 제작 상품은 2~5일) 제주 산간지역은 배송이 지연될 수 있습니다.(토,일 공휴일 제외)</p>
								<p><span style="font-size:9.5pt;font-family:'malgun gothic';background-color:#ffffff;vertical-align:baseline;white-space:pre-wrap;color:#ff0000;">주문시 행사날짜와 늦어도 언제까지 배송해야 하는지 적어주시면 배송 요청일에 최대한 맞추겠습니다. </span></p>
								<p><span style="font-size:9.5pt;font-family:'malgun gothic';background-color:#ffffff;vertical-align:baseline;white-space:pre-wrap;color:#ff0000;">그러나 배송지연,배송사고 등으로 책임을 지지는 않습니다.</span></p>
								<p><b>배송 안내 </b></p>
								<p>- 산간벽지나 도서지방은 별도의 추가금액을 지불하셔야 하는 경우가 있습니다.</p>
								<p>- 단체상품일 경우 퀵배송, 고속버스 배송은 배송비용을 지불하시면 가능합니다.</p>
								<p>- 급하신 상품은 상담전화 주세요.</p>
				            </div>
				            <!-- } 배송 끝 -->
				            	
							<!-- 교환 시작 { -->
				            <div id="sit_ex" >
				                <h3>교환</h3>
				                <p><b><span style="color:#ff0000;"><span style="font-size:18px;">오배송/누락배송 안내</span></span></b></p>
								<p><font color="#ff0000"><span style="color:#0080ff;font-size:14px;"><b>반티 상품을 받으시면 사이즈,총수량이 맞는지 확인하시고 나누어 주세요.</b></span></font></p>
								<p><b><span style="color:#0080ff;font-size:14px;">나누어 주시고 사이즈 오류 또는 누락 배송에 대해 말씀 하시면 처리가 어렵습니다.</span></b></p>
								<p><b><span style="color:#0080ff;font-size:14px;">모든 상품 포장은 <span style="color:#ff0000;">CCTV</span> 촬영을 하고 있습니다.</span></b></p>
								<p><br /></p>
								<p><b><span style="font-size:14px;color:#00994c;">교환 및 반품이 불가능한 경우</span></b></p>
								<p>- 반티 상품은 대부분 순차적 주문생산 상품으로<b><span style="color:#ff0000;"><span style="font-size:18px;">교환/반품이 불가능합니다</span>. </span></b>(단체로 주문하셨을 경우 일 부 사이즈 교환은 가능합니다.)</p>
								<p>- 일부 반품 <b><span style="color:#ff0000;font-size:16px;">20% 차감</span></b> 되고 반품이 가능합니다.</p>
								<p>- 인쇄/제작 상품은 교환 반품이 불가능합니다.(단. 치명적인 하자가 발생한 경우 반품이 가능)</p>
								<p>- 포장을 개봉하였거나 포장이 훼손되어 상품가치가 상실된 경우</p>
								<p>- 시간의 경과에 의하여 재판매가 할 정도로 상품등의 가치가 현저히 감소한 경우</p>
								<p>- 고객님의 책임 있는 사유로 상품등이 멸실 또는 훼손된 경우. 단, 상품의 내용을 확인하기 위하여 포장 등을 훼손한 경우는 제외<br /></p>
								<p><span style="font-size:14px;"><b> </b></span></p>
								<p><span style="font-size:14px;"><b><span style="color:#4c9900;">교환 및 반품이 가능한 경우</span></b></span></p>
								<p>- 공급받으신 상품이 광고 내용과 다르거나 다르게 이행된 경우 7일 이내에 가능합니다.</p>
								<p>- 상품에 치명적 하자로 7일 이내 가능합니다.</p>
				            </div>
				            <!-- } 교환 끝 -->           
				        </li>
				        <!-- } 배송/교환  끝 -->
				    </ul>
				</div>
				<script>
				$(function (){
				    $(".tab_con>li").hide();
				    $(".tab_con>li:first").show();   
				    $(".tab_tit li button").click(function(){
				        $(".tab_tit li button").removeClass("selected");
				        $(this).addClass("selected");
				        $(".tab_con>li").hide();
				        $($(this).attr("rel")).show();
				    });
				});
				</script>
			</section>
			<%-- 
			<!-- 관련상품 시작 { -->
			<section id="sit_rel">
    			<h2>관련상품</h2>

				<!-- 관련상품 10 시작 { -->
				<div class="owl-carousel owl-carousel_rel" >
					<p class="sct_noitem">등록된 상품이 없습니다.</p>
				<!-- } 관련상품 10 끝 -->
				</div>

				<script>
				$(document).ready(function(){						
							
					var owl_rolling_rel = $('.owl-carousel_rel').owlCarousel({
						items:5,
						loop:false,
						margin:34,
						nav:true,			
						autoplay:true,
				        autoplayHoverPause:true,
						autoplayTimeout:5000,   // 5000은 5초	
						responsive:{
							0:{
								items:2,
								margin:15,
								loop:false,
							},
							600:{
								items:3,
								margin:15,
								loop:false,
									
							},
							1000:{
								items:4,
								loop:false,
							},
							1200:{
								items:5,
								loop:false,
							}
						}
					});
		
					function init_pg(event){	
						var tg = $('.rolling_box ').find('.owl-item.active').find('.item').attr('data-hash');	
						$('.rollin_nav_btn').removeClass('active');
						$("."+tg).addClass('active');
					}
					init_pg();
	
				});
				</script>
			</section>
			<!-- } 관련상품 끝 -->
			--%>
			<script>
			jQuery(function($) {
				var change_name = "ct_copy_qty";
			
				$(document).on("select_it_option_change","select.it_option",function(e, $othis) {
					var value = $othis.val(), change_id = $othis.attr("id").replace("it_option_","it_side_option_");
			
					if ($("#" + change_id).length) {
						$("#" + change_id).val(value).attr("selected","selected");
					}
				});
			
				$(document).on("select_it_option_post","select.it_option",function(e, $othis, idx, sel_count,data) {
					var value = $othis.val(), change_id = $othis.attr("id").replace("it_option_","it_side_option_");
			
					$("select.it_side_option").eq(idx + 1).empty().html(data).attr("disabled", false);
			
					// select의 옵션이 변경됐을 경우 하위 옵션 disabled
					if ((idx + 1) < sel_count) {
						$("select.it_side_option:gt("+ (idx + 1)+ ")").val("").attr("disabled", true);
					}
				});
			
				$(document).on("add_sit_sel_option","#sit_sel_option",function(e, opt) {
			
					opt = opt.replace('name="ct_qty[', 'name="'+ change_name + '[');
			
					var $opt = $(opt);
					$opt.removeClass("sit_opt_list");
					$("input[type=hidden]", $opt).remove();
			
					$(".sit_sel_option .sit_opt_added").append($opt);
			
				});
			
				$(document).on("price_calculate","#sit_tot_price",function(e, total) {
					$(".sum_section .sit_tot_price").empty().html("<span>총 금액 </span><strong>"+ number_format(String(total))+ "</strong> 원");
				});
			
				$(".sit_side_option").on("change","select.it_side_option",function(e) {
					var idx = $("select.it_side_option").index($(this)), value = $(this).val();
			
					if (value) {
						if (typeof (option_add) != "undefined") {
							option_add = true;
						}
			
						$("select.it_option").eq(idx).val(value).attr("selected","selected").trigger("change");
					}
				});
			
				$(".sit_side_option").on("change","select.it_side_supply",function(e) {
					var value = $(this).val();
			
					if (value) {
						if (typeof (supply_add) != "undefined") {
							supply_add = true;
						}
			
						$("select.it_supply").val(value).attr("selected","selected").trigger("change");
					}
				});
			
				$(".sit_opt_added").on("click","button",function(e) {
					e.preventDefault();
			
					var $this = $(this), mode = $this.text(), $sit_sel_el = $("#sit_sel_option"), li_parent_index = $this.closest('li').index();
			
					if (!$sit_sel_el.length) {
						alert("el 에러");
						return false;
					}
			
					switch (mode) {
						case "증가":
						$sit_sel_el.find("li").eq(li_parent_index).find(".sit_qty_plus").trigger("click");
						break;
						case "감소":
						$sit_sel_el.find("li").eq(li_parent_index).find(".sit_qty_minus").trigger("click");
						break;
						case "삭제":
						$sit_sel_el.find("li").eq(li_parent_index).find(".sit_opt_del").trigger("click");
						break;
					}
				});
			
				$(document).on("sit_sel_option_success","#sit_sel_option li button",function(e, $othis, mode, this_qty) {
					var ori_index = $othis.closest('li').index();
			
					switch (mode) {
					case "증가":
					case "감소":
						$(".sit_opt_added li").eq(ori_index).find("input[name^=ct_copy_qty]").val(this_qty);
						break;
						case "삭제":$(".sit_opt_added li").eq(ori_index).remove();
						break;
					}
				});
			
				$(document).on("change_option_qty","input[name^=ct_qty]",function(e, $othis, val, force_val) {
					var $this = $(this), ori_index = $othis.closest('li').index(), this_val = force_val ? force_val: val;
			
					$(".sit_opt_added").find("li").eq(ori_index).find("input[name^="+ change_name+ "]").val(this_val);
				});
			
				$(".sit_opt_added").on("keyup paste","input[name^=" + change_name + "]",function(e) {
					var $this = $(this), val = $this.val(), this_index = $("input[name^="+ change_name + "]").index(this);
			
					$("input[name^=ct_qty]").eq(this_index).val(val).trigger("keyup");
				});
			
				$(".sit_order_btn").on("click","button",function(e) {
					e.preventDefault();
			
					var $this = $(this);
			
					if ($this.hasClass("sit_btn_cart")) {
						$("#sit_ov_btn .sit_btn_cart").trigger("click");
					} else if ($this.hasClass("sit_btn_buy")) {
						$("#sit_ov_btn .sit_btn_buy").trigger("click");
					}
				});
			});
			</script>
		</div>  <!-- } .shop-content 끝 -->
	</div>  <!-- } #container 끝 -->
</div> <!-- } #wrapper 전체 콘텐츠 끝 -->
</body>
</html>
