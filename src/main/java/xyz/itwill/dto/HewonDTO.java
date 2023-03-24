package xyz.itwill.dto;
/*
 이름         널?       유형            
---------- -------- ------------- 
H_HEWONID  NOT NULL VARCHAR2(50)  
H_PW       NOT NULL VARCHAR2(200) 
H_NAME     NOT NULL VARCHAR2(50)  
H_PHONE    NOT NULL VARCHAR2(50)  
H_ZIPCODE  NOT NULL VARCHAR2(10)  
H_ADDRESS1 NOT NULL VARCHAR2(200) 
H_ADDRESS2 NOT NULL VARCHAR2(100) 
H_EMAIL    NOT NULL VARCHAR2(100) 
H_STATUS   NOT NULL NUMBER(1)  
 */

public class HewonDTO {

	private String h_hewonid; 
	private String h_pw; 
	private String h_name; 
	private String h_phone; 
	private String h_zipcode; 
	private String h_address1; 
	private String h_address2; 
	private String h_email; 
	private int h_status;
	private String h_joindate; 
	private String h_lastlogin; 
	
	
public HewonDTO() {
	// TODO Auto-generated constructor stub
}


public String getH_hewonid() {
	return h_hewonid;
}


public void setH_hewonid(String h_hewonid) {
	this.h_hewonid = h_hewonid;
}


public String getH_pw() {
	return h_pw;
}


public void setH_pw(String h_pw) {
	this.h_pw = h_pw;
}


public String getH_name() {
	return h_name;
}


public void setH_name(String h_name) {
	this.h_name = h_name;
}


public String getH_phone() {
	return h_phone;
}


public void setH_phone(String h_phone) {
	this.h_phone = h_phone;
}


public String getH_zipcode() {
	return h_zipcode;
}


public void setH_zipcode(String h_zipcode) {
	this.h_zipcode = h_zipcode;
}


public String getH_address1() {
	return h_address1;
}


public void setH_address1(String h_address1) {
	this.h_address1 = h_address1;
}


public String getH_address2() {
	return h_address2;
}


public void setH_address2(String h_address2) {
	this.h_address2 = h_address2;
}


public String getH_email() {
	return h_email;
}


public void setH_email(String h_email) {
	this.h_email = h_email;
}


public int getH_status() {
	return h_status;
}


public void setH_status(int h_status) {
	this.h_status = h_status;
}


public String getH_joindate() {
	return h_joindate;
}


public void setH_joindate(String h_joindate) {
	this.h_joindate = h_joindate;
}


public String getH_lastlogin() {
	return h_lastlogin;
}


public void setH_lastlogin(String h_lastlogin) {
	this.h_lastlogin = h_lastlogin;
}





	
	
	

	
	
}


