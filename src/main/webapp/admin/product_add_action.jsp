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
	//전달받은 파일을 저장하기 위한 서버 디렉토리의 파일 시스템 경로를 반환받아 저장
	// => 작업디렉토리(WorkSpace)가 아닌 웹디렉토리(WebApps)의 파일 시스템 경로 반환
	String saveDirectory=request.getServletContext().getRealPath("/product_image");
	//System.out.println("saveDirectory = "+saveDirectory);
	
	//[multipart/form-data]를 처리하기 위한 MultipartRequest 객체 생성
	// => 사용자로부터 입력받아 전달된 모든 파일을 서버 디렉토리에 자동으로 저장 - 파일 업로드
	MultipartRequest multipartRequest=new MultipartRequest(request, saveDirectory, 30*1024*1024, "utf-8", new DefaultFileRenamePolicy());
	
	//전달값과 업로드된 파일명을 반환받아 저장
	int p_pnum=Integer.parseInt(multipartRequest.getParameter("p_pnum"));
	String p_name=multipartRequest.getParameter("p_name");
	int p_price=Integer.parseInt(multipartRequest.getParameter("p_price"));
	String p_mainimg=multipartRequest.getFilesystemName("p_mainimg");
	String p_detailimg1=multipartRequest.getFilesystemName("p_detailimg1");
	String p_detailimg2=multipartRequest.getFilesystemName("p_detailimg2");
	
	
	//ProductDTO 객체를 생성하여 전달값과 업로드 파일명으로 필드값 변경
	ProductDTO product=new ProductDTO();	
	product.setP_pnum(p_pnum);
	product.setP_name(p_name);
	product.setP_price(p_price);
	product.setP_mainimg(p_mainimg);
	product.setP_detailimg1(p_detailimg1);
	product.setP_detailimg2(p_detailimg2);
	
	
	//제품정보를 전달받아 PRODUCT 테이블에 삽입하는 DAO 클래스의 메소드 호출
	int rows=ProductDAO.getDAO().insertProduct(product);
	
	if(rows<=0) {//PRODUCT 테이블에 제품정보가 삽입되지 않은 경우
		//서버 디렉토리에 업로드되어 저장된 제품 관려 이미지 파일 삭제
		//File 객체 : 파일 정보를 저장하기 위한 객체
		//File.delete() : File 객체에 저장된 파일을 삭제하기 위한 메소드
		new File(saveDirectory, p_mainimg).delete();
		new File(saveDirectory, p_detailimg1).delete();
		new File(saveDirectory, p_detailimg2).delete();
	}
	
	//페이지 이동
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/index.jsp?menugroup=admin&menu=product_manager';");
	out.println("</script>");
%>	
								