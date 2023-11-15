package model.Notice;

import java.sql.Timestamp;

public class Notice {
	private int notice_idx;
	private String title;
	private String author;
	private String contents;
	private Timestamp reg_date;

	// 글쓰기
	public Notice(int notice_idx, String title, String author, String contents, Timestamp reg_date){
		this.notice_idx = notice_idx;
		this.title = title;
		this.author = author;
		this.contents = contents;
		this.reg_date = reg_date;
	}
	
	// 수정
	// public Notice(String title, String contents, Timestamp reg_date){
	// 	this.title = title;
	// 	this.contents = contents;
	// 	this.reg_date = reg_date;
	// }
	
	public Notice() {
		// TODO Auto-generated constructor stub
	}

	// 게터 
	public int getNotice_idx() {
		return notice_idx;
	}
	
	public String getTitle() {
		return title;
	}

	public String getAuthor() {
		return author;
	}

	public String getContents() {
		return contents;
	}

	public Timestamp getReg_date() {
		return reg_date;
	}

	// 세터
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}

	public void setNotice_idx(int notice_idx) {
		this.notice_idx = notice_idx;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}
	public void setAuthor(String author) {
			this.author = author;
	}
	public void setTitle(String title) {
		this.title = title;
	}
}
