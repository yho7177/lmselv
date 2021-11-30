package kr.happyjob.study.lmg.model;

import java.util.Date;

public class QnaModel {
	private String qna_no;
	private String loginID;
	private String qna_title;
	private Date qna_date;
	private String qna_content;
	private String ci_no;
	
	
	public String getQna_no() {
		return qna_no;
	}
	public void setQna_no(String qna_no) {
		this.qna_no = qna_no;
	}
	public String getLoginID() {
		return loginID;
	}
	public void setLoginID(String loginID) {
		this.loginID = loginID;
	}
	public String getQna_title() {
		return qna_title;
	}
	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}
	
	public Date getQna_date() {
		return qna_date;
	}
	public void setQna_date(Date qna_date) {
		this.qna_date = qna_date;
	}
	public String getQna_content() {
		return qna_content;
	}
	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}
	public String getCi_no() {
		return ci_no;
	}
	public void setCi_no(String ci_no) {
		this.ci_no = ci_no;
	}
	
	
	
}
