package model.Qna;

import java.sql.Timestamp;

public class QnaRequestDto {
	private int qna_idx;
	private String title;
	private String author;
	private String contents;
	private Timestamp reg_date;
	
	public QnaRequestDto(int qna_idx, String title, String author, String contents, Timestamp reg_date){
		this.qna_idx = qna_idx;
		this.title = title;
		this.author = author;
		this.contents = contents;
		this.reg_date = reg_date;
	}

	public int getQna_idx() {
		return qna_idx;
	}
	public void setQna_idx(int qna_idx) {
		this.qna_idx = qna_idx;
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