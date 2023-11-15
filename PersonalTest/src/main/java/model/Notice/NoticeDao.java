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
import util.DBManager;

public class NoticeDao {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	private SimpleDateFormat sdf = new SimpleDateFormat("YYYYMMdd");

	public NoticeDao() {
        this.conn = DBManager.getConnection();

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

}
