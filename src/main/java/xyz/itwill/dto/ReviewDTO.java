package xyz.itwill.dto;

/*
이름        널?       유형            
--------- -------- ------------- 
R_RNUM    NOT NULL NUMBER(10)    
R_ONUM    NOT NULL NUMBER(10)    
R_PNUM    NOT NULL NUMBER(10)    
R_HEWONID NOT NULL VARCHAR2(50)  
R_REVIEW  NOT NULL VARCHAR2(200) 
R_DATE    NOT NULL DATE          
R_RATE             NUMBER(1)     
R_REF              NUMBER(4)     
R_RESTEP           NUMBER(4)     
R_RELEVEL          NUMBER(4)     
R_STATUS           NUMBER(1)   
*/

public class ReviewDTO {
	private int r_rnum;
	private int r_onum;
	private int r_pnum;
	private String r_hewonid;
	private String r_review;
	private String r_date;
	private int r_rate;
	private int r_ref;
	private int r_restep;
	private int r_relevel;
	private int r_status;
	private String writer;
	
	public ReviewDTO() {
		// TODO Auto-generated constructor stub
	}

	public int getR_rnum() {
		return r_rnum;
	}

	public void setR_rnum(int r_rnum) {
		this.r_rnum = r_rnum;
	}

	public int getR_onum() {
		return r_onum;
	}

	public void setR_onum(int r_onum) {
		this.r_onum = r_onum;
	}

	public int getR_pnum() {
		return r_pnum;
	}

	public void setR_pnum(int r_pnum) {
		this.r_pnum = r_pnum;
	}

	public String getR_hewonid() {
		return r_hewonid;
	}

	public void setR_hewonid(String r_hewonid) {
		this.r_hewonid = r_hewonid;
	}

	public String getR_review() {
		return r_review;
	}

	public void setR_review(String r_review) {
		this.r_review = r_review;
	}

	public String getR_date() {
		return r_date;
	}

	public void setR_date(String r_date) {
		this.r_date = r_date;
	}

	public int getR_rate() {
		return r_rate;
	}

	public void setR_rate(int r_rate) {
		this.r_rate = r_rate;
	}

	public int getR_ref() {
		return r_ref;
	}

	public void setR_ref(int r_ref) {
		this.r_ref = r_ref;
	}

	public int getR_restep() {
		return r_restep;
	}

	public void setR_restep(int r_restep) {
		this.r_restep = r_restep;
	}

	public int getR_relevel() {
		return r_relevel;
	}

	public void setR_relevel(int r_relevel) {
		this.r_relevel = r_relevel;
	}

	public int getR_status() {
		return r_status;
	}

	public void setR_status(int r_status) {
		this.r_status = r_status;
	}
	
	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}
}