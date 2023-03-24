<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<style type="text/css">

div {
	margin: 0;
	padding: 0;
	font-size: 13px;
	color: #333;
	line-height: 1.6em;
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: 400;
	letter-spacing: -0.02em;
}

body {
	margin: 0px auto;
}

p {
	margin: 0;
	padding: 0;
	font-size: 13px;
	color: #333;
	line-height: 1.6em;
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: 400;
	letter-spacing: -0.02em;
}

section {
	margin: 0;
	padding: 0;
	font-size: 13px;
	color: #333;
	line-height: 1.6em;
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: 400;
	letter-spacing: -0.02em;
}

li {
	margin: 0;
	padding: 0;
	font-size: 13px;
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: 400;
	letter-spacing: -0.02em;
	line-height: 1.6em;
	list-style: none;
	color: #333;
}

ul {
	display: block;
	
	<%--위 카테고리칸 아래로 내려오는거 고침--%>
	<%-- 원래는 
	margin-block-start: 1em;
	margin-block-end: 1em;
	--%>
	margin-block-start: 0em;
	margin-block-end: 0em;
	
	margin-inline-start: 0px;
	margin-inline-end: 0px;
	
	<%-- 위 카테고리칸 좌우 조절 --%>
	<%--원래는 padding-inline-start: 40px; --%> 
	padding-inline-start: 0px;
	
}

a {
	color: #000;
	text-decoration: none;
}

b {
	font-weight: bold;
}

label, input, button, select, img {
	vertical-align: middle;
}

#wrap {
	
}

#header {
	width: 100%;
}

#top {
	height: 36px;
	border-bottom: 1px solid #e9e9e9;
}

#top ul {
	margin: 0 auto;
	width: 100%;
	max-width: 1300px;
}

#top li {
	float: right;
	border-left: 1px solid #e9e9e9;
	margin-bottom: -1px;
	font-size: 0.92em;
}

#top a {
	display: inline-block;
	padding: 0 10px;
	color: #646464;
	line-height: 35px;
	border-bottom: 1px solid #e9e9e9;
}

#top [class~=top_left] a {
	padding: 0 14px;
}

#top [class~=top_left] {
	float: left;
}

#search {
	position: relative;
	margin: 0 auto;
	padding: 20px 0;
	height: 115px;
	width: 100%;
	max-width: 1300px;
	zoom: 1;
}

#logo {
	float: left;
	padding: 25px 0 0;
}

#sch h3 {
	position: absolute;
	font-size: 0;
	line-height: 0;
	overflow: hidden;
}

<%-- 얘가 문제인듯 --%>
<%-- 이미지 둥글게 하는 코드 
border-radius: 30px;
--%>

<%--
#sch {
	position: absolute;
	top: 35px;
	left: 50%;
	width: 350px;
	border-radius: 30px;
	margin-left: -215px;
	overflow: hidden;
}
--%>

#sch #sch_str {
	width: 300px;
	height: 45px;
	background: #fff;
	border-bottom: 1px solid #000;
	border-right: 0;
	float: left;
	border-radius: 0px;
	font-size: 1.25em;
	color: #000;
}

input[type=text], input[type=password], textarea {
	-webkit-transition: all 0.30s ease-in-out;
}

input {
	outline: none !important;
	outline-style: none !important;
}

.fa {
	display: inline-block;
	font: normal normal normal 14px/1 FontAwesome;
	font-size: inherit;
	text-rendering: auto;
	-webkit-font-smoothing: antialiased;

}

#sch #sch_submit {
	height: 45px;
	background: #fff;
	border: 0;
	border-bottom: 1px solid #000;
	border-left: 0;
	color: #333;
	width: 50px;
	float: left;
	cursor: pointer;
	border-radius: 0;
	font-size: 18px;
}

.msg_sound_only, .sound_only {
	display: inline-block !important;
	position: absolute;
	top: 0;
	left: 0;
	margin: 0 !important;
	padding: 0 !important;
	font-size: 0;
	line-height: 0;
	border: 0 !important;
	overflow: hidden !important;
}

#sbn_side {
	width: 200px;
	position: absolute;
	margin-bottom: 20px;
	top: 20px;
	right: 0;
}

