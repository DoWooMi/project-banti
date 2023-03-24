<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="xyz.itwill.dao.OrdersDAO"%>
<%@page import="xyz.itwill.dto.OrdersDTO"%>
<%@page import="xyz.itwill.dao.PaymentDAO"%>
<%@page import="xyz.itwill.dto.PaymentDTO"%>
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

	Date now=new Date();
	SimpleDateFormat dateFormatO=new SimpleDateFormat("yyyyMMdd");
	SimpleDateFormat dateFormatP=new SimpleDateFormat("yyMMdd");
	String OrderDate=dateFormatO.format(now);
	String PaymentDate=dateFormatP.format(now);
	int nextNum=PaymentDAO.getDAO().paymentnextNum();
	
	
	//주문 table 전달값을 반환받아 저장
	String o_onum=OrderDate+nextNum;
	String o_comment=request.getParameter("od_memo");
	String o_quantity=request.getParameter("pay_quantity");
	String o_pnum=request.getParameter("p_pnum");
	String o_address1=request.getParameter("od_addr12");
	String o_address2=request.getParameter("od_addr22");
	String o_zipcode=request.getParameter("od_zip2");
	String o_phone=request.getParameter("od_b_hp");

	
	//OrdersDTO 객체 생성하여 전달값으로 필드값 변경
	OrdersDTO orders=new OrdersDTO();
	orders.setO_onum(Integer.parseInt(o_onum));
	orders.setO_comment(o_comment);
	orders.setO_hewonid(loginHewon.getH_hewonid());
	orders.setO_quantity(Integer.parseInt(o_quantity));
	orders.setO_pnum(Integer.parseInt(o_pnum));
	orders.setO_address1(o_address1);
	orders.setO_address2(o_address2);
	orders.setO_zipcode(o_zipcode);
	orders.setO_phone(o_phone);
	
	
	//주문정보를 전달받아 orders테이블에 삽입하는 DAO 클래스의 메소드 호출
	OrdersDAO.getDAO().insertOrders(orders);
	
	//결제 table 전달값을 반환받아 저장
	String pay_paynum=PaymentDate+nextNum;
	String pay_total=request.getParameter("pay_total");
	String pay_method=request.getParameter("od_settle_case");
	
	
	//paymentDTO 객체를 생성하여 전달값으로 필드값 변경
	PaymentDTO payment =new PaymentDTO();
	payment.setPay_paynum(Integer.parseInt(pay_paynum));
	payment.setPay_onum(Integer.parseInt(o_onum));
	payment.setPay_hewonid(loginHewon.getH_hewonid());
	payment.setPay_total(Integer.parseInt(pay_total));
	payment.setPay_method(Integer.parseInt(pay_method));
	
	
	

	//결제정보를 전달받아 payment 테이블에 삽입하는 DAO 클래스의 메소드 호출
	PaymentDAO.getDAO().insertPayment(payment);
	
	//클라이언트에게 URL 주소 전달
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/index.jsp?menugroup=order&menu=order_list';");
	out.println("</script>");
	
	
	
	
	
%>