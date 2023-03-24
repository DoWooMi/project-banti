package xyz.itwill.dto;
/*
 이름         널?       유형           
---------- -------- ------------ 
C_CNUM     NOT NULL NUMBER(10)   
C_HEWONID  NOT NULL VARCHAR2(50) 
C_PNUM     NOT NULL NUMBER(10)   
C_QUANTITY NOT NULL NUMBER(10)   
 */
public class CartDTO {
	private int c_cnum;	
	private String c_hewonid;	
	private int c_pnum;	
	private int c_quantity;
	
	public CartDTO() {
		// TODO Auto-generated constructor stub
	}

	public int getC_cnum() {
		return c_cnum;
	}

	public void setC_cnum(int c_cnum) {
		this.c_cnum = c_cnum;
	}

	public String getC_hewonid() {
		return c_hewonid;
	}

	public void setC_hewonid(String c_hewonid) {
		this.c_hewonid = c_hewonid;
	}

	public int getC_pnum() {
		return c_pnum;
	}

	public void setC_pnum(int c_pnum) {
		this.c_pnum = c_pnum;
	}

	public int getC_quantity() {
		return c_quantity;
	}

	public void setC_quantity(int c_quantity) {
		this.c_quantity = c_quantity;
	}
	
	
}
