
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
  <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"
  />
    
 <!-- Swiper -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>


<link rel="stylesheet" href="testcss.css">


<section id="top_banner" >
	<div class="pc">
		<button class="top_banner_close">오늘 하루 열지 않기&nbsp;&nbsp;
			<i class="fa fa-times-circle" aria-hidden="true"></i>
		</button>
		
		<div class="bn_banner_x">
			<a href="bbs/boarda88a.html?bn_id=13">
				<img src="/project4/images/banner.png" alt="탑배너" width="1430" height="80">
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
			<li class="tnb_left"><a href="bbs/faq.html">FAQ</a></li>
			<li class="tnb_left"><a href="bbs/qalist.php">1:1문의</a></li>			
			<li class="tnb_left"><a href="bbs/board6b3d.html?bo_table=qa"><font color="darkgoldenrod"><b>문의(견적요청)</b></font></a></li>
			<li class="tnb_left"><a href="bbs/board349c.html?bo_table=order"><font color="red"><b>인쇄파일등록 게시판</b></font></a></li>
			<li><a href="bbs/board9f84.html?bo_table=pay"><font color="orenge"><b>분할결제 요청</b></font></a></li>
			<li class="tnb_left"><a href="bbs/boardef18.html?bo_table=mk"><font color="blue"><b>인쇄/폰트 안내</b></font></a></li>
            <li class="tnb_left"><a href="shop/personalpay.html">개인결제</a></li> 

            <li class="tnb_cart"><a href="shop/cart.html"><i class="fa fa-shopping-basket" aria-hidden="true"></i> 장바구니 0</a></li>            
            <li><a href="bbs/logineceb.html">마이쇼핑</a></li>
            <li><a href="bbs/register.html">회원가입</a></li>
            <li><a href="bbs/login00f2.html?url=%2F"><b>로그인</b><img src="/project4/images/sns_naver_150.png"><img src="/project4/images/sns_kakao_150.png"></a></li>
        </ul>
	</div>
	
	<div id="hd_wrapper">
        <div id="logo">
        	<a href="shop/index.html"><img src="/project4/images/logo_img.png" alt="반티세트"></a>
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
			<a href="shop/bannerhit6b1d.php?bn_id=6"><img src="/project4/images/kakao_consult.png" alt="반티세트 카카오톡 상담" width="220" height="90" align="right"></a>
        </div>
    </div>
</div>
</body>


