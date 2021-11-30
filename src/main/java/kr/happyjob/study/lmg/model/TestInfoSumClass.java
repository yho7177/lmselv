package kr.happyjob.study.lmg.model;

import java.sql.Date;

public class TestInfoSumClass {
	private int test_no; // 시험 번호
	private String test_name; // 시험 이름
	private Date test_start; // 시험 시작 일자
	private Date test_end; // 시험 종료 일자
	private int ci_no; // 강의번호
	private String loginID; // 강사 아이디
	private String ci_name; // 강의 이름
	private String test_status;
	public TestInfoSumClass() {
		super();
	}
	public TestInfoSumClass(int test_no, String test_name, Date test_start, Date test_end, int ci_no, String loginID,
			String ci_name, String test_status) {
		super();
		this.test_no = test_no;
		this.test_name = test_name;
		this.test_start = test_start;
		this.test_end = test_end;
		this.ci_no = ci_no;
		this.loginID = loginID;
		this.ci_name = ci_name;
		this.test_status = test_status;
	}
	public int getTest_no() {
		return test_no;
	}
	public void setTest_no(int test_no) {
		this.test_no = test_no;
	}
	public String getTest_name() {
		return test_name;
	}
	public void setTest_name(String test_name) {
		this.test_name = test_name;
	}
	public Date getTest_start() {
		return test_start;
	}
	public void setTest_start(Date test_start) {
		this.test_start = test_start;
	}
	public Date getTest_end() {
		return test_end;
	}
	public void setTest_end(Date test_end) {
		this.test_end = test_end;
	}
	public int getCi_no() {
		return ci_no;
	}
	public void setCi_no(int ci_no) {
		this.ci_no = ci_no;
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
	public String getTest_status() {
		return test_status;
	}
	public void setTest_status(String test_status) {
		this.test_status = test_status;
	}
	@Override
	public String toString() {
		return "TestInfoSumClass [test_no=" + test_no + ", test_name=" + test_name + ", test_start=" + test_start
				+ ", test_end=" + test_end + ", ci_no=" + ci_no + ", loginID=" + loginID + ", ci_name=" + ci_name
				+ ", test_status=" + test_status + "]";
	}
	
	
}
