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
				
				
			</ul>
		</div><%-- hititem 끝 --%>
	</div><%-- container 끝 --%>
	<%-- 상품리스트 끝 --%>


	
	
	
	
	

