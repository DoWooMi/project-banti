<%@page import="xyz.itwill.dao.CartDAO"%>
<%@page import="xyz.itwill.dto.CartDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>    
<%@include file="/security/login_url.jspf" %>
<%
	
	if(request.getMethod().equals("GET")) {
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/index.jsp?menugroup=error&menu=error_400';");
	out.println("</script>");
	return;
	}

	//장바구니 table 전달값을 반환받아 저장
	String c_pnum=request.getParameter("p_pnum");
	String c_quantity=request.getParameter("Pquantity");
	
	//cartDTO 객체 생성하여 전달값으로 필드값 변경
	CartDTO cart=new CartDTO();
	cart.setC_hewonid(loginHewon.getH_hewonid());
	cart.setC_pnum(Integer.parseInt(c_pnum) );
	cart.setC_quantity(Integer.parseInt(c_quantity) );
	
	//장바구니 정보를 전달받아 cart테이블에 삽입하는 DAO 클래스의 메소드 호출
	CartDAO.getDAO().insertCart(cart);
	
	
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/index.jsp?menugroup=cart&menu=cart_list';");
	out.println("</script>");
	

%>	