package xyz.itwill.dto;
/*
이름         널?       유형            
---------- -------- ------------- 
O_ONUM     NOT NULL NUMBER(10)    
O_STATUS   NOT NULL NUMBER(10)    
O_DATE     NOT NULL DATE          
O_COMMENT           VARCHAR2(50)  
O_HEWONID  NOT NULL VARCHAR2(50)  
O_QUANTITY NOT NULL NUMBER(10)    
O_PNUM     NOT NULL NUMBER(10)    
O_ADDRESS1 NOT NULL VARCHAR2(200) 
O_ADDRESS2 NOT NULL VARCHAR2(100) 
O_ZIPCODE  NOT NULL VARCHAR2(20)  
O_PHONE    NOT NULL VARCHAR2(20)  
 */
public class OrdersDTO {
	private int o_onum;	
	private int o_status;	
	private String o_date;
	private String o_comment;	
	private String o_hewonid;	
	private int o_quantity;	
	private int o_pnum;	
	private String o_address1;	
	private String o_address2;	
	private String o_zipcode;	
	private String o_phone;
	
	public OrdersDTO() {
		// TODO Auto-generated constructor stub
	}

	public int getO_onum() {
		return o_onum;
	}

	public void setO_onum(int o_onum) {
		this.o_onum = o_onum;
	}

	public int getO_status() {
		return o_status;
	}

	public void setO_status(int o_status) {
		this.o_status = o_status;
	}

	public String getO_date() {
		return o_date;
	}

	public void setO_date(String o_date) {
		this.o_date = o_date;
	}

	public String getO_comment() {
		return o_comment;
	}

	public void setO_comment(String o_comment) {
		this.o_comment = o_comment;
	}

	public String getO_hewonid() {
		return o_hewonid;
	}

	public void setO_hewonid(String o_hewonid) {
		this.o_hewonid = o_hewonid;
	}

	public int getO_quantity() {
		return o_quantity;
	}

	public void setO_quantity(int o_quantity) {
		this.o_quantity = o_quantity;
	}

	public int getO_pnum() {
		return o_pnum;
	}

	public void setO_pnum(int o_pnum) {
		this.o_pnum = o_pnum;
	}

	public String getO_address1() {
		return o_address1;
	}

	public void setO_address1(String o_address1) {
		this.o_address1 = o_address1;
	}

	public String getO_address2() {
		return o_address2;
	}

	public void setO_address2(String o_address2) {
		this.o_address2 = o_address2;
	}

	public String getO_zipcode() {
		return o_zipcode;
	}

	public void setO_zipcode(String o_zipcode) {
		this.o_zipcode = o_zipcode;
	}

	public String getO_phone() {
		return o_phone;
	}

	public void setO_phone(String o_phone) {
		this.o_phone = o_phone;
	}

	
	
}

