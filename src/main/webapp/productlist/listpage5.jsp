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
				
				
			</ul>
		</div><%-- hititem 끝 --%>
	</div><%-- container 끝 --%>
	<%-- 상품리스트 끝 --%>


	
	
	
	
	

