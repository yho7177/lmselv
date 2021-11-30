package kr.happyjob.study.lmg.model;

public class InquireExam {
	private int tj_no;
	private int test_no;
	private int q_no;
	private String loginID;
	private int ci_no;
	private String tj_ans;
	private int tj_score;
	private String t_que;
	private int t_score;
	private String t_ex1;
	private String t_ex2;
	private String t_ex3;
	private String t_ex4;
	private int t_ans;
	
	public InquireExam() {
		super();
	}

	public InquireExam(int tj_no, int test_no, int q_no, String loginID, int ci_no, String tj_ans, int tj_score,
			String t_que, int t_score, String t_ex1, String t_ex2, String t_ex3, String t_ex4, int t_ans) {
		super();
		this.tj_no = tj_no;
		this.test_no = test_no;
		this.q_no = q_no;
		this.loginID = loginID;
		this.ci_no = ci_no;
		this.tj_ans = tj_ans;
		this.tj_score = tj_score;
		this.t_que = t_que;
		this.t_score = t_score;
		this.t_ex1 = t_ex1;
		this.t_ex2 = t_ex2;
		this.t_ex3 = t_ex3;
		this.t_ex4 = t_ex4;
		this.t_ans = t_ans;
	}

	public int getTj_no() {
		return tj_no;
	}

	public void setTj_no(int tj_no) {
		this.tj_no = tj_no;
	}

	public int getTest_no() {
		return test_no;
	}

	public void setTest_no(int test_no) {
		this.test_no = test_no;
	}

	public int getQ_no() {
		return q_no;
	}

	public void setQ_no(int q_no) {
		this.q_no = q_no;
	}

	public String getLoginID() {
		return loginID;
	}

	public void setLoginID(String loginID) {
		this.loginID = loginID;
	}

	public int getCi_no() {
		return ci_no;
	}

	public void setCi_no(int ci_no) {
		this.ci_no = ci_no;
	}

	public String getTj_ans() {
		return tj_ans;
	}

	public void setTj_ans(String tj_ans) {
		this.tj_ans = tj_ans;
	}

	public int getTj_score() {
		return tj_score;
	}

	public void setTj_score(int tj_score) {
		this.tj_score = tj_score;
	}

	public String getT_que() {
		return t_que;
	}

	public void setT_que(String t_que) {
		this.t_que = t_que;
	}

	public int getT_score() {
		return t_score;
	}

	public void setT_score(int t_score) {
		this.t_score = t_score;
	}

	public String getT_ex1() {
		return t_ex1;
	}

	public void setT_ex1(String t_ex1) {
		this.t_ex1 = t_ex1;
	}

	public String getT_ex2() {
		return t_ex2;
	}

	public void setT_ex2(String t_ex2) {
		this.t_ex2 = t_ex2;
	}

	public String getT_ex3() {
		return t_ex3;
	}

	public void setT_ex3(String t_ex3) {
		this.t_ex3 = t_ex3;
	}

	public String getT_ex4() {
		return t_ex4;
	}

	public void setT_ex4(String t_ex4) {
		this.t_ex4 = t_ex4;
	}

	public int getT_ans() {
		return t_ans;
	}

	public void setT_ans(int t_ans) {
		this.t_ans = t_ans;
	}

	@Override
	public String toString() {
		return "InquireExam [tj_no=" + tj_no + ", test_no=" + test_no + ", q_no=" + q_no + ", loginID=" + loginID
				+ ", ci_no=" + ci_no + ", tj_ans=" + tj_ans + ", tj_score=" + tj_score + ", t_que=" + t_que
				+ ", t_score=" + t_score + ", t_ex1=" + t_ex1 + ", t_ex2=" + t_ex2 + ", t_ex3=" + t_ex3 + ", t_ex4="
				+ t_ex4 + ", t_ans=" + t_ans + "]";
	}

	
	
}
