<%@page import="java.io.File"%>
<%@page import="xyz.itwill.dao.ProductDAO"%>
<%@page import="xyz.itwill.dto.ProductDTO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/security/admin_check.jspf" %> 

<%
	//비정상적인 요청에 대한 응답 처리
	if(request.getMethod().equals("GET")) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?menugroup=error&menu=error_400';");
		out.println("</script>");
		return;			
	}
	//전달받은 파일을 서버하기 위한 서버 디렉토리의 시스템 경로를 반환받아 저장
	String saveDirectory=request.getServletContext().getRealPath("/product_image");
	
	//[multipart/form-data]를 처리하기 위한 MultipartRequest 객체 생성
	// => 사용자로부터 입력받아 전달된 모든 파일을 서버 디렉토리에 자동으로 저장 - 파일 업로드
	MultipartRequest multipartRequest=new MultipartRequest(request, saveDirectory, 30*1024*1024, "utf-8", new DefaultFileRenamePolicy());
	
	//전달값과 업로드된 파일명을 반환받아 저장
	int p_pnum=Integer.parseInt(multipartRequest.getParameter("p_pnum"));
	String currentP_mainimg=multipartRequest.getParameter("currentP_mainimg");
	String currentp_detailimg1=multipartRequest.getParameter("currentp_detailimg1");
	String currentp_detailimg2=multipartRequest.getParameter("currentp_detailimg2");
	
	String p_name=multipartRequest.getParameter("p_name");
	String p_mainimg=multipartRequest.getFilesystemName("p_mainimg");
	String p_detailimg1=multipartRequest.getFilesystemName("p_detailimg1");
	String p_detailimg2=multipartRequest.getFilesystemName("p_detailimg2");
	int p_price=Integer.parseInt(multipartRequest.getParameter("p_price"));
		
	//ProductDTO 객체를 생성하여 전달값과 업로드 파일명으로 필드값 변경
	ProductDTO product=new ProductDTO();
	product.setP_pnum(p_pnum);
	product.setP_name(p_name);
	if(p_mainimg==null) {//전달된 대표이미지 파일이 없는 경우 - 대표이미지 미변경
		product.setP_mainimg(p_mainimg);		
	} else {//전달된 대표이미지 파일이 있는 경우 - 대표이미지 변경
		product.setP_mainimg(p_mainimg);	
		//서버 디렉토리에 저장된 기존 제품의 대표이미지 파일 삭제
		new File(saveDirectory, currentP_mainimg).delete();
	}
	if(p_detailimg1==null) {//전달된 상세이미지 파일이 없는 경우 - 상세이미지 미변경
		product.setP_detailimg1(p_detailimg1);		
	} else {//전달된 상세이미지 파일이 있는 경우 - 상세이미지 변경
		product.setP_detailimg1(p_detailimg1);
		//서버 디렉토리에 저장된 기존 제품의 상세이미지 파일 삭제
		new File(saveDirectory, currentp_detailimg1).delete();
	}
	if(p_detailimg2==null) {//전달된 상세이미지 파일이 없는 경우 - 상세이미지 미변경
		product.setP_detailimg2(p_detailimg2);	
	} else {//전달된 상세이미지 파일이 있는 경우 - 상세이미지 변경
		product.setP_detailimg2(p_detailimg2);
		//서버 디렉토리에 저장된 기존 제품의 상세이미지 파일 삭제
		new File(saveDirectory, currentp_detailimg2).delete();
	}
	product.setP_price(p_price);
	
	//제품정보를 전달받아 PRODUCT 테이블에 저장된 해당 제품정보를 변경하는 DAO 클래스의 메소드 호출
	ProductDAO.getDAO().updateProduct(product);
	
	//페이지 이동
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/index.jsp?menugroup=admin&menu=product_detail&p_pnum="+product.getP_pnum()+"';");
	out.println("</script>");
%>  