<!-- 쇼핑몰 카테고리 시작 { -->
    <div id="hd_menu">		
		<div class="hd_menu_all">
			
			<ul class="ul_1st">
				<li>
					<button type="button" id="menu_open"><i class="fa fa-bars" aria-hidden="true"></i></button>
				</li>
				<li>
					<a href="shop/listtype728f.html?type=4">BEST</a>
				</li>
	    		<li >
					<a href="shop/list8ccd.html?ca_id=n1" >반티세트</a>
				</li>
				<li >
					<a href="shop/list8c60.html?ca_id=m5" >군복반티</a>
				</li>
				<li >
					<a href="shop/lista5c7.html?ca_id=o9" >코스프레반티</a>
				</li>
				
				
				<li >
					<a href="shop/list7a9b.html?ca_id=n2" >스포츠반티<i class="fa fa-angle-down" aria-hidden="true"></i></a>
					
					
					<ul class="ul_2nd">			
						<li>
							<a href="shop/list9b62.html?ca_id=n210"><i class="fa fa-angle-right" aria-hidden="true"></i> 야구복 반티</a>
						</li>
						<li>
							<a href="shop/listdd57.html?ca_id=n220"><i class="fa fa-angle-right" aria-hidden="true"></i> 하키반티</a>
						</li>
						<li>
							<a href="shop/list5fa1.html?ca_id=n230"><i class="fa fa-angle-right" aria-hidden="true"></i> 배구반티(하이큐)</a>
						</li>
						<li>
							<a href="shop/list9b09.html?ca_id=n240"><i class="fa fa-angle-right" aria-hidden="true"></i> 축구복 반티</a>
						</li>
						<li>
							<a href="shop/list0980.html?ca_id=n250"><i class="fa fa-angle-right" aria-hidden="true"></i> 농구복 반티</a>
						</li>
						<li>
							<a href="shop/listc399.html?ca_id=n260"><i class="fa fa-angle-right" aria-hidden="true"></i> 도복 반티</a>
						</li>
					</ul>
				</li>
				
				
				<li >
					<a href="shop/list906f.html?ca_id=z1" >유아/아동 반티</a>
				</li>
				
				
				<li >
					<a href="shop/listd208.html?ca_id=p9" >맨투맨/후드티 반티<i class="fa fa-angle-down" aria-hidden="true"></i></a>
					
					<ul class="ul_2nd">			
						<li>
							<a href="shop/listd379.html?ca_id=p910"><i class="fa fa-angle-right" aria-hidden="true"></i> 맨투맨 반티</a>
						</li>
						<li>
							<a href="shop/lista1cb.html?ca_id=p920"><i class="fa fa-angle-right" aria-hidden="true"></i> 후드티 반티</a>
						</li>
					</ul>
				</li>
				
				
				<li >
					<a href="shop/list9841.html?ca_id=n4" >상의 반티</a>
				</li>
				<li >
					<a href="shop/list4d4b.html?ca_id=n6" >하의 반티</a>
				</li>
				<li >
					<a href="shop/list1550.html?ca_id=n5" >소품/악세사리</a>
				</li>
				<li >
					<a href="shop/listf577.html?ca_id=z9" >컨셉별 분류<i class="fa fa-angle-down" aria-hidden="true"></i></a>
					
					<ul class="ul_2nd">			
						<li>
							<a href="shop/list13d2.html?ca_id=z920"><i class="fa fa-angle-right" aria-hidden="true"></i> 교련복 반티</a>
						</li>
						<li>
							<a href="shop/list9146.html?ca_id=z940"><i class="fa fa-angle-right" aria-hidden="true"></i> 복고풍 반티</a>
						</li>
						<li>
							<a href="shop/list267e.html?ca_id=z950"><i class="fa fa-angle-right" aria-hidden="true"></i> 죄수복 반티</a>
						</li>
						<li>
							<a href="shop/listf3f1.html?ca_id=z960"><i class="fa fa-angle-right" aria-hidden="true"></i> 점프수트 반티</a>
						</li>
						<li>
							<a href="shop/list94a6.html?ca_id=z970"><i class="fa fa-angle-right" aria-hidden="true"></i> 새마을 반티</a>
						</li>
						<li>
							<a href="shop/list26d3.html?ca_id=z980"><i class="fa fa-angle-right" aria-hidden="true"></i> 용포 반티</a>
						</li>
						<li>
							<a href="shop/listcbcd.html?ca_id=z910"><i class="fa fa-angle-right" aria-hidden="true"></i> 경찰반티</a>
						</li>
						<li>
							<a href="shop/list83b5.html?ca_id=z990"><i class="fa fa-angle-right" aria-hidden="true"></i> 잠옷 반티</a>
						</li>
						<li>
							<a href="shop/listaea8.html?ca_id=z930"><i class="fa fa-angle-right" aria-hidden="true"></i> 조교 반티</a>
						</li>
						<li>
							<a href="shop/list4617.html?ca_id=z9a0"><i class="fa fa-angle-right" aria-hidden="true"></i> 환자복 반티</a>
						</li>
						<li>
							<a href="shop/list5a8f.html?ca_id=z9b0"><i class="fa fa-angle-right" aria-hidden="true"></i> 오징어게임 반티</a>
						</li>
						<li>
							<a href="shop/listfe3d.html?ca_id=z9c0"><i class="fa fa-angle-right" aria-hidden="true"></i> 야쿠자 가운 반티</a>
						</li>
						<li>
							<a href="shop/list4489.html?ca_id=z9d0"><i class="fa fa-angle-right" aria-hidden="true"></i> 팀조끼 반티</a>
						</li>
					</ul>	
				</li>
			</ul>
		</div>
	</div>



<div id="main_bn">
<div class="swiper-container swiper-container-pc">
<div class="swiper-wrapper">
<div class="swiper-slide swiper-lazy" data-swiper-autoplay="5000">
<a href="/shop/list5a8f.html?bn_id=39">
<img src="29997d.jpg" width="2000" alt="신상품 오징어 체육복"></a>
<div class="swiper-lazy-preloader swiper-lazy-preloader-white"></div></div>
<div class="swiper-slide swiper-lazy" data-swiper-autoplay="5000">
<a href="/shop/list8c60.html?bn_id=27">
<img src="2833ce.jpg" width="2000" alt="개구리 군복 반티"></a>
<div class="swiper-lazy-preloader swiper-lazy-preloader-white"></div></div>
<div class="swiper-slide swiper-lazy" data-swiper-autoplay="5000">
<a href="361afb.jpg"><img src="361afb.jpg" width="2000" alt="오징어 반티"></a>
<div class="swiper-lazy-preloader swiper-lazy-preloader-white"></div>
</div>
<div class="swiper-slide swiper-lazy" data-swiper-autoplay="5000">
<a href="/shop/list26d3.html?bn_id=37">
<img src="37340f.jpg" width="2000" alt="용포반티"></a>
<div class="swiper-lazy-preloader swiper-lazy-preloader-white"></div>
</div>
</div>
<div class="swiper-pagination swiper-pagination-pc"></div>
<div class="swiper-button-next swiper-button-next-pc"></div>
<div class="swiper-button-prev swiper-button-prev-pc"></div>
</div>
	<div class="swiper-container gallerythumb gallery-thumbs-pc">
		<div class="swiper-wrapper">			
			<div class="swiper-slide">신상품 오징어 체육복</div>
			<div class="swiper-slide">개구리 군복 반티</div>
			<div class="swiper-slide">오징어 반티</div>
			<div class="swiper-slide">용포반티</div>		
			</div>				
	</div>

</div>

<script>

	var galleryThumbs = new Swiper('.gallery-thumbs-pc', {
	  spaceBetween: 0,
	  slidesPerView: 4,
	  loop: false,
	  autoHeight: false,
	  calculateHeight:false,
	  freeMode: true,
	  loopedSlides: 4, 				 
	});

	var swiper = new Swiper('.swiper-container-pc', {
		slidesPerView: 1,
		spaceBetween: 0,
		effect:"slide",
		autoHeight: false,
		loop: true, 
	
		preloadImages: false,   
		lazy: true,
		lazy: {
			loadPrevNext: true,
		},
		navigation: {
			nextEl: '.swiper-button-next-pc',
			prevEl: '.swiper-button-prev-pc',
		},
		paginationClickable: true,
		speed: 1000,			
		autoplay: {
			delay: 5000,
			disableOnInteraction: false
		},
		
		thumbs: {
			swiper: galleryThumbs
		},
	});
</script>



<div id="community">	

	<div id="comm_area">
		<div class="comm_cs">
			<h4>Customer center</h4>
			<p class="tel"><i class="fa fa-phone-square" aria-hidden="true"></i> 010-8000-8408</p>		
			<p style="font-weight:700;">TEL 070-8274-1113<br>(상품문의는 핸드폰으로)<br>H.P 010-8000-8408</p>
			<p>평일 10:00~17:00<br>토,일,공휴일 : 휴무</p>
		</div>
		<div class="comm_bank"> 
			<h4>bank info</h4>
			<p>농협 312-0068-2612-21<br>예금주 : <strong>박 전 광</strong></p>
			<p><img src="kcp.png"></p>

		</div>
		<div class="comm_notice">
			<h4>notice</h4>
		   <!-- 커뮤니티 최신글 시작 { -->
			<section id="sidx_lat">				
				
<div class="lat">
    <ul>
            <li class="basic_li">
            <a href="bbs/board4a15.html?bo_table=notice&amp;wr_id=48"> 10월27일 사은품 입고 되었습니다.</a><span class="hot_icon"><i class="fa fa-heart" aria-hidden="true"></i><span class="sound_only">인기글</span></span>             <!-- <div class="lt_info">
				<span class="lt_nick"><span class="sv_member">관리자</span></span>
            	<span class="lt_date">10-26</span>              
            </div> -->
        </li>
            <li class="basic_li">
            <a href="bbs/boardc21f.html?bo_table=notice&amp;wr_id=47"> 사은품 일시 품절</a><span class="hot_icon"><i class="fa fa-heart" aria-hidden="true"></i><span class="sound_only">인기글</span></span>             <!-- <div class="lt_info">
				<span class="lt_nick"><span class="sv_member">관리자</span></span>
            	<span class="lt_date">10-12</span>              
            </div> -->
        </li>
            <li class="basic_li">
            <a href="bbs/board7056.html?bo_table=notice&amp;wr_id=35"> 반티 사은품</a><span class="hot_icon"><i class="fa fa-heart" aria-hidden="true"></i><span class="sound_only">인기글</span></span>             <!-- <div class="lt_info">
				<span class="lt_nick"><span class="sv_member">관리자</span></span>
            	<span class="lt_date">02-24</span>              
            </div> -->
        </li>
            <li class="basic_li">
            <a href="bbs/boardbb3e.html?bo_table=notice&amp;wr_id=30"> 반티문구</a><span class="hot_icon"><i class="fa fa-heart" aria-hidden="true"></i><span class="sound_only">인기글</span></span>             <!-- <div class="lt_info">
				<span class="lt_nick"><span class="sv_member">관리자</span></span>
            	<span class="lt_date">02-14</span>              
            </div> -->
        </li>
            </ul>

</div>
			</section>
        <!-- } 커뮤니티 최신글 끝 -->
			
		</div>
		
		<div class="comm_quick">
			<h4>RETURN / EXCHANGE</h4>
			<p><strong>서울 중구 을지로 227 패션벤쳐타운 지하 264호</strong><br>자세한 교환·반품절차 안내는 상품하단을 참고해주세요</p><p>
			</p><ul>
				<li><a href="shop/cart.html"><span><i class="fa fa-shopping-basket" aria-hidden="true"></i></span><p>장바구니</p></a></li>
				<li><a href="bbs/login9eaf.html"><span><i class="fa fa-truck" aria-hidden="true"></i></span><p>배송조회</p></a></li>
				<li><a href="http://plus.kakao.com/home/@반티세트"><img src="kakao_70.png"></span><p>카톡문의</p></a></li>
				<li><a href="bbs/login9eaf.html"><span><i class="fa fa-desktop" aria-hidden="true"></i></span><p>주문조회</p></a></li>
			</ul>
		</div>
	</div>
</div>


<div id="ft">
    <div class="ft_wr">
        <ul class="ft_ul">
			<li><a href="shop/index.html">홈으로</a></li>
            <li><a href="bbs/content8a20.html?co_id=company">회사소개</a></li>
            <li><a href="bbs/content02b1.html?co_id=provision">이용약관</a></li>
            <li><a href="bbs/content200d.html?co_id=privacy">개인정보처리방침</a></li>
            </ul>
        
        <a href="shop/index.html" id="ft_logo"><img src="data/common/logo_img2" alt="처음으로"></a>

        <div class="ft_info">
            <span><b>회사명</b> 제이글로벌(반티세트)</span>
            <span><b>대표</b> 박 전 광</span><br class="saview">
            <span><b>주소</b> 서울 중구 을지로 227 패션벤쳐타운 지하 264호</span><br class="saview">
            <span><b>TEL</b> 010-8000-8408</span>
            <span><b>E-MAIL</b> bantmd@gmail.com</span><br>
            <span><b>사업자등록번호</b> 109-04-99322			
            <!------------ 사업자정보확인 시작-------------->
						<a href=javascript:window.open("http://www.ftc.go.kr/bizCommPop.do?wrkr_no=109-04-99322","bizinfo","width=750,height=700,scrollbars=1");>[사업자정보확인]</a>
			<!------------ 사업자정보확인 끝-------------->
		
			</span><br class="saview">
            <span><b>통신판매업신고번호</b> 2011-서울중구-1568</span><br class="saview">
            <span><b>개인정보책임관리자</b> 박 전 광</span><br>
            <!-- <span><b>운영자</b> 관리자</span><br> -->
            <br>

            <p>COPYRIGHT &copy; 2010 제이글로벌 ALL RIGHTS RESERVED.</p>
        </div>

        <div class="ft_cs">
            <h2>상담전화</h2>
            <strong>010-8000-8408</strong>          
             <p>평일 10:00-17:00<br>문자가능/토,일 휴무</p>
        </div>

        <script>
        
        $(function() {
            $("#top_btn").on("click", function() {
                $("html, body").animate({scrollTop:0}, '500');
                return false;
            });
        });
        </script>
    </div>
</div>
<div id="ft_bnk"></div>









