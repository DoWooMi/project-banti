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
				<br>
				<br>
				<p style="text-align: center; font-size: 30px; font-weight: bold;">상품을 준비중입니다. 열심히 준비해서 곧 좋은 상품으로 찾아뵙겠습니다.</p>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>

				
				
			</ul>
		</div><%-- hititem 끝 --%>
	</div><%-- container 끝 --%>
	<%-- 상품리스트 끝 --%>


	
	
	
	
	

