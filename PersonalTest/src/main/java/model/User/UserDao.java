package model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import util.DBManager;

public class UserDao {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	private SimpleDateFormat sdf = new SimpleDateFormat("YYYYMMdd");

	private UserDao() {
	}

	private static UserDao instance = new UserDao();

	public static UserDao getInstance() {
		return instance;
	}

	public boolean createUser(UserRequestDto dto) {
	    boolean isIdDuplicate = isIdDuplicate(dto.getId());
	    if (isIdDuplicate) {
	        return false; // 아이디 중복 시 회원 가입 불가능
	    }

	    String id = dto.getId();
	    String password = dto.getPassword();
	    String name = dto.getName();
	    String email = dto.getEmail();
	    String address = dto.getAddress();
	    int postcode = dto.getPostcode();
	    String salt = dto.getSalt();

	    boolean check = false;

	    try {
	        conn = DBManager.getConnection();
	        if (conn != null) {
	            String sql = "INSERT INTO member (id, password, name, email, address, postcode, salt) VALUES (?, ?, ?, ?, ?, ?, ?)";
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setString(1, id);
	            pstmt.setString(2, password);
	            pstmt.setString(3, name);
	            pstmt.setString(4, email);
	            pstmt.setString(5, address);
	            pstmt.setInt(6, postcode);
	            pstmt.setString(7, salt);

	            int rowsAffected = pstmt.executeUpdate();
	            if (rowsAffected > 0) {
	                check = true; // 회원 가입 성공
	            }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        DBManager.close(conn, pstmt);
	    }

	    return check;
	}

	public User getUserbyId(String member_id) {
		User user = null;
		this.conn = DBManager.getConnection();

		if (this.conn != null) {
			String sql = "SELECT * FROM member WHERE id=?";

			try {
				this.pstmt = this.conn.prepareStatement(sql);
				this.pstmt.setString(1, member_id);
				this.rs = this.pstmt.executeQuery();
				if (this.rs.next()) {
					int member_no = this.rs.getInt(1);
					String password = this.rs.getString(3);
					String name = this.rs.getString(4);
					String email = this.rs.getString(5);
					String salt = this.rs.getString(9);

					user = new User(member_no, member_id, password, name, email, salt);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				DBManager.close(this.conn, this.pstmt, this.rs);
			}
		}

		return user; 
	}

	public boolean isIdDuplicate(String id) {
		boolean isDuplicate = false;
		this.conn = DBManager.getConnection();

		if (this.conn != null) {
			String sql = "SELECT id FROM member WHERE id=?";

			try {
				this.pstmt = this.conn.prepareStatement(sql);
				this.pstmt.setString(1, id);
				this.rs = this.pstmt.executeQuery();
				if (this.rs.next()) {
					isDuplicate = true; // ID가 중복됨
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				DBManager.close(this.conn, this.pstmt, this.rs);
			}
		}

		return isDuplicate;
	}

	public boolean isEmailDuplicate(String email) {
		boolean isDuplicate = false;
		this.conn = DBManager.getConnection();

		if (this.conn != null) {
			String sql = "SELECT email FROM member WHERE email=?";

			try {
				this.pstmt = this.conn.prepareStatement(sql);
				this.pstmt.setString(1, email);
				this.rs = this.pstmt.executeQuery();
				if (this.rs.next()) {
					isDuplicate = true;
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				DBManager.close(this.conn, this.pstmt, this.rs);
			}
		}

		return isDuplicate;
	}

}

