<%@page import="xyz.itwill.dto.HewonDTO"%>
<%@page import="xyz.itwill.dao.CartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>    
<%
	HewonDTO loginHewon=(HewonDTO)session.getAttribute("loginHewon");
%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/banti0.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/banti1.css">

<script type="text/javascript">
		

$(document).ready(function(){ 
	cookies = document.cookie; 
    if(cookies.indexOf("topBanner=top")<0){ 
    	$("#top_banner").show(); 
    }else{ 
    	$("#top_banner").hide(); 
    } 
}); 




function setCookie(name, value, expiredays ) { 
	var date = new Date();
    date.setDate(date.getDate() + expiredays);
    document.cookie = escape(name) + "=" + escape(value) + "; path=/ ; expires=" + date.toUTCString();
};


function closebanner(){
	setCookie( "topBanner", "top",1); 
	$("#top_banner").hide(); 
};





</script>

    
<section id="top_banner">
	<div class="pc">
		<button class="top_banner_close" id="top_banner_close" onclick="closebanner();">오늘 하루 열지 않기&nbsp;&nbsp;
			<i class="fa fa-times-circle" aria-hidden="true"></i>
		</button>
		
		<div class="bn_banner_x">
			<a href="bbs/boarda88a.html?bn_id=13">
				<img src="<%=request.getContextPath()%>/images/banner.png" alt="탑배너" width="1430" height="80">
			</a>
		</div>	
	</div>
</section>




<header id="mobile_hd">

    <script>
	 function catetory_menu_fn( is_open ){
		var $cagegory = $("#mobile_category");

		if( is_open ){
			$cagegory.fadeIn();
			$("body").addClass("is_hidden");
		} else {
			$cagegory.fadeOut();
			$("body").removeClass("is_hidden");
		}
	}
   </script>

 </header>

<!-- header --> 
<div id="hd" style="z-index: 1000">
    <h1 id="hd_h1">반티세트</h1>
    <div id="skip_to_container"><a href="#container">본문 바로가기</a></div>

    <div id="tnb">
        <h3>회원메뉴</h3>    
		<ul>
			<li class="tnb_left"><a href="<%=request.getContextPath()%>/index.jsp?menugroup=faq&menu=faq_list">FAQ</a></li>	
			<li class="tnb_left"><a href="<%=request.getContextPath()%>/index.jsp?menugroup=board&menu=board_list"><font color="darkgoldenrod"><b>문의(견적요청)</b></font></a></li>

            <li class="tnb_cart"><a href="<%=request.getContextPath()%>/index.jsp?menugroup=cart&menu=cart_list"><i class="fa fa-shopping-basket" aria-hidden="true"></i> 장바구니</a></li>            
            <li><a href="<%=request.getContextPath()%>/index.jsp?menugroup=order&menu=order_list">마이쇼핑</a></li>
            
            <%if(loginHewon==null){ %>
            	<li><a href="<%=request.getContextPath()%>/index.jsp?menugroup=login&menu=terms">회원가입</a></li>
            	<li><a href="<%=request.getContextPath()%>/index.jsp?menugroup=login&menu=hewon_login"><b>로그인</b><img src="<%=request.getContextPath()%>/images/sns_naver_150.png"><img src="<%=request.getContextPath()%>/images/sns_kakao_150.png"></a></li>
			<%} else{ %>        
            	<li><a href="<%=request.getContextPath()%>/index.jsp?menugroup=login&menu=hewon_logout_action">로그아웃</a></li>
           		<li><a><b><%=loginHewon.getH_name() %></b>님 환영합니다.</a></li>
            	<% if(loginHewon.getH_status()==2) {//로그인 사용자가 관리자인 경우 %>
					<li><a href="<%=request.getContextPath()%>/index.jsp?menugroup=admin&menu=main_page">관리자</a></li>
				<% } %>
			<%} %>        
        </ul>
	</div>
	
	<div id="hd_wrapper">
        <div id="logo">
        	<a href="<%=request.getContextPath()%>/index.jsp"><img src="<%=request.getContextPath()%>/images/logo_img.png" alt="반티세트"></a>
        </div>

        <div id="hd_sch">
            <h3>쇼핑몰 검색</h3>
            <form name="frmsearch1" action="http://bant.co.kr/shop/search.php" onsubmit="return search_submit(this);">
            	<label for="sch_str" class="sound_only">검색어<strong class="sound_only"> 필수</strong></label>
            	<input type="text" name="q" value="" id="sch_str" required>
            	<button type="submit" id="sch_submit"><i class="fa fa-search" aria-hidden="true"></i><span class="sound_only">검색</span></button>
            </form>
            
            <script>
            function search_submit(f) {
                if (f.q.value.length < 2) {
                    alert("검색어는 두글자 이상 입력하십시오.");
                    f.q.select();
                    f.q.focus();
                    return false;
                }
                return true;
            }
            </script>
        </div>
        
        <div id="kakao_consult">
			<a href="shop/bannerhit6b1d.php?bn_id=6"><img src="<%=request.getContextPath()%>/images/kakao_consult.png" alt="반티세트 카카오톡 상담" width="220" height="90" align="right"></a>
        </div>
    </div>