#sbn_side h2 {
	position: absolute;
	font-size: 0;
	line-height: 0;
	overflow: hidden;
}

#hd_menu {
	height: 52px;
	clear: both;
	width: 100%;
	position: relative;
	text-align: left;
	background: #fff;
	border-top: 1px solid #ddd;
	border-bottom: 1px solid #ddd;
}

#hd_menu [class~=ul_1st] {
	width: 100%;
}

#hd_menu [class~=ul_1st]>li {
	float: left;
	margin: 0;
	padding: 0;
	position: relative;
}

#hd_menu [class~=hd_menu_all] {
	position: relative;
	width: 100%;
	max-width: 1300px;
	margin: 0 auto;
}

#hd_menu button #menu_open {
	color: #fff;
	width: 50px;
	height: 50px;
	line-height: 50px;
	background: #333;
	border: 0px;
	padding: 0;
	text-align: center;
}

#main_bn {
	clear: both;
	margin: 0 auto;
	border: 0px;
	width: 100%;
	max-width: 2000px;
	height: 372.5px;
}

#main_product {
	width: 100%;
	height: 6265.95px;
}

#container {
	position: relative;
	float: none;
	width: 100%;
	max-width: 1300px;
	margin: 0 auto;
	min-height: auto;
	height: auto !important;
	height: 500px;
	background: #fff;
	zoom: 1;
}

*, :after, :before {
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}

@media ( max-width : 1300px) [class~=sct_wrap] {
	width:98%;
	margin:0 auto;
}

.sct_wrap {
	position: relative;
	height: 1094.44px;
	margin: 0 0 20px;
}

[class~=sct_10] [class~=sct_clear] {
	clear: both;
}

.sct_10 .sct_img {
	position: relative;
	text-align: center;
}

.sct_10 .sct_txt {
	border-bottom: 1px solid #d9dde2;
	font-size: 1.1em;
	margin: 10px 0;
	padding-bottom: 10px;
}

.sct_10 .sct_basic {
	margin-bottom: 5px;
	color: #6e7f88;
}

.sct_10 .sct_cost {
	margin: 5px 0 10px;
	font-size: 1.25em;
	font-weight: bold;
}

[class~=sct_wrap] header {
	margin: 20px auto;
	margin-top: 60px;
	text-align: center;
	border: 0px solid red;
}

[class~=sct_wrap] h2 {
	float: none;
	text-align: center;
	font-size: 1.5em;
	margin: 0 0 10px 0;
	display: block;
	padding: 0 0 7px;
	border-bottom: 0px solid #000;
	line-height: 1em;
}

[class~=sct_wrap] h2 a {
	text-decoration: none;
}

[class~=sct_wrap] h2:after {
	display: block;
	clear: both;
	content: "";
	width: 30px;
	padding-bottom: 20px;
	margin: 0 auto;
	border-bottom: 1px solid #000;
	visibility: visible;
}

@media ( max-width : 1340px) [class~=bn_4_li] {
	width:100%;
	margin-left:0px;
}

[class~=bn_4_li] {
	overflow: hidden;
}

.sct_10 {
	margin: 25px 0;
	height: 3723.77px;
}

.sct_10 .sct_li {
	position: relative;
	float: left;
	margin-bottom: 40px;
	text-align: left;
}

.sct {
	clear: both;
	margin: 0;
	padding: 0;
	list-style: none;
}

[class~=bn_2_li] {
	overflow: hidden;
}

@media ( max-width : 1300px) [class~=sct_wrap] {
	width:98%;
	margin:0 auto;
}

@media ( max-width : 1300px) [class~=bn_banner_x] img {
	width:100%;
	height:auto;
}

[class~=bn_2_li] div[class~=left] {
	float: left;
	width: 50%;
}

[class~=bn_2_li] div[class~=right] {
	float: right;
	width: 50%;
	text-align: right;
}

[class~=sct_wrap] header {
	margin: 20px auto;
	margin-top: 60px;
	text-align: center;
	border: 0px solid red;
}

.sct_wrap header {
	padding: 10px 0 20px;
}

