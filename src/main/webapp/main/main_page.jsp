<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/banti0.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/banti1.css">
<style type="text/css">
h2 {
    margin: 0;
    padding: 0;
    font-size: 13px;
    color: #333;
    line-height: 1.6em;
    font-family: 'Noto Sans KR', sans-serif;
    font-weight: 400;
    letter-spacing: -0.02em;
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
.imglist{
	/*width: 280px;
	height: 450px;
	margin: 20px 10px;
	float: left;*/
	float: left;
	margin: 20px 10px;
	display: inline-block;
}
#container {
	position: relative;
    float: none;
    width: 100%;
    margin: 0 auto;
    height: 500px;
    background: white;
}
#hititem, #popitem {
	position: relative;
	width: 1300px;
	margin: 0 auto;
	padding: 0;
}
.hit_8, .pop_8{
	width: 1300px;
	margin: 0 auto;
}
.sct_txt {
	border-bottom: 1px solid gray;
	font-size: 1.1em;
	margin: 10px 0;
	padding-bottom: 10px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}
.sct_basic {
	margin-bottom: 5px;
	color: #6e7f88;
}
.sct_cost {
	margin: 5px 0 10px;
	font-size: 1.25em;
	font-weight: bold;
}
.bn_2_li {
	width: 1300px;
	height: 350px;
	margin: 0 auto;
}
.left, .right {
	margin: 50px auto;
	display: inline;
}
#slider {
	position: relative;
	width: 100%;
	height: 550px;
	background-color: white;
}
/* 슬라이더 이미지가 출력되는 태그의 CSS 스타일 속성 */
#sliderContainer {
	position: relative;
	width: 100%;
	height: 500px;
	margin: 0 auto;
	overflow: hidden;
}
/* 슬라이더 이미지 태그 - 모든 슬라이더 이미지가 중첩되어 출력 */
#sliderContainer img {
	display: block;
	position: absolute;
}
/* 왼쪽 화살표 이미지 태그 - 슬라이더 이미지 태그의 왼쪽에 중첩되어 위치 - 윗부분에 배치 */
#leftImg {
	position: absolute;
	display: inline-block;
	top: 165px;
	z-index: 100;
	left: 0px;
}
/* 오른쪽 화살표 이미지 태그 - 슬라이더 이미지 태그의 오른쪽에 중첩되어 위치 - 윗부분에 배치 */
#rightImg {
	position: absolute;
	display: inline-block;
	top: 165px;
	z-index: 100;
	right: 0px;
}
</style>
	<%-- 배너 시작 --%>
	<div id="slider">
		<div id="sliderContainer">
			<img src="http://www.bant.co.kr/data/banner/39?20220307221657" width="100%"> 
			<img src="http://www.bant.co.kr/data/banner/27?20220331122419" width="100%">
			<img src="http://www.bant.co.kr/data/banner/30?20220304011958" width="100%"> 
			<img src="http://www.bant.co.kr/data/banner/37?20220302191819" width="100%"> 
		</div>
		<img src="/project4/main/images/left.png" id="leftImg">
		<img src="/project4/main/images/right.png" id="rightImg">
	</div>
	<script type="text/javascript">
	//모든 슬라이더 이미지 태그를 검색하여 변수에 저장
	var $images=$("#sliderContainer").find("img");
	
	//검색된 모든 슬라이더 이미지 태그를 저장하기 위한 Array 객체 생성
	var imageArray=new Array();
	
	//Array 객체에 검색된 모든 슬라이더 이미지 태그를 요소값으로 저장
	$images.each(function() {//명시적 반복을 이용한 일괄처리
		imageArray.push($(this));//배열 요소를 추가하여 이미지 태그 저장
	});
	//모든 슬라이더 이미지 태그를 슬라이더 출력 영역 왼쪽에 위치하여 숨겨지도록 설정
	$images.css("left",-1920);
	//
	//첫번째 슬라이더 이미지 태그를 슬라이더 출력 영역에 위치하여 출력되도록 설정
	$images.eq(0).css("left",0);
	
	//4초마다 슬라이더 영역에 출력될 슬라이더 이미지 태그를 변경하도록 처리하는 함수
	function sliding() {
		return setInterval(function() {
			//Array 객체의 첫번째 요소값(슬라이더 이미지 태그)를 변수에 저장
			var $currentImage=imageArray[0];//슬라이더 영역에 출력된 현재 이미지
			
			//Array 객체의 두번째 요소값(슬라이더 이미지 태그)를 변수에 저장
			var $nextImage=imageArray[1];//슬라이더 영역에 출력될 다음 이미지
			
			//다음 슬라이더 이미지 태그를 슬라이더 출력 영역 왼쪽에 위치하여 숨겨지도록 설정
			$nextImage.css("left",-1920);
			
			//현재 출력된 슬라이더 이미지 태그를 슬라이더 출력 영역의 오른쪽으로 이동하여 숨겨지도록 설정
			$currentImage.stop().animate({"left":1920}, 1500);
			
			//다음에 출력될 슬라이더 이미지 태그를 슬라이더 출력 영역에 위치되도록 이동 - 출력
			$nextImage.stop().animate({"left":0}, 1500);
			
			//Array 객체의 첫번째 요소를 제거하고 제거된 요소값(슬라이더 이미지 태그)을 반환받아 저장
			$removeImage=imageArray.shift();
			//
			//Array 객체의 마지막 요소를 추가하고 요소값(슬라이더 이미지 태그)을 저장
			imageArray.push($removeImage);
		}, 4000);
	}
	//마우스 커서가 그림에 위치하면 이동하는거를 멈추게하는 코드
	var intervalId=sliding();
	//
	//슬라이더 태그에 마우스 커서가 진입한 경우 콜백함수 호출
	$("#slider").mouseover(function() {
		clearInterval(intervalId);//setInterval() 함수 실행 취소
	});
	//슬라이더 태그에서 마우스 커서가 벗어난 경우 콜백함수 호출
	$("#slider").mouseout(function() {
		intervalId=sliding();
	});
	//화살표 이미지 태그에 마우스 커서가 진입한 경우 콜백함수 호출
	$("#arrowContainer img").mouseover(function() {
		clearInterval(intervalId);
	});
