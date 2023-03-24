package xyz.itwill.dto;
/*
이름           널?       유형            
------------ -------- ------------- 
P_PNUM       NOT NULL NUMBER(10)    
P_NAME       NOT NULL VARCHAR2(20)  
P_PRICE      NOT NULL NUMBER(10)    
P_MAINIMG    NOT NULL VARCHAR2(500) 
P_DETAILIMG1 NOT NULL VARCHAR2(500) 
P_DETAILIMG2 NOT NULL VARCHAR2(500) 
*/
public class ProductDTO {
	private int p_pnum;
	private String p_name;
	private int p_price;
	private String p_mainimg;
	private String p_detailimg1;
	private String p_detailimg2;
	
	public ProductDTO() {
		// TODO Auto-generated constructor stub
	}

	public int getP_pnum() {
		return p_pnum;
	}

	public void setP_pnum(int p_pnum) {
		this.p_pnum = p_pnum;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public int getP_price() {
		return p_price;
	}

	public void setP_price(int p_price) {
		this.p_price = p_price;
	}

	public String getP_mainimg() {
		return p_mainimg;
	}

	public void setP_mainimg(String p_mainimg) {
		this.p_mainimg = p_mainimg;
	}

	public String getP_detailimg1() {
		return p_detailimg1;
	}

	public void setP_detailimg1(String p_detailimg1) {
		this.p_detailimg1 = p_detailimg1;
	}

	public String getP_detailimg2() {
		return p_detailimg2;
	}

	public void setP_detailimg2(String p_detailimg2) {
		this.p_detailimg2 = p_detailimg2;
	}
	
}