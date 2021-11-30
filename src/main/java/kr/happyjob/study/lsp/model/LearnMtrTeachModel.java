package kr.happyjob.study.lsp.model;

import java.util.Date;

public class LearnMtrTeachModel {
		private int learn_no;
		private int ci_no;
		private String learn_name;
		private String learn_content;
		private Date learn_up;
		private String loginID;
		private String ci_name;
		private Date ci_date;
		private String ci_content;
		private String name;
		private int file_no;
		
		public Date getCi_date() {
			return ci_date;
		}
		public void setCi_date(Date ci_date) {
			this.ci_date = ci_date;
		}
		public String getCi_content() {
			return ci_content;
		}
		public void setCi_content(String ci_content) {
			this.ci_content = ci_content;
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
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public int getLearn_no() {
			return learn_no;
		}
		public void setLearn_no(int learn_no) {
			this.learn_no = learn_no;
		}
		public int getCi_no() {
			return ci_no;
		}
		public void setCi_no(int ci_no) {
			this.ci_no = ci_no;
		}
		public int getFile_no() {
			return file_no;
		}
		public void setFile_no(int file_no) {
			this.file_no = file_no;
		}
		public String getLearn_name() {
			return learn_name;
		}
		public void setLearn_name(String learn_name) {
			this.learn_name = learn_name;
		}
		public Date getLearn_up() {
			return learn_up;
		}
		public void setLearn_up(Date learn_up) {
			this.learn_up = learn_up;
		}
		public String getLearn_content() {
			return learn_content;
		}
		public void setLearn_content(String learn_content) {
			this.learn_content = learn_content;
		}
		
		
}