//오른쪽 화살표 이미지를 클릭한 경우 콜백함수 호출
	$("#rightImg").click(function() {
		var $currentImage=imageArray[0];
		var $nextImage=imageArray[1];
		$nextImage.css("left",-2000);
		$currentImage.stop().animate({"left":1920}, 1500);
		$nextImage.stop().animate({"left":0}, 1500);
		$removeImage=imageArray.shift();
		imageArray.push($removeImage);
	});
//왼쪽 화살표 이미지를 클릭한 경우 콜백함수 호출
	$("#leftImg").click(function() {
		var $currentImage=imageArray[0];
		var $previousImage=imageArray[imageArray.length-1];
		$previousImage.css("left",2000);
		$currentImage.stop().animate({"left":-1920}, 1500);
		$previousImage.stop().animate({"left":0}, 1500);
		$removeImage=imageArray.pop();
		imageArray.unshift($removeImage);
	});		
	</script>
	<%-- 배너 끝 --%>

	<%-- HIT ITEM 시작 --%>
	<div id="container">
		<div id="hititem">
			<h2 style="text-align: center;">HIT ITEM</h2>
				<ul class="hit_8">
					<%-- 삐에로 반피 풀세트 --%>
					<li style="width: 280px;" class="imglist">
					<div>
						<a href="<%=request.getContextPath()%>/index.jsp?menugroup=detailpage&menu=detailpage&p_pnum=1301">
							<img alt="삐에로 반티 풀세트" src="http://www.bant.co.kr/data/item/BG420/thumb-main_300x300.jpg" width="280px;" height="300px;" id="pie">
						</a>
						<script type="text/javascript">
							$("#pie").hover(function() {//태그에 진입한 경우 호출되는 콜백함수
								$(this).attr("src","http://www.bant.co.kr/data/item/BG420/thumb-main_2_300x300.jpg")
							}, function() {//태그에 벗어난 경우 호출되는 콜백함수
								$(this).attr("src","http://www.bant.co.kr/data/item/BG420/thumb-main_300x300.jpg")
							});
						</script>
					</div>
					<div class="sct_txt">삐에로 반티 풀세트/졸업사진 컨셉/맥도날드</div>
					<div class="sct_basic">상하의 세트+삐에로가발+스폰지코+삐에로양말(신발은 소품)</div>
					<div class="sct_cost">19,000원</div>
				</li>
					
				<%-- 교련복 반팔 긴바지 --%>
				<li style="width: 280px;" class="imglist">
					<div>
						<a href="<%=request.getContextPath()%>/index.jsp?menugroup=detailpage&menu=detailpage&p_pnum=1302">
							<img alt="교련복 반팔 긴바지" src="http://www.bant.co.kr/data/item/BG220/thumb-1647753566_8352_main_2_300x300.jpg" width="280px;" height="300px;" id="sch">
						</a>
						<script type="text/javascript">
							$("#sch").hover(function() {//태그에 진입한 경우 호출되는 콜백함수
								$(this).attr("src","http://www.bant.co.kr/data/item/BG220/thumb-main_300x300.jpg")
							}, function() {//태그에 벗어난 경우 호출되는 콜백함수
								$(this).attr("src","http://www.bant.co.kr/data/item/BG220/thumb-1647753566_8352_main_2_300x300.jpg")
							});
						</script>
					</div>
					<div class="sct_txt">교련복 반팔 긴바지 반티/인쇄/검정/복고풍/뉴트로</div>
					<div class="sct_basic">교련복 반팔+긴바지 : 20,000원</div>
					<div class="sct_cost">12,000원</div>
				</li>
				<%-- 개구리 군복 반팔 긴바지 --%>
					
				<li style="width: 280px;" class="imglist">
					<div>
						<a href="<%=request.getContextPath()%>/index.jsp?menugroup=detailpage&menu=detailpage&p_pnum=1303">
							<img alt="개구리 군복 반팔 긴바지" src="http://www.bant.co.kr/data/item/BG208/thumb-main_300x300.jpg" width="280px;" height="300px;" id="solban">
						</a>
						<script type="text/javascript">
							$("#solban").hover(function() {//태그에 진입한 경우 호출되는 콜백함수
								$(this).attr("src","http://www.bant.co.kr/data/item/BG208/thumb-main_2_300x300.jpg")
							}, function() {//태그에 벗어난 경우 호출되는 콜백함수
								$(this).attr("src","http://www.bant.co.kr/data/item/BG208/thumb-main_300x300.jpg")
							});
						</script>
					</div>
					<div class="sct_txt">개구리 군복 반팔 긴바지 반티/인쇄/밀리터리/구형전투복</div>
					<div class="sct_basic">반팔: 12,000원, 긴바지:9,000원</div>
					<div class="sct_cost">12,000원</div>
				</li>
				<%-- 로카티 후드티 반티세트 --%>
				
				<li style="width: 280px;" class="imglist">
					<div>
						<a href="<%=request.getContextPath()%>/index.jsp?menugroup=detailpage&menu=detailpage&p_pnum=1304">
							<img alt="로카티 후드티 반티세트" src="http://www.bant.co.kr/data/item/BG122/thumb-main_300x300.jpg" width="280px;" height="300px;" id="hood">
						</a>
						<script type="text/javascript">
							$("#hood").hover(function() {//태그에 진입한 경우 호출되는 콜백함수
								$(this).attr("src","http://www.bant.co.kr/data/item/BG122/thumb-main_2_300x300.jpg")
							}, function() {//태그에 벗어난 경우 호출되는 콜백함수
								$(this).attr("src","http://www.bant.co.kr/data/item/BG122/thumb-main_300x300.jpg")
							});
						</script>
					</div>
					<div class="sct_txt">로카티 후드티 반티세트</div>
					<div class="sct_basic">[주문생산] 배송기간 5~6일//30장 이상 주문 시 다른 티셔츠 색상 주문 생산 가능합니다.</div>
					<div class="sct_cost">21,000원</div>
				</li>
				<%-- 로카티 맨투맨 반티세트 --%>
				<li style="width: 280px;" class="imglist">
					<div>
						<a href="<%=request.getContextPath()%>/index.jsp?menugroup=detailpage&menu=detailpage&p_pnum=1305">
							<img alt="로카티 맨투맨 반티세트" src="http://www.bant.co.kr/data/item/BG121/thumb-main_300x300.jpg" width="280px;" height="300px;" id="man">
						</a>
						<script type="text/javascript">
							$("#man").hover(function() {//태그에 진입한 경우 호출되는 콜백함수
								$(this).attr("src","http://www.bant.co.kr/data/item/BG121/thumb-main_2_300x300.jpg")
							}, function() {//태그에 벗어난 경우 호출되는 콜백함수
								$(this).attr("src","http://www.bant.co.kr/data/item/BG121/thumb-main_300x300.jpg")
							});
						</script>
					</div>
					<div class="sct_txt">로카티 맨투맨 반티세트</div>
					<div class="sct_basic">[주문생산] 배송기간 5~6일//30장 이상 주문 시 다른 티셔츠 색상 주문 생산 가능합니다.</div>
					<div class="sct_cost">17,000원</div>
				</li>
				<%-- 로카티 반팔 반티세트 --%>
				<li style="width: 280px;" class="imglist">
					<div>
						<a href="<%=request.getContextPath()%>/index.jsp?menugroup=detailpage&menu=detailpage&p_pnum=1306">
							<img alt="로카티 맨투맨 반티세트" src="http://www.bant.co.kr/data/item/19SS_0209/thumb-main3_300x300.jpg" width="280px;" height="300px;" id="ban">
						</a>
						<script type="text/javascript">
							$("#ban").hover(function() {//태그에 진입한 경우 호출되는 콜백함수
								$(this).attr("src","http://www.bant.co.kr/data/item/19SS_0209/thumb-main_2_300x300.jpg")
							}, function() {//태그에 벗어난 경우 호출되는 콜백함수
								$(this).attr("src","http://www.bant.co.kr/data/item/19SS_0209/thumb-main3_300x300.jpg")
							});
						</script>
					</div>
					<div class="sct_txt">로카티 반팔 반티세트</div>
					<div class="sct_basic">[빠른배송가능] 20장 이상 주문 시 다른 티셔츠 색상 주문생산 가능합니다.</div>
					<div class="sct_cost">9,000원</div>
				</li>
				<%-- 해병대 빨강 반팔 티셔츠 반티 --%>
				<li style="width: 280px;" class="imglist">
					<div>
						<a href="<%=request.getContextPath()%>/index.jsp?menugroup=detailpage&menu=detailpage&p_pnum=1307">
							<img alt="로카티 맨투맨 반티세트" src="http://www.bant.co.kr/data/item/BG102/thumb-main_300x300.jpg" width="280px;" height="300px;" id="mar">
						</a>
						<script type="text/javascript">
							$("#mar").hover(function() {//태그에 진입한 경우 호출되는 콜백함수
								$(this).attr("src","http://www.bant.co.kr/data/item/BG102/thumb-main_2_300x300.jpg")
							}, function() {//태그에 벗어난 경우 호출되는 콜백함수
								$(this).attr("src","http://www.bant.co.kr/data/item/BG102/thumb-main_300x300.jpg")
							});
						</script>
					</div>
					<div class="sct_txt">해병대 빨강 반팔 티셔츠 반티/반바지/조교모자 옷/체육대회</div>
					<div class="sct_basic">해병대 티셔츠 상의: 8,500원, 반바지 하의: 8,000원, 4부 해병대 반바지 9,000원</div>
					<div class="sct_cost">8,500원</div>
				</li>
				<%-- 개구리 군복 긴팔 긴바지 반티 --%>
				<li style="width: 280px;" class="imglist">
					<div>
						<a href="<%=request.getContextPath()%>/index.jsp?menugroup=detailpage&menu=detailpage&p_pnum=1308">
							<img alt="로카티 맨투맨 반티세트" src="http://www.bant.co.kr/data/item/BG209/thumb-main_300x300.jpg" width="280px;" height="300px;" id="sol">
						</a>
						<script type="text/javascript">
							$("#sol").hover(function() {//태그에 진입한 경우 호출되는 콜백함수
								$(this).attr("src","http://www.bant.co.kr/data/item/BG209/thumb-main_2_300x300.jpg")
							}, function() {//태그에 벗어난 경우 호출되는 콜백함수
								$(this).attr("src","http://www.bant.co.kr/data/item/BG209/thumb-main_300x300.jpg")
							});
						</script>
					</div>
					<div class="sct_txt">개구리 군복 긴팔 긴바지 반티/인쇄/밀리터리/구형전투복</div>
					<div class="sct_basic">해병대 티셔츠 상의: 8,500원, 반바지 하의: 8,000원, 4부 해병대 반바지 9,000원</div>
					<div class="sct_cost">8,500원</div>
				</li>
			</ul>
		</div>
	<%-- HIT ITEM 끝 --%>



	<%-- 중간에 광고 시작 --%>
		<div class="bn_2_li" style="padding-bottom: 40px;">
			<div class="left">
				<a href="bbs/board7056.html?bn_id=35"> 
				<img src="http://www.bant.co.kr/data/banner/35?20220318132634" alt="반티 사은품안내" width="640" height="300">
				</a>
			</div>
			<div class="right">
				<a href="shop/list5a8f.html?bn_id=29"> 
				<img src="http://www.bant.co.kr/data/banner/29?20220307221909" alt="오징어 체육복" width="640" height="300">
				</a>
			</div>
		</div>
	<%-- 중간에 광고 끝 --%>
	
	
	
	<%-- POPULAR ITEM 시작 --%>
		<div id="popitem">
			<h2 style="text-align: center;">POPULAR ITEM</h2>
			<ul class="pop_8">
				<%-- 오징어 오픈 야구복 초록색 반티 --%>
				<li style="width: 280px;" class="imglist">
					<div>
						<a href="<%=request.getContextPath()%>/index.jsp?menugroup=detailpage&menu=detailpage&p_pnum=1309">
							<img alt="오징어 오픈 야구복 초록색 반티" src="http://www.bant.co.kr/data/item/BG413/thumb-main_300x300.jpg" width="280px;" height="300px;" id="open">
						</a>
						<script type="text/javascript">
							$("#open").hover(function() {//태그에 진입한 경우 호출되는 콜백함수
								$(this).attr("src","http://www.bant.co.kr/data/item/BG413/thumb-main_2_300x300.jpg")
							}, function() {//태그에 벗어난 경우 호출되는 콜백함수
								$(this).attr("src","http://www.bant.co.kr/data/item/BG413/thumb-main_300x300.jpg")
							});
						</script>
					</div>
					<div class="sct_txt">오징어 오픈 야구복 초록색 반티/인쇄/닉네임 번호/게임/그린</div>
					<div class="sct_basic">상의:12,500원 하의:12,000원</div>
					<div class="sct_cost">12,500원</div>
				</li>
				<%-- 오징어 핑크 수트 관리자 반티 --%>
				<li style="width: 280px;" class="imglist">
					<div>
						<a href="<%=request.getContextPath()%>/index.jsp?menugroup=detailpage&menu=detailpage&p_pnum=1310">
							<img alt="오징어 핑크 수트 관리자 반티" src="http://www.bant.co.kr/data/item/BG402/thumb-main_300x300.jpg" width="280px;" height="300px;" id="pink">
						</a>
						<script type="text/javascript">
							$("#pink").hover(function() {//태그에 진입한 경우 호출되는 콜백함수
								$(this).attr("src","http://www.bant.co.kr/data/item/BG402/thumb-main_2_300x300.jpg")
							}, function() {//태그에 벗어난 경우 호출되는 콜백함수
								$(this).attr("src","http://www.bant.co.kr/data/item/BG402/thumb-main_300x300.jpg")
							});
						</script>
					</div>
					<div class="sct_txt">오징어 핑크 수트 관리자 반티/인쇄/명찰 이름표/트레이닝복/운영자/진행요원/게임</div>
					<div class="sct_basic">핑크 수트 : 24,000원</div>
					<div class="sct_cost">24,000원</div>
				</li>
				<%-- 용포 검정 반티 --%>
				<li style="width: 280px;" class="imglist">
					<div>
						<a href="<%=request.getContextPath()%>/index.jsp?menugroup=detailpage&menu=detailpage&p_pnum=1311">
							<img alt="용포 검정 반티" src="http://www.bant.co.kr/data/item/BG367/thumb-main_300x300.jpg" width="280px;" height="300px;" id="king">
						</a>
						<script type="text/javascript">
							$("#king").hover(function() {//태그에 진입한 경우 호출되는 콜백함수
								$(this).attr("src","http://www.bant.co.kr/data/item/BG367/thumb-main_2_300x300.jpg")
							}, function() {//태그에 벗어난 경우 호출되는 콜백함수
								$(this).attr("src","http://www.bant.co.kr/data/item/BG367/thumb-main_300x300.jpg")
							});
						</script>
					</div>
					<div class="sct_txt">용포 검정 반티/단체티/인쇄/곤룡포/한복/왕옷/전하/세자/블랙</div>
					<div class="sct_basic">용포 상의:13,000원, 5부 반바지(검정): 8,000원</div>
					<div class="sct_cost">13,000원</div>
				</li>
				<%-- 라바 잠옷 반바지 반티 세트 --%>
				<li style="width: 280px;" class="imglist">
					<div>
						<a href="<%=request.getContextPath()%>/index.jsp?menugroup=detailpage&menu=detailpage&p_pnum=1312">
							<img alt="라바 잠옷 반바지 반티 세트" src="http://www.bant.co.kr/data/item/BG385/thumb-main_300x300.jpg" width="280px;" height="300px;" id="lava">
						</a>
						<script type="text/javascript">
							$("#lava").hover(function() {//태그에 진입한 경우 호출되는 콜백함수
								$(this).attr("src","http://www.bant.co.kr/data/item/BG385/thumb-main_2_300x300.jpg")
							}, function() {//태그에 벗어난 경우 호출되는 콜백함수
								$(this).attr("src","http://www.bant.co.kr/data/item/BG385/thumb-main_300x300.jpg")
							});
						</script>
					</div>
					<div class="sct_txt">라바 잠옷 반바지 반티 세트(안대포함)/수면/인쇄/민트/짱구</div>
					<div class="sct_basic">라바 잠옷(반팔+반바지+안대) : 18,000원</div>
					<div class="sct_cost">18,000원</div>
				</li>
				<%-- 119 소방 반팔 남방 반티 --%>
				<li style="width: 280px;" class="imglist">
					<div>
						<a href="<%=request.getContextPath()%>/index.jsp?menugroup=detailpage&menu=detailpage&p_pnum=1313">
							<img alt="119 소방 반팔 남방 반티" src="http://www.bant.co.kr/data/item/BG414/thumb-main_300x300.jpg" width="280px;" height="300px;" id="fire">
						</a>
						<script type="text/javascript">
							$("#fire").hover(function() {//태그에 진입한 경우 호출되는 콜백함수
								$(this).attr("src","http://www.bant.co.kr/data/item/BG414/thumb-main_2_300x300.jpg")
							}, function() {//태그에 벗어난 경우 호출되는 콜백함수
								$(this).attr("src","http://www.bant.co.kr/data/item/BG414/thumb-main_300x300.jpg")
							});
						</script>
					</div>
					<div class="sct_txt">119 소방 반팔 남방 반티/주황 오렌지/의상 옷 코스프레/체육대회/졸업사진/긴급 출동</div>
					<div class="sct_basic">라바 잠옷(반팔+반바지+안대) : 18,000원</div>
					<div class="sct_cost">18,000원</div>
				</li>
				<%-- 새마을 농촌 반티 세트 --%>
				<li style="width: 280px;" class="imglist">
					<div>
						<a href="<%=request.getContextPath()%>/index.jsp?menugroup=detailpage&menu=detailpage&p_pnum=1314">
							<img alt="새마을 농촌 반티 세트" src="http://www.bant.co.kr/data/item/19SS_0208_A/thumb-main_300x300.jpg" width="280px;" height="300px;" id="country">
						</a>
						<script type="text/javascript">
							$("#country").hover(function() {//태그에 진입한 경우 호출되는 콜백함수
								$(this).attr("src","http://www.bant.co.kr/data/item/19SS_0208_A/thumb-main_2_300x300.jpg")
							}, function() {//태그에 벗어난 경우 호출되는 콜백함수
								$(this).attr("src","http://www.bant.co.kr/data/item/19SS_0208_A/thumb-main_300x300.jpg")
							});
						</script>
					</div>
					<div class="sct_txt">새마을 농촌 반티 세트/장미/초록/체육대회/행사/단체/사은품</div>
					<div class="sct_basic">새마을 티셔츠:7,000원 몸빼 바지/치마:7,000원</div>
					<div class="sct_cost">7,000원</div>
				</li>
				<%-- 죄수복 블루 반팔 긴바지 반티 --%>
				<li style="width: 280px;" class="imglist">
					<div>
						<a href="<%=request.getContextPath()%>/index.jsp?menugroup=detailpage&menu=detailpage&p_pnum=1315">
							<img alt="죄수복 블루 반팔 긴바지 반티" src="http://www.bant.co.kr/data/item/BG229/thumb-main_300x300.jpg" width="280px;" height="300px;" id="prisoner">
						</a>
						<script type="text/javascript">
							$("#prisoner").hover(function() {//태그에 진입한 경우 호출되는 콜백함수
								$(this).attr("src","http://www.bant.co.kr/data/item/BG229/thumb-main_2_300x300.jpg")
							}, function() {//태그에 벗어난 경우 호출되는 콜백함수
								$(this).attr("src","http://www.bant.co.kr/data/item/BG229/thumb-main_300x300.jpg")
							});
						</script>
					</div>
					<div class="sct_txt">죄수복 블루 반팔 긴바지 반티/단체티/인쇄/파랑 하늘색/할로윈/수용자복</div>
					<div class="sct_basic">죄수복(반팔+긴바지) : 18,000원// 명찰:1,000원</div>
					<div class="sct_cost">18,000원</div>
				</li>
				<%-- 상어 가족 잠옷 반팔 반티 --%>
				<li style="width: 280px;" class="imglist">
					<div>
						<a href="<%=request.getContextPath()%>/index.jsp?menugroup=detailpage&menu=detailpage&p_pnum=1316">
							<img alt="상어 가족 잠옷 반팔 반티" src="http://bant.co.kr/data/item/BG268/thumb-main_300x300.jpg" width="280px;" height="300px;" id="shark">
						</a>
						<script type="text/javascript">
							$("#shark").hover(function() {//태그에 진입한 경우 호출되는 콜백함수
								$(this).attr("src","http://bant.co.kr/data/item/BG268/thumb-main_2_300x300.jpg")
							}, function() {//태그에 벗어난 경우 호출되는 콜백함수
								$(this).attr("src","http://bant.co.kr/data/item/BG268/thumb-main_300x300.jpg")
							});
						</script>
					</div>
					<div class="sct_txt">상어 가족 잠옷 반팔 반티/체육대회/의상/하늘색</div>
					<div class="sct_basic">반팔 잠옷 반티 : 19,000원</div>
					<div class="sct_cost">19,000원</div>
				</li>
			</ul>
		</div>
	<%-- POPULAR ITEM 끝 --%>
	</div>

