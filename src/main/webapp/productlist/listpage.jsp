<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/banti0.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/banti1.css">
<style type="text/css">

h2 {
    display: block;
    font-size: 1.8em;
    margin-block-start: 0.83em;
    margin-block-end: 0.83em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-weight: bold;
}
.imglist{
	width: 280px;
	height: 450px;
	margin: 20px 10px;
	float: left;
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

</style>
	

	<%-- 상품리스트 시작 --%>
	<div id="container">
		<div id="hititem">
			<h2 style="text-align: left;">상품 리스트</h2>
				<ul class="hit_8">
				
				
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
		</div><%-- hititem 끝 --%>
	</div><%-- container 끝 --%>
	<%-- 상품리스트 끝 --%>


	
	
	
	
	

