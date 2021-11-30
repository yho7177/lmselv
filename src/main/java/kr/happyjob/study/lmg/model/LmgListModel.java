package kr.happyjob.study.lmg.model;

public class LmgListModel {
	
	private int ci_no; //강의번호
	private String loginID; //사용자ID
	private int r_no; //강의실
	private String ci_type; //분류
	private String ci_name; //강의명
	private String ci_date; //작성일
	private String ci_content; //강의내용
	private String ci_start; //강의시작일
	private String ci_end; //강의종료일
	private String ci_goal; //강의목표
	private String ci_plan; //강의계획
	private int ci_limit; //정원
	private String ci_attend; //출석

	public String getCi_attend() {
		return ci_attend;
	}


	public void setCi_attend(String ci_attend) {
		this.ci_attend = ci_attend;
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


	public int getR_no() {
		return r_no;
	}


	public void setR_no(int r_no) {
		this.r_no = r_no;
	}


	public String getCi_type() {
		return ci_type;
	}


	public void setCi_type(String ci_type) {
		this.ci_type = ci_type;
	}


	public String getCi_name() {
		return ci_name;
	}


	public void setCi_name(String ci_name) {
		this.ci_name = ci_name;
	}


	public String getCi_date() {
		return ci_date;
	}


	public void setCi_date(String ci_date) {
		this.ci_date = ci_date;
	}


	public String getCi_content() {
		return ci_content;
	}


	public void setCi_content(String ci_content) {
		this.ci_content = ci_content;
	}


	public String getCi_start() {
		return ci_start;
	}


	public void setCi_start(String ci_start) {
		this.ci_start = ci_start;
	}


	public String getCi_end() {
		return ci_end;
	}


	public void setCi_end(String ci_end) {
		this.ci_end = ci_end;
	}


	public String getCi_goal() {
		return ci_goal;
	}


	public void setCi_goal(String ci_goal) {
		this.ci_goal = ci_goal;
	}


	public String getCi_plan() {
		return ci_plan;
	}


	public void setCi_plan(String ci_plan) {
		this.ci_plan = ci_plan;
	}


	public int getCi_limit() {
		return ci_limit;
	}


	public void setCi_limit(int ci_limit) {
		this.ci_limit = ci_limit;
	}

	@Override
	public String toString() {
		return "LmgListModel [ci_no=" + ci_no + ", loginID=" + loginID + ", r_no=" + r_no + ", ci_type=" + ci_type
				+ ", ci_name=" + ci_name + ", ci_date=" + ci_date + ", ci_content=" + ci_content + ", ci_start="
				+ ci_start + ", ci_end=" + ci_end + ", ci_goal=" + ci_goal + ", ci_plan=" + ci_plan + ", ci_limit="
				+ ci_limit + ", ci_attend=" + ci_attend + "]";
	}

}
