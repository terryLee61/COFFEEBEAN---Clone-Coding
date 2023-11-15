package model.Notice;

import java.sql.Timestamp;

public class NoticeRequestDto {
	private int notice_idx;
	private String title;
	private String author;
	private String contents;
	private Timestamp reg_date;
	
	public NoticeRequestDto(int notice_idx, String title, String author, String contents, Timestamp reg_date){
		this.notice_idx = notice_idx;
		this.title = title;
		this.author = author;
		this.contents = contents;
		this.reg_date = reg_date;
	}

	public int getNotice_idx() {
		return notice_idx;
	}
	public void setNotice_idx(int notice_idx) {
		this.notice_idx = notice_idx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
}