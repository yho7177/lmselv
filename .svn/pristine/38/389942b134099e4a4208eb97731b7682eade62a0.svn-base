package kr.happyjob.study.statistics.model;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class ExamStatistics {
	private String ci_name;
	private int ci_no;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date ci_start;
	private Date ci_end;
	private int test_no;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date test_start;
	private int totscore;
	public ExamStatistics() {
		super();
	}
	public ExamStatistics(String ci_name, int ci_no, Date ci_start, Date ci_end, int test_no, Date test_start,
			int totscore) {
		super();
		this.ci_name = ci_name;
		this.ci_no = ci_no;
		this.ci_start = ci_start;
		this.ci_end = ci_end;
		this.test_no = test_no;
		this.test_start = test_start;
		this.totscore = totscore;
	}
	public String getCi_name() {
		return ci_name;
	}
	public void setCi_name(String ci_name) {
		this.ci_name = ci_name;
	}
	public int getCi_no() {
		return ci_no;
	}
	public void setCi_no(int ci_no) {
		this.ci_no = ci_no;
	}
	public Date getCi_start() {
		return ci_start;
	}
	public void setCi_start(Date ci_start) {
		this.ci_start = ci_start;
	}
	public Date getCi_end() {
		return ci_end;
	}
	public void setCi_end(Date ci_end) {
		this.ci_end = ci_end;
	}
	public int getTest_no() {
		return test_no;
	}
	public void setTest_no(int test_no) {
		this.test_no = test_no;
	}
	public Date getTest_start() {
		return test_start;
	}
	public void setTest_start(Date test_start) {
		this.test_start = test_start;
	}
	public int getTotscore() {
		return totscore;
	}
	public void setTotscore(int totscore) {
		this.totscore = totscore;
	}
	@Override
	public String toString() {
		return "ExamStatistics [ci_name=" + ci_name + ", ci_no=" + ci_no + ", ci_start=" + ci_start + ", ci_end="
				+ ci_end + ", test_no=" + test_no + ", test_start=" + test_start + ", totscore=" + totscore + "]";
	}
	
}
