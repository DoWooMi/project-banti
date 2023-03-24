package xyz.itwill.dto;

/*
이름         널?       유형             
---------- -------- -------------- 
B_BNUM     NOT NULL NUMBER(10)     
B_HEWONID           VARCHAR2(20)   
B_TITLE             VARCHAR2(500)  
B_DATE              DATE           
B_TYPE              NUMBER(1)      
B_REF               NUMBER(4)      
B_RESTEP            NUMBER(4)      
B_RELEVEL           NUMBER(4)      
B_QUESTION          VARCHAR2(4000) 
B_STATUS            NUMBER(1)
*/

public class BoardDTO {
	private int b_bnum;
	private String b_hewonid;
	private String b_title;
	private String b_date;
	private int b_type;
	private int b_ref;
	private int b_restep;
	private int b_relevel;	
	private String b_question;
	private int b_status;
	private String writer; // 회원 테이블에 회원이름 
	
	public BoardDTO() {
		// TODO Auto-generated constructor stub
	}

	public int getB_bnum() {
		return b_bnum;
	}

	public void setB_bnum(int b_bnum) {
		this.b_bnum = b_bnum;
	}

	public String getB_hewonid() {
		return b_hewonid;
	}

	public void setB_hewonid(String b_hewonid) {
		this.b_hewonid = b_hewonid;
	}

	public String getB_title() {
		return b_title;
	}

	public void setB_title(String b_title) {
		this.b_title = b_title;
	}

	public String getB_date() {
		return b_date;
	}

	public void setB_date(String b_date) {
		this.b_date = b_date;
	}

	public int getB_type() {
		return b_type;
	}

	public void setB_type(int b_type) {
		this.b_type = b_type;
	}

	public int getB_ref() {
		return b_ref;
	}

	public void setB_ref(int b_ref) {
		this.b_ref = b_ref;
	}

	public int getB_restep() {
		return b_restep;
	}

	public void setB_restep(int b_restep) {
		this.b_restep = b_restep;
	}

	public int getB_relevel() {
		return b_relevel;
	}

	public void setB_relevel(int b_relevel) {
		this.b_relevel = b_relevel;
	}

	public String getB_question() {
		return b_question;
	}

	public void setB_question(String b_question) {
		this.b_question = b_question;
	}

	public int getB_status() {
		return b_status;
	}

	public void setB_status(int b_status) {
		this.b_status = b_status;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}
}