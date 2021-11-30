package kr.happyjob.study.lmg.model;

import java.sql.Date;

/**
/**

  * @FileName : ExamInfo.java

  * @Project : lmselv

  * @Date : 2021. 11. 12. 

  * @작성자 : 윤효열

  * @변경이력 :

  * @프로그램 설명 : tb_testinfo

  */
public class TestInfo {
	private int test_no;
	private String test_name;
	private Date test_start;
	private Date test_end;
	private int ci_no;
	private String ci_name;
	private String test_status;
	
	public TestInfo() {
		super();
	}

	public TestInfo(int test_no, String test_name, Date test_start, Date test_end, int ci_no, String ci_name,
			String test_status) {
		super();
		this.test_no = test_no;
		this.test_name = test_name;
		this.test_start = test_start;
		this.test_end = test_end;
		this.ci_no = ci_no;
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
		return "TestInfo [test_no=" + test_no + ", test_name=" + test_name + ", test_start=" + test_start
				+ ", test_end=" + test_end + ", ci_no=" + ci_no + ", ci_name=" + ci_name + ", test_status="
				+ test_status + "]";
	}

	

	
}
