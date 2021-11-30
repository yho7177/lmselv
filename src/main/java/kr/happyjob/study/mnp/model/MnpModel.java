package kr.happyjob.study.mnp.model;

import java.util.Date;

public class MnpModel {
	
	private String name;
	private String loginID;
	private String password;
	private String tel;
	private Date reg_date;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLoginID() {
		return loginID;
	}
	public void setLoginID(String loginID) {
		this.loginID = loginID;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	
	@Override
	public String toString() {
		return "MnpModel [name=" + name + ", loginID=" + loginID + ", password=" + password + ", tel=" + tel
				+ ", reg_date=" + reg_date + "]";
	}
	
	
}