[class~=bn_4_li] div[class~=left1] {
	float: left;
	width: 25%;
	text-align: center;
}

[class~=bn_4_li] div[class~=left2] {
	float: left;
	width: 25%;
	text-align: center;
}

[class~=bn_4_li] div[class~=right1] {
	float: right;
	width: 25%;
	text-align: center;
}

[class~=bn_4_li] div[class~=right1] {
	float: right;
	width: 25%;
	text-align: center;
}

#community {
	width: 100%;
	min-width: 320px;
	border-top: 1px solid #ddd;
	border-bottom: 0px solid #ddd;
	margin-top: 50px;
	height: 261px;
}

#comm_area {
	width: 100%;
	max-width: 1250px;
	margin: 0px auto;
	position: relative;
	overflow: hidden;
}

#comm_area [class~=comm_cs] {
	float: left;
	display: inline;
	width: 250px;
	height: 260px;
	text-align: left;
	border-right: 1px solid #ededed;
	box-sizing: border-box;
	padding: 30px 0;
}

#comm_area h4 {
	font-size: 15px;
	color: #333;
	padding-bottom: 5px;
	font-weight: 700;
	text-transform: uppercase;
}

h4 {
	margin: 0;
	padding: 0;
	line-height: 1.6em;
	font-family: 'Noto Sans KR', sans-serif;
	letter-spacing: -0.02em;
}

.fa {
	display: inline-block;
	font: normal normal normal 14px/1 FontAwesome;
	font-size: inherit;
	text-rendering: auto;
	-webkit-font-smoothing: antialiased;
}

#comm_area [class~=comm_cs] p[class~=tel] {
	font-size: 26px;
	padding-left: 0px;
	line-height: 30px;
	font-weight: 700;
	color: #000;
	letter-spacing: -0.05em;
}

#comm_area p {
	font-size: 12px;
	color: #555;
	line-height: 18px;
	margin-top: 10px;
}

#comm_area [class~=comm_cs] p[class~=tel] {
	font-size: 26px;
	padding-left: 0px;
	line-height: 30px;
	font-weight: 700;
	color: #000;
	letter-spacing: -0.05em;
}

#comm_area p {
	font-size: 12px;
	color: #555;
	line-height: 18px;
	margin-top: 10px;
}

#comm_area [class~=comm_bank] {
	float: left;
	display: inline;
	width: 250px;
	height: 260px;
	text-align: left;
	border-right: 1px solid #ededed;
	padding: 30px 40px;
}

#comm_area [class~=comm_quick] ul li {
	width: 70px;
	float: left;
	display: inline;
	text-align: center;
	margin-right: 5px;
	font-size: 0.9em;
}

#comm_area [class~=comm_quick] ul li a span {
	display: block;
	text-align: center;
	width: 70px;
	height: 70px;
	line-height: 70px;
	border-radius: 70px;
	background-color: #e7e7e7;
	//font-size: 2.4em;
	-webkit-transition: 0.5s all ease;
}

#comm_area [class~=comm_notice] {
	float: left;
	display: inline;
	width: 400px;
	height: 260px;
	text-align: left;
	border-right: 1px solid #ededed;
	padding: 30px 50px;
}

#comm_area [class~=comm_notice] #sidx_lat {
	width: 100%;
	background: none;
}

#comm_area [class~=comm_notice] [class~=lat] {
	border: 0;
	padding: 0;
	min-height: auto;
}

.lat ul {
	padding: 20px 0;
}

#comm_area [class~=comm_notice] [class~=lat] li[class~=basic_li] {
	float: left;
	height: 30px;
}

#comm_area [class~=comm_notice] [class~=lat] li {
	width: 100%;
	padding-left: 0;
	border-bottom: 0;
	margin-bottom: 0;
}

#comm_area [class~=comm_quick] {
	float: right;
	width: 300px;
	height: 260px;
	text-align: left;
	border: 0px solid red;
	padding: 30px 0;
}

#comm_area [class~=comm_quick] ul {
	width: auto;
	left: 0;
	padding: 0;
	margin: 0;
	padding-top: 10px;
}

