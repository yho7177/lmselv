package kr.happyjob.study.lmg.model;

public class StuNumChart {
	private int num;
	private String date;
	public StuNumChart() {
		super();
	}
	public StuNumChart(int num, String date) {
		super();
		this.num = num;
		this.date = date;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	@Override
	public String toString() {
		return "StuNumChart [num=" + num + ", date=" + date + "]";
	}
	
	
}