</div>



<!-- 쇼핑몰 카테고리 시작 { -->
    <div id="hd_menu" style="display: block; position: sticky; top:0px;">		
		<div class="hd_menu_all">
			
			<ul class="ul_1st">
				<li>
					<button type="button" id="menu_open"><i class="fa fa-bars" aria-hidden="true"></i></button>
				</li>
				<li>
					<a href="<%=request.getContextPath()%>/index.jsp?menugroup=productlist&menu=listpage">BEST</a>
				</li>
	    		<li >
					<a href="<%=request.getContextPath()%>/index.jsp?menugroup=productlist&menu=listpage1">반티세트</a>
				</li>
				<li >
					<a href="<%=request.getContextPath()%>/index.jsp?menugroup=productlist&menu=listpage2">군복반티</a>
				</li>
				<li >
					<a href="<%=request.getContextPath()%>/index.jsp?menugroup=productlist&menu=listpage3">코스프레반티</a>
				</li>
				
				
				<li >
					<a href="<%=request.getContextPath()%>/index.jsp?menugroup=productlist&menu=listpage">스포츠 반티<i class="fa fa-angle-down" aria-hidden="true"></i></a>
					
					
					<ul class="ul_2nd" >			
						<li>
							<a href="<%=request.getContextPath()%>/index.jsp?menugroup=productlist&menu=listpage"><i class="fa fa-angle-right" aria-hidden="true"></i> 야구복 반티</a>
						</li>
						<li>
							<a href="<%=request.getContextPath()%>/index.jsp?menugroup=productlist&menu=listpage"><i class="fa fa-angle-right" aria-hidden="true"></i> 하키반티</a>
						</li>
						<li>
							<a href="<%=request.getContextPath()%>/index.jsp?menugroup=productlist&menu=listpage"><i class="fa fa-angle-right" aria-hidden="true"></i> 배구반티(하이큐)</a>
						</li>
						<li>
							<a href="<%=request.getContextPath()%>/index.jsp?menugroup=productlist&menu=listpage"><i class="fa fa-angle-right" aria-hidden="true"></i> 축구복 반티</a>
						</li>
						<li>
							<a href="<%=request.getContextPath()%>/index.jsp?menugroup=productlist&menu=listpage"><i class="fa fa-angle-right" aria-hidden="true"></i> 농구복 반티</a>
						</li>
						<li>
							<a href="<%=request.getContextPath()%>/index.jsp?menugroup=productlist&menu=listpage"><i class="fa fa-angle-right" aria-hidden="true"></i> 도복 반티</a>
						</li>
					</ul>
				</li>
				
				
				<li >
					<a href="<%=request.getContextPath()%>/index.jsp?menugroup=productlist&menu=listpage5">유아/아동 반티</a>
				</li>
				
				
				<li >
					<a href="<%=request.getContextPath()%>/index.jsp?menugroup=productlist&menu=listpage6">맨투맨/후드티 반티<i class="fa fa-angle-down" aria-hidden="true"></i></a>
					
					<ul class="ul_2nd">			
						<li>
							<a href="<%=request.getContextPath()%>/index.jsp?menugroup=productlist&menu=listpage"><i class="fa fa-angle-right" aria-hidden="true"></i> 맨투맨 반티</a>
						</li>
						<li>
							<a href="<%=request.getContextPath()%>/index.jsp?menugroup=productlist&menu=listpage"><i class="fa fa-angle-right" aria-hidden="true"></i> 후드티 반티</a>
						</li>
					</ul>
				</li>
				
				
				<li >
					<a href="<%=request.getContextPath()%>/index.jsp?menugroup=productlist&menu=listpage7">상의 반티</a>
				</li>
				<li >
					<a href="<%=request.getContextPath()%>/index.jsp?menugroup=productlist&menu=listpage8">하의 반티</a>
				</li>
				<li >
					<a href="<%=request.getContextPath()%>/index.jsp?menugroup=productlist&menu=listpage9">소품/악세사리</a>
				</li>
				
					</ul>	
		
		</div>
	</div>

<script type="text/javascript">

//전체카테고리에 마우스 hover
/*
$(".ul_1st").hover(function () {
    $('.ul_2nd').show();
}, function () {
    $('.ul_2nd').hide();
});
*/



</script>