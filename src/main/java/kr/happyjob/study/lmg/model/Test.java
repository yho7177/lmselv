package kr.happyjob.study.lmg.model;

public class Test {
	private int test_no;
	private int q_no;
	private int ci_no;
	private String t_que;
	private int t_score;
	private String t_ex1;
	private String t_ex2;
	private String t_ex3;
	private String t_ex4;
	private int t_ans;
	public Test() {
		super();
	}
	public Test(int test_no, int q_no, int ci_no, String t_que, int t_score, String t_ex1, String t_ex2, String t_ex3,
			String t_ex4, int t_ans) {
		super();
		this.test_no = test_no;
		this.q_no = q_no;
		this.ci_no = ci_no;
		this.t_que = t_que;
		this.t_score = t_score;
		this.t_ex1 = t_ex1;
		this.t_ex2 = t_ex2;
		this.t_ex3 = t_ex3;
		this.t_ex4 = t_ex4;
		this.t_ans = t_ans;
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
	public int getCi_no() {
		return ci_no;
	}
	public void setCi_no(int ci_no) {
		this.ci_no = ci_no;
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
		return "Test [test_no=" + test_no + ", q_no=" + q_no + ", ci_no=" + ci_no + ", t_que=" + t_que + ", t_score="
				+ t_score + ", t_ex1=" + t_ex1 + ", t_ex2=" + t_ex2 + ", t_ex3=" + t_ex3 + ", t_ex4=" + t_ex4
				+ ", t_ans=" + t_ans + "]";
	}
	
}
