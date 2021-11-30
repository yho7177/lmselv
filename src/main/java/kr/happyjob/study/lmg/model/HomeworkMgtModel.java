package kr.happyjob.study.lmg.model;

import java.util.Date;

public class HomeworkMgtModel {
	
	private int hw_no;
	
	private int ci_no;
	
	private String hw_name;
	
	private String hw_content;
	
	private Date hw_date;

	private String loginID;
	
	private String ci_name;
	
	private String name;
	
	private int leccode;

	private String lecname;
	

	public int getHw_no() {
		return hw_no;
	}

	public void setHw_no(int hw_no) {
		this.hw_no = hw_no;
	}

	public int getCi_no() {
		return ci_no;
	}

	public void setCi_no(int ci_no) {
		this.ci_no = ci_no;
	}

	public String getHw_name() {
		return hw_name;
	}

	public void setHw_name(String hw_name) {
		this.hw_name = hw_name;
	}

	public String getHw_content() {
		return hw_content;
	}

	public void setHw_content(String hw_content) {
		this.hw_content = hw_content;
	}

	public Date getHw_date() {
		return hw_date;
	}

	public void setHw_date(Date hw_date) {
		this.hw_date = hw_date;
	}

	public String getLoginID() {
		return loginID;
	}

	public void setLoginID(String loginID) {
		this.loginID = loginID;
	}

	public String getCi_name() {
		return ci_name;
	}

	public void setCi_name(String ci_name) {
		this.ci_name = ci_name;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public int getLeccode() {
		return leccode;
	}

	public void setLeccode(int leccode) {
		this.leccode = leccode;
	}
	
	public String getLecname() {
		return lecname;
	}

	public void setLecname(String lecname) {
		this.lecname = lecname;
	}
	
}
