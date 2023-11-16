package model.Notice;

import java.sql.Timestamp;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import model.Notice.Notice;
import model.Notice.NoticeDao;
import model.Search.Search;
import util.DBManager;

public class NoticeDao {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	private SimpleDateFormat sdf = new SimpleDateFormat("YYYYMMdd");
	private int notice_idx;

	public NoticeDao() {
        this.conn = DBManager.getConnection();

	}

	public NoticeDao(Connection conn2) {
		// TODO Auto-generated constructor stub
	}

	private static NoticeDao instance = new NoticeDao();

	public static NoticeDao getInstance() {
		return instance;
	}

	public boolean addNotice(String title, String author, String contents, Timestamp reg_date) {
		boolean isSuccess = false;
		this.conn = DBManager.getConnection();

		if (this.conn != null) {
			String sql = "INSERT INTO notice (title, author, contents, reg_date) VALUES (?, ?, ?, ?)";

			try {
				this.pstmt = this.conn.prepareStatement(sql);
				this.pstmt.setString(1, title);
				this.pstmt.setString(2, author);
				this.pstmt.setString(3, contents);
				this.pstmt.setTimestamp(4, reg_date);

				int affectedRows = this.pstmt.executeUpdate();
				if (affectedRows > 0) {
					isSuccess = true;
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				DBManager.close(this.conn, this.pstmt);
			}
		}

		return isSuccess;
	}

	public List<Notice> getAllNotices() {
	    List<Notice> NoticeResults = new ArrayList<>();
	    this.conn = DBManager.getConnection();

	    if (this.conn != null) {
	        String sql = "SELECT * FROM notice";
	        try {
	            this.pstmt = this.conn.prepareStatement(sql);
	            this.rs = this.pstmt.executeQuery();
	            
	            while (this.rs.next()) {
	                int notice_idx = this.rs.getInt("notice_idx");
	                String title = this.rs.getString("title");
	                String author = this.rs.getString("author");
	                String contents = this.rs.getString("contents");
	                Timestamp reg_date = this.rs.getTimestamp("reg_date");

	                Notice notice = new Notice(notice_idx, title, author, contents, reg_date);
	                NoticeResults.add(notice);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	            DBManager.close(this.conn, this.pstmt, this.rs);
	        }
	    }

	    return NoticeResults;
	}
	
	 // 공지사항 정보 수정 메서드
	public boolean updateNotice(String title, String contents, int noticeIdx) {
	    boolean updated = false;
	    String sql = "UPDATE notice SET title = ?, contents = ? WHERE notice_idx = ?";
	    
	    try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
	        pstmt.setString(1, title);
	        pstmt.setString(2, contents);
	        pstmt.setInt(3, noticeIdx);

	        int rowsAffected = pstmt.executeUpdate();
	        updated = rowsAffected > 0;
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    
	    return updated;
	}




//	public Notice getNoticeByIdx(int noticeIdx) {
//	    Notice notice = null;
//	    this.conn = DBManager.getConnection();
//
//	    if (this.conn != null) {
//	        String sql = "SELECT * FROM notice WHERE notice_idx = ?";
//	        try {
//	            this.pstmt = this.conn.prepareStatement(sql);
//	            this.pstmt.setInt(1, noticeIdx);
//	            this.rs = this.pstmt.executeQuery();
//
//	            if (this.rs.next()) {
//	                int notice_idx = this.rs.getInt(1);
//	                String title = this.rs.getString(2);
//	                String author = this.rs.getString(3);
//	                String contents = this.rs.getString(4);
//	                Timestamp reg_date = this.rs.getTimestamp(5);
//
//	                notice = new Notice(notice_idx, title, author, contents, reg_date);
//	            }
//	        } catch (Exception e) {
//	            e.printStackTrace();
//	        } finally {
//	            DBManager.close(this.conn, this.pstmt, this.rs);
//	        }
//	    }
//
//	    return notice;
//	    }
    }
	

