package model.Qna;

import java.sql.Timestamp;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import model.Qna.Qna;
import model.Qna.QnaDao;
import model.Search.Search;
import util.DBManager;

public class QnaDao {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	private SimpleDateFormat sdf = new SimpleDateFormat("YYYYMMdd");
	private int qna_idx;

	public QnaDao() {
        this.conn = DBManager.getConnection();

	}

	public QnaDao(Connection conn2) {
		// TODO Auto-generated constructor stub
	}

	private static QnaDao instance = new QnaDao();

	public static QnaDao getInstance() {
		return instance;
	}

	public boolean addQna(String title, String author, String contents, Timestamp reg_date) {
		boolean isSuccess = false;
		this.conn = DBManager.getConnection();

		if (this.conn != null) {
			String sql = "INSERT INTO qna (title, author, contents, reg_date) VALUES (?, ?, ?, ?)";

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
				DBManager.close(this.conn, this.pstmt, this.rs);
			}
		}

		return isSuccess;
	}

	public List<Qna> getAllQnas() {
	    List<Qna> QnaResults = new ArrayList<>();
	    this.conn = DBManager.getConnection();

	    if (this.conn != null) {
	        String sql = "SELECT * FROM qna";
	        try {
	            this.pstmt = this.conn.prepareStatement(sql);
	            this.rs = this.pstmt.executeQuery();
	            
	            while (this.rs.next()) {
	                int qna_idx = this.rs.getInt("qna_idx");
	                String title = this.rs.getString("title");
	                String author = this.rs.getString("author");
	                String contents = this.rs.getString("contents");
	                Timestamp reg_date = this.rs.getTimestamp("reg_date");

	                Qna qna = new Qna(qna_idx, title, author, contents, reg_date);
	                QnaResults.add(qna);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	            DBManager.close(this.conn, this.pstmt, this.rs);
	        }
	    }

	    return QnaResults;
	}
	
	 // 공지사항 정보 수정 메서드
	// 공지사항 정보 수정 메서드 (제목, 내용, 번호, 날짜)
	public boolean updateQna(String title, String contents, int qnaIdx, Timestamp regDate) {
	    boolean updated = false;
	    String sql = "UPDATE qna SET title = ?, contents = ?, reg_date = ? WHERE qna_idx = ?";
	    
	    try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
	        pstmt.setString(1, title);
	        pstmt.setString(2, contents);
	        pstmt.setTimestamp(3, regDate);
	        pstmt.setInt(4, qnaIdx);

	        int rowsAffected = pstmt.executeUpdate();
	        updated = rowsAffected > 0;
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    
	    return updated;
	}

	public boolean deleteQna(int qnaIdx) {
	    boolean deleted = false;
	    String sql = "DELETE FROM qna WHERE qna_idx = ?";
	    
	    try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
	        pstmt.setInt(1, qnaIdx);
	        int rowsAffected = pstmt.executeUpdate();
	        deleted = rowsAffected > 0;
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    
	    return deleted;
	}
}

	

