<%@page import="xyz.itwill.dto.HewonDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<%@include file="/security/login_check.jspf"%>

<style type="text/css">
#point {
    text-align: center;
}
.new_win {
    position: relative;
    background: #fff;
}
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
.new_win .new_win_con2 {
    margin: 20px 0 0;
}
#point {
    text-align: center;
}
#point .point_all {
    margin: 20px 20px 15px;
    border-radius: 5px;
    background: #edf3fc;
    border: 1px solid #d6e2f4;
    color: #485172;
    font-size: 1.083em;
}
ul {
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 40px;
}
.point_list li:first-child {
    border-top: 1px solid #ececec;
}
.point_list li {
    border-bottom: 1px solid #ececec;
    background: #fff;
    padding: 15px;
    list-style: none;
    position: relative;
}
.empty_list, .empty_li {
    padding: 20px 0 !important;
    text-align: center !important;
    color: #777 !important;
}
#point .point_status {
    background: #737373;
    border: 0;
    color: #fff;
    font-weight: bold;
    font-size: 1.083em;
    text-align: left;
}
.point_list li {
    padding: 15px;
    list-style: none;
    position: relative;
}





</style>
    
    
<div id="point" class="new_win">
	<br>
	<br>
    <h1 id="win_title"><%=loginHewon.getH_name() %> 님의 포인트 내역</h1>

    <div class="new_win_con2">
        <ul class="point_all">
        	<li class="full_li">
        		보유포인트
        		<span>0</span>
        	</li>
		</ul>
        <ul class="point_list">
            <li class="empty_li">자료가 없습니다.</li>
            <li class="point_status">
                소계
                <span>0</span>
                <span>0</span>
            </li>
        </ul>
    </div>

    
    <button type="button" onclick="javascript:window.close();" class="btn_close">창닫기</button>
</div>    