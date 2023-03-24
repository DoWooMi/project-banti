package xyz.itwill.dto;
/*
이름          널?       유형           
----------- -------- ------------ 
PAY_PAYNUM  NOT NULL NUMBER(10)   
PAY_ONUM    NOT NULL NUMBER(10)   
PAY_HEWONID NOT NULL VARCHAR2(20) 
PAY_TOTAL   NOT NULL NUMBER(10)   
PAY_METHOD  NOT NULL NUMBER(1)   
*/

public class PaymentDTO {
	private int pay_paynum;
	private int pay_onum;
	private String pay_hewonid;
	private int pay_total;
	private int pay_method;
	
	public PaymentDTO() {
		// TODO Auto-generated constructor stub
	}

	public int getPay_paynum() {
		return pay_paynum;
	}

	public void setPay_paynum(int pay_paynum) {
		this.pay_paynum = pay_paynum;
	}

	public int getPay_onum() {
		return pay_onum;
	}

	public void setPay_onum(int pay_onum) {
		this.pay_onum = pay_onum;
	}

	public String getPay_hewonid() {
		return pay_hewonid;
	}

	public void setPay_hewonid(String pay_hewonid) {
		this.pay_hewonid = pay_hewonid;
	}

	public int getPay_total() {
		return pay_total;
	}

	public void setPay_total(int pay_total) {
		this.pay_total = pay_total;
	}

	public int getPay_method() {
		return pay_method;
	}

	public void setPay_method(int pay_method) {
		this.pay_method = pay_method;
	}
	
}




