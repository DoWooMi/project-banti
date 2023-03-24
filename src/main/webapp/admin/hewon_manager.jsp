<%@page import="java.util.List"%>
<%@page import="xyz.itwill.dto.HewonDTO"%>
<%@page import="xyz.itwill.dao.HewonDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<%@include file="/security/admin_check.jspf" %> 

<%List<HewonDTO> hewonList=HewonDAO.getDAO().selectHewonList();%>

<style type="text/css">

form {
    display: block;
    margin-top: 0em;
}
.content {
    margin: 5px;
    padding: 10px;
    min-height: 600px;
    border: 1px solid #BDBDBD;
    border-radius: 20px;
    text-align: center;
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

#removeBtn{
	margin-top: 25px;
}

table {
    margin: 0 auto;
    border: 1px solid black;
    border-collapse: collapse;
}
tr {
    display: table-row;
    vertical-align: inherit;
    border-color: inherit;
}
th, td {
	border: 1px solid black;
	padding: 3px;
	text-align: center;
	font-size: 12px;
}
th {
	background-color: black;
	color: white;
}

.h_check { width: 60px; }
.h_hewonid { width: 80px; }
.h_name { width: 80px; }
.h_email { width: 140px; }
.h_phone { width: 140px; }
.h_address { width: 300px; }
.h_joindate { width: 140px; }
.h_lastlogin { width: 140px; }
.h_status { width: 80px; }

</style>

<%-- body --%>
<div class="content">
	<h2>회원목록</h2>
		<form name="hewonForm" id="hewonForm">
			<table>
				<tr>
					<th><input type="checkbox" id="allCheck" name="allCheck" class="check"></th>
					<th>아이디</th>
					<th>이름</th>
					<th>이메일</th>
					<th>전화번호</th>
					<th>주소</th>
					<th>최초 가입</th>
					<th>최종 로그인</th>					
					<th>상태</th>
				</tr>
					
				<%-- 회원정보 --%>
				<% for(HewonDTO hewon:hewonList) { %>
				<tr>
					<td class="h_check">
						<% if(hewon.getH_status()==2) { %>
						 관리자
						<% } else { %>
						<input type="checkbox" name="checkId" id="checkId" value="<%=hewon.getH_hewonid()%>" class="check">
						<% } %>
					</td>
					<td class="h_hewonid"><%=hewon.getH_hewonid() %></td>
					<td class="h_name"><%=hewon.getH_name() %></td>
					<td class="h_email"><%=hewon.getH_email() %></td>
					<td class="h_phone"><%=hewon.getH_phone() %></td>
					<td class="h_address">
						[<%=hewon.getH_zipcode() %>]<%=hewon.getH_address1() %> <%=hewon.getH_address2() %>
					</td>
					<td class="h_joindate"><%=hewon.getH_joindate() %></td>
					<td class="h_lastlogin">
						<% if(hewon.getH_lastlogin()!=null) { %>
							<%=hewon.getH_joindate() %>
						<% } %>
					</td>
					<td class="h_statustd">
						<select class="h_status" name="<%=hewon.getH_hewonid()%>">
							<option value="0" <% if(hewon.getH_status()==0) { %> selected="selected" <% } %> >탈퇴회원</option>
							<option value="1" <% if(hewon.getH_status()==1) { %> selected="selected" <% } %> >일반회원</option>
							<option value="2" <% if(hewon.getH_status()==2) { %> selected="selected" <% } %> >관리자</option>					
						</select>
					</td>
				</tr>	
				<% } %>
			</table>
			<p><button type="button" id="removeBtn">선택회원삭제</button></p>
			<div id="message" style="color: red;"></div>
	</form>
</div>				

<script type="text/javascript">
$("#allCheck").change(function() {
	if($(this).is(":checked")) {
		$(".check").prop("checked",true);
	} else {
		$(".check").prop("checked",false);
	}
});

$("#removeBtn").click(function() {
	if($(".check").filter(":checked").length==0) {
		$("#message").text("선택된 회원이 하나도 없습니다.");
		return;
	}
	
	$("#hewonForm").attr("action", "<%=request.getContextPath()%>/index.jsp?menugroup=admin&menu=hewon_remove_action");
	$("#hewonForm").attr("method","post");
	
	$("#hewonForm").submit();
});
$(".h_status").change(function() {
	var h_hewonid=$(this).attr("name");
	var h_status=$(this).val();
	
	location.href="<%=request.getContextPath()%>/index.jsp?menugroup=admin&menu=hewon_status_action&h_hewonid="+h_hewonid+"&h_status="+h_status;
});
</script>