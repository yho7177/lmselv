package kr.happyjob.study.lsp.model;


public class NoticeNewModel {
	
	//공지사항테이블
	private int ntNo;
	private String loginID;
	private String ntDate;
	private String ntTitle;
	private String ntContent;
	private int bntHit;
	private int file_no;
	private String file_name;
	private String file_root;
	private String file_addr;
	private String file_size;
	
	
	
	public int getFile_no() {
		return file_no;
	}
	public void setFile_no(int file_no) {
		this.file_no = file_no;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public String getFile_root() {
		return file_root;
	}
	public void setFile_root(String file_root) {
		this.file_root = file_root;
	}
	public String getFile_addr() {
		return file_addr;
	}
	public void setFile_addr(String file_addr) {
		this.file_addr = file_addr;
	}
	public String getFile_size() {
		return file_size;
	}
	public void setFile_size(String file_size) {
		this.file_size = file_size;
	}
	public int getNtNo() {
		return ntNo;
	}
	public void setNtNo(int ntNo) {
		this.ntNo = ntNo;
	}
	public String getLoginID() {
		return loginID;
	}
	public void setLoginID(String loginID) {
		this.loginID = loginID;
	}
	
	public String getNtDate() {
		return ntDate;
	}
	public void setNtDate(String ntDate) {
		this.ntDate = ntDate;
	}
	public String getNtTitle() {
		return ntTitle;
	}
	public void setNtTitle(String ntTitle) {
		this.ntTitle = ntTitle;
	}
	public String getNtContent() {
		return ntContent;
	}
	public void setNtContent(String ntContent) {
		this.ntContent = ntContent;
	}
	public int getBntHit() {
		return bntHit;
	}
	public void setBntHit(int bntHit) {
		this.bntHit = bntHit;
	}
	
	
	
	
	
	
}
