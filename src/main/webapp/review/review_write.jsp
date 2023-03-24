<%@page import="xyz.itwill.dto.ProductDTO"%>
<%@page import="xyz.itwill.dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     
<%
	//전달값을 반환받아 저장 - 전달값이 없는 경우(새글인 경우) 초기값 저장
	String r_ref="0", r_restep="0",r_relevel="0",pageNum="1";
	if(request.getParameter("r_ref")!=null) {//전달값이 있는 경우(답글인 경우)
		r_ref=request.getParameter("r_ref");
		r_restep=request.getParameter("r_restep");
		r_relevel=request.getParameter("r_relevel");
		pageNum=request.getParameter("pageNum");
	}
	/*
	int p_pnum= Integer.parseInt(request.getParameter("p_pnum"));
	session.setAttribute("product", ProductDAO.getDAO().selectProduct(p_pnum));
	ProductDTO product=(ProductDTO)session.getAttribute("product");
	*/
	
	String p_pnum=request.getParameter("p_pnum");
	session.setAttribute("product", ProductDAO.getDAO().selectProduct(Integer.parseInt(p_pnum)));
	ProductDTO product=(ProductDTO)session.getAttribute("product");
	
	
%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<style type="text/css">
.rating .rate_radio + label {
    position: relative;
    display: inline-block;
    margin-left: -4px;
    z-index: 10;
    width: 60px;
    height: 60px;
    background-image: url('/project4/images/starrate.png');
    background-repeat: no-repeat;
    background-size: 60px 60px;
    cursor: pointer;
    background-color: #f0f0f0;
}
.rating .rate_radio:checked + label {
    background-color: #ffd700;
}
</style>	
<link rel="stylesheet" href="http://www.bant.co.kr/theme/daontheme_shop01/skin/review/daon_basic/style.css?ver=191202">
<link rel="stylesheet" href="http://www.bant.co.kr/theme/daontheme_shop01/skin/latest/daon_shop_basic/style.css?ver=191202">


<div id="wrapper" style="clear:both;">  
	<!-- 콘텐츠 시작 { -->
	<div id="container">
		<!-- .shop-content 시작 { -->
		<div class="shop-content">		
			<div id="wrapper_title">별점과 리뷰를 남겨보세요</div>		
				    		
				<section id="bo_w">
    			
    			<!-- 게시물 작성 시작 { -->
    			<form action="<%=request.getContextPath()%>/index.jsp?menugroup=review&p_pnum=<%=product.getP_pnum() %>&menu=review_write_action" method="post" id="reviewForm">    			
    				<input type="hidden" name="r_ref" value="<%=r_ref%>">	
					<input type="hidden" name="r_restep" value="<%=r_restep%>">	
					<input type="hidden" name="r_relevel" value="<%=r_relevel%>">	
					<input type="hidden" name="pageNum" value="<%=pageNum%>">
					<input type="hidden" name="p_pnum" value="<%=product.getP_pnum()%>">					
				<table>
					<tr>
						<td>
						<select id="ratings" style="height: 25px; border-width:2px !important" required="required" name="r_rate">
            				<option value="">별점을 선택해주세요.</option>
           					<option value="0" name="r_rate">★☆☆☆☆</option>
							<option value="1" name="r_rate">★★☆☆☆</option>
							<option value="2" name="r_rate">★★★☆☆</option>
							<option value="3" name="r_rate">★★★★☆</option>
							<option value="4" name="r_rate">★★★★★</option>
	        			</select>
					</td>	
					</tr>
					<tr>
						<td>
							<textarea rows="7" cols="200" name="r_review" id="r_review"></textarea>
						</td>
					</tr>
					<tr>
						<th> 
							<a href="<%=request.getContextPath()%>/index.jsp?menugroup=detailpage&menu=detailpage" id="cancelBtn" class="btn_cancel btn" style="border-radius: 5px;width: 20px; !important">
							취소</a>
							<button type="submit" class="btn_submit btn" style="border-radius: 5px;width: 100px;!important">등록</button>				
						</th>	
					</tr>
				</table>	
				</form>
		
<div id="message" style="color: red;"></div>
<script type="text/javascript">
$("#r_title").focus();
$("#reviewForm").submit(function() {
	if($("#r_review").val()=="") {
		$("#message").text("리뷰를 5자 이상으로 입력해 주세요.");
		$("#r_review").focus();
		return false;
	}
});
</script>
<script>
function Rating(){};
Rating.prototype.rate = 0;
Rating.prototype.setRate = function(newrate){
    //별점 마킹 - 클릭한 별 이하 모든 별 체크 처리
    this.rate = newrate;
    let items = document.querySelectorAll('.rate_radio');
    items.forEach(function(item, idx){
        if(idx < newrate){
            item.checked = true;
        }else{
            item.checked = false;
        }
    });
}
let rating = new Rating();//별점 인스턴스 생성
document.addEventListener('DOMContentLoaded', function(){
    //별점선택 이벤트 리스너
    document.querySelector('.rating').addEventListener('click',function(e){
        let elem = e.target;
        if(elem.classList.contains('rate_radio')){
            rating.setRate(parseInt(elem.value));
        }
    })
});

</script>
</section>
<!-- } 게시물 작성/수정 끝 -->
		</div>  <!-- } .shop-content 끝 -->
	</div>  <!-- } #container 끝 -->
	
</div> <!-- } #wrapper 전체 콘텐츠 끝 -->