#ft {
	width: 100%;
	height: 213.63px;
	clear: both;
	padding: 0 0 40px;
	min-width: 320px;
	border-top: 1px solid #e9e9e9;
	background: #f8f8f8;
	margin-top: 0px;
	text-align: left;
}

#ft [class~=ft_wr] {
	margin: 0 auto;
	width: 100%;
	max-width: 1300px;
}

#ft [class~=ft_ul] {
	padding: 15px 0;
	margin: 0 0 20px;
	text-align: left;
	border-bottom: 0;
	margin-bottom: 10px;
}

#ft [class~=ft_ul] li:first-child {
	margin-left: 0;
}

#ft [class~=ft_ul] li {
	display: inline-block;
	font-weight: bold;
	margin: 0 10px;
}

#ft_logo {
	float: left;
	width: 200px;
	margin: 10px 0 0;
	display: none;
}

[class~=saview] {
	display: none;
}

#ft [class~=ft_info] {
	float: left;
	width: 80%;
	line-height: 1.7em;
}

#ft [class~=ft_info] span {
	margin-right: 15px;
	color: #877;
	font-size: 1em;
}

#ft [class~=ft_info] span b {
	margin-right: 5px;
	font-weight: normal;
	color: #000;
	font-size: 1em;
}

#ft [class~=ft_info] p {
	font-size: 1em;
	margin-top: 15px;
}

#ft [class~=ft_cs] {
	position: relative;
	top: -20px;
	float: left;
	width: 20%;
	text-align: left;
	padding: 10px 20px;
	border: 1px solid #ddd;
	background: #fff;
}

#ft [class~=ft_cs] h2 {
	display: block;
	padding-right: 5px;
}

#ft [class~=ft_cs] strong {
	font-size: 1.75em;
	margin: 5px 0;
	display: inline-block;
}

#ft [class~=ft_cs] p {
	font-size: 0.92em;
	color: #877;
}



</style>	
	
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />	
<div id="wrap">
	<div id="comm_area">
	
			<div class="comm_cs">
				<h4>Customer center</h4>
				<p class="tel">
					<i class="fa fa-phone-square" aria-hidden="true"></i> 010-8000-8408
				</p>
				<p style="font-weight: 700;">
					TEL 070-8274-1113<br>(상품문의는 핸드폰으로)<br>H.P 010-8000-8408
				</p>
					<p>
						평일 10:00~17:00<br>토,일,공휴일 : 휴무
					</p>
				</div>
				<div class="comm_bank">
					<h4>bank info</h4>
					<p>
						농협 301-8000-8408-11<br>예금주 : <strong>박 전 광</strong>
					</p>
					<p>
						<img src="http://bant.co.kr/kcp.png">
					</p>
				</div>
				<div class="comm_notice">
					<h4>notice</h4>
					<!-- 커뮤니티 최신글 시작 { -->
					<section id="sidx_lat">
						<div class="lat">
							<ul>
								<li class="basic_li">
									<a href="http://bant.co.kr/bbs/board.php?bo_table=notice&amp;wr_id=48">
										10월27일 사은품 입고 되었습니다.&nbsp;
									</a><span class="hot_icon"><i class="fa fa-heart" aria-hidden="true"></i>
									<span class="sound_only">인기글</span></span>
								</li>
								<li class="basic_li">
									<a href="http://bant.co.kr/bbs/board.php?bo_table=notice&amp;wr_id=47">
										사은품 일시 품절&nbsp;
									</a><span class="hot_icon"><i class="fa fa-heart" aria-hidden="true"></i>
									<span class="sound_only">인기글</span></span>
								</li>
								<li class="basic_li">
									<a href="http://bant.co.kr/bbs/board.php?bo_table=notice&amp;wr_id=35">
										반티 사은품&nbsp;
									</a><span class="hot_icon"><i class="fa fa-heart" aria-hidden="true" ></i>
									<span class="sound_only">인기글</span></span>
								</li>
								<li class="basic_li">
									<a href="http://bant.co.kr/bbs/board.php?bo_table=notice&amp;wr_id=30">
										반티문구&nbsp;
									</a><span class="hot_icon"><i class="fa fa-heart" aria-hidden="true"></i>
									<span class="sound_only">인기글</span></span>
								</li>
							</ul>
						</div>
					</section>
					<!-- } 커뮤니티 최신글 끝 -->

				</div>

				<div class="comm_quick">
					<h4>RETURN / EXCHANGE</h4>
					<p><strong>서울 중구 을지로 227 패션벤쳐타운 지하 264호</strong>
					<br>자세한 교환·반품절차 안내는 상품하단을 참고해주세요
					</p><p></p>
					<ul>
						<li>
						
						<%-- style="margin-top: 20px;" 임시방편--%>
							<a href="http://bant.co.kr/shop/cart.php">
							<span><i class="fa fa-shopping-basket" aria-hidden="true" style="margin-top: 20px;"></i></span>
							<p>장바구니</p></a>
						</li>
						<li>
							<a href="http://bant.co.kr/shop/orderinquiry.php">
							<span><i class="fa fa-truck" aria-hidden="true" style="margin-top: 20px;"></i></span>
							<p>배송조회</p></a>
						</li>
						<li>
							<a href="http://bant.co.kr/kakao_70.png"><img src="http://bant.co.kr/kakao_70.png">
							<p>카톡문의</p></a>
						</li>
						<li>
							<a href="http://bant.co.kr/shop/orderinquiry.php">
							<span><i class="fa fa-desktop" aria-hidden="true" style="margin-top: 20px;"></i></span>
							<p>주문조회</p></a>
						</li>
					</ul>
				</div>
			</div>
		</div>

		<div id="ft">
			<div class="ft_wr">
				<ul class="ft_ul">
					<li><a href="http://bant.co.kr/shop/">홈으로</a></li>
					<li><a href="http://bant.co.kr/bbs/content.php?co_id=company">회사소개</a></li>
					<li><a href="http://bant.co.kr/bbs/content.php?co_id=provision">이용약관</a></li>
					<li><a href="http://bant.co.kr/bbs/content.php?co_id=privacy">개인정보처리방침</a></li>
				</ul>

			<div class="ft_info">
				<span><b>회사명</b> 제이글로벌(반티세트)</span> 
				<span><b>대표</b> 박 전 광</span><br class="saview">
				<span><b>주소</b> 서울 중구 을지로 227 패션벤쳐타운 지하 264호</span><br class="saview">
				<span><b>TEL</b> 010-8000-8408</span>
				<span><b>E-MAIL</b> bantmd@gmail.com</span><br>
				<span><b>사업자등록번호</b> 109-04-99322 <!------------ 사업자정보확인 시작-------------->
					<a href="javascript:window.open(&quot;http://www.ftc.go.kr/bizCommPop.do?wrkr_no=109-04-99322&quot;,&quot;bizinfo&quot;,&quot;width=750,height=700,scrollbars=1&quot;);">
						[사업자정보확인]
					</a></span><br class="saview"> 
				<span><b>통신판매업신고번호</b>2011-서울중구-1568</span><br class="saview"> 
				<span><b>개인정보책임관리자</b>박 전 광</span><br><br>

				<p>COPYRIGHT © 2010 제이글로벌 ALL RIGHTS RESERVED.</p>
			</div>

			<div class="ft_cs">
				<h2>상담전화</h2>
				<strong>010-8000-8408</strong>
				<p>평일 10:00-17:00<br>문자가능/토,일 휴무</p>
			</div>


<script>
	$(function() {
		$("#top_btn").on("click", function() {
			$("html, body").animate({
				scrollTop : 0
			}, '500');
			return false;
		});
	});
</script>
<script>
		window.dataLayer = window.dataLayer || [];
		function gtag() {
			dataLayer.push(arguments);
		}
		gtag('js', new Date());

		gtag('config', 'UA-47790764-2');
	</script>

<%-- 
	<script type="text/javascript" src="../wcs.naver.net/wcslog.js"></script>
	<script type="text/javascript">
		if (!wcs_add)
			var wcs_add = {};
		wcs_add["wa"] = "109d2c571f0f19";
		wcs_do();
	</script>
	<script src="js/sns.js"></script>
		</div>
	</div>
--%>