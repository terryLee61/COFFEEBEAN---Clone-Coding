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

//	public User getUserbyEmail(String email) {
//		User user = null;
//		
//		this.conn = DBManager.getConnection();
//		
//		if(this.conn != null) {
//			String sql = "SELECT * FROM pusers_tb WHERE email=?";
//			
//			try {
//				this.pstmt = this.conn.prepareStatement(sql);
//				this.pstmt.setString(1, email);
//				this.rs = this.pstmt.executeQuery();
//				if(this.rs.next()) {
//					int puserIdx=this.rs.getInt(1);		// 황인규 작성
//					String id = this.rs.getString(2);
//					String password = this.rs.getString(3);
//					String name = this.rs.getString(4);
//					Date birth = this.rs.getDate(5);
//					int birthNum = Integer.parseInt(sdf.format(birth));					
//					String tel = this.rs.getString(6);	
//					String address = this.rs.getString(8);		
//					int emailCheck = this.rs.getInt(9);
//					
//					// 이 부분 황인규가 건드림(+puserIdx)
//					user = new User(puserIdx, id, password, name, birthNum, tel, email, address, emailCheck);					
//				}
//			}catch (Exception e) {
//				e.printStackTrace();
//			}finally {
//				DBManager.close(this.conn, this.pstmt, this.rs);
//			}
//		}
//		
//		return user;
//	}
//
//	public ArrayList<User> getUserAll(){
//		ArrayList<User> list = new ArrayList<User>();
//		
//		this.conn = DBManager.getConnection();
//		
//		if(this.conn != null) {
//			String sql = "SELECT * FROM pusers_tb";
//			
//			try {
//				this.pstmt = this.conn.prepareStatement(sql);
//				this.rs = this.pstmt.executeQuery();
//				
//				while(this.rs.next()) {
//					String id = this.rs.getString(2);
//					String password = this.rs.getString(3);
//					String name = this.rs.getString(4);
//					Date birth = this.rs.getDate(5);
//					int birthNum = Integer.parseInt(sdf.format(birth));
//					String tel = this.rs.getString(6);
//					String email = this.rs.getString(7);
//					String address = this.rs.getString(8);
//					int emailCheck = this.rs.getInt(9);
//					
//					User user = new User(id,password,name,birthNum,tel,email,address,emailCheck);
//					
//					list.add(user);
//				}
//			} catch (Exception e) {
//				e.printStackTrace();
//			} finally {
//				DBManager.close(this.conn, this.pstmt, this.rs);
//			}
//		}		
//		return list;
//	}
//	
//	
//	public void updateUser(UserRequestDto dto, String password) {
//		User user = getUserbyId(dto.getPid());
//		
//		this.conn = DBManager.getConnection();		
//		if(this.conn != null  && dto.getPpassword() != null && dto.getEmail() != null && dto.getPid() != null) {			
//			if(dto.getPpassword() != "") {
//			String sql = "UPDATE pusers_tb SET ppassword=?, tel=?, email=?, user_address=?, userEmailCheck=? WHERE pid=? AND ppassword=?";					
//			
//			try {
//				this.pstmt = this.conn.prepareStatement(sql);
//				
//				if(dto.getPpassword().equals(password)) {
//					this.pstmt.setString(1, password);						
//				}else {
//					this.pstmt.setString(1, dto.getPpassword());
//				}
//				
//				if(user.getTel() == dto.getTel()) {	
//					this.pstmt.setString(2, user.getTel());
//				}else {
//					this.pstmt.setString(2, dto.getTel());
//				}
//				
//				if(user.getEmail().equals(dto.getEmail())) {
//					this.pstmt.setString(3, user.getEmail());
//				}else {
//					this.pstmt.setString(3, dto.getEmail());
//				}
//				
//				if(user.getUser_address().equals(dto.getUser_address())) {
//					this.pstmt.setString(4, user.getUser_address());
//				}else {
//					this.pstmt.setString(4, dto.getUser_address());
//				}
//				if(user.getEmailCheck() == dto.getEmailCheck()) {
//					this.pstmt.setInt(5, user.getEmailCheck());
//				}else {
//					this.pstmt.setInt(5, dto.getEmailCheck());
//				}
//				this.pstmt.setString(6, dto.getPid());
//				this.pstmt.setString(7, password);
//				
//				this.pstmt.execute();				
//			}catch (Exception e) {
//				e.printStackTrace();
//			}finally {
//				DBManager.close(this.conn, this.pstmt);
//			}			
//			}
//		}
//	}
//	
//	public boolean deleteUser(String id, String password) {
//		this.conn = DBManager.getConnection();
//		boolean check = true;
//		
//		if(this.conn != null) {
//			String sql = "DELETE FROM pusers_tb WHERE pid=? AND ppassword=?";
//			
//			try {
//				this.pstmt = this.conn.prepareStatement(sql);
//				this.pstmt.setString(1, id);
//				this.pstmt.setString(2, password);
//				
//				this.pstmt.execute();
//			}catch (Exception e) {
//				e.printStackTrace();
//				check = false;
//			}finally {
//				DBManager.close(this.conn, this.pstmt);
//			}
//		}else{
//			check = false;
//		}
//		
//		return check;
//	}
//	
//	
//	public int checkId(String id) { 
//		User user = getUserbyId(id); 
//		int check = 0;
//		  
//		if(user != null) {
//			check = 0;
//		}else {
//			check = 1;
//		}
//		 
//		return check; 
//	}
//	 

//	public void emailCheck(String email) {
//		
//		this.conn = DBManager.getConnection();
//		if(this.conn != null) {
//			String sql = "UPDATE pusers_tb SET userEmailCheck=1 WHERE email=?";
//			try {
//				this.pstmt = this.conn.prepareStatement(sql);
//				this.pstmt.setString(1, email);
//				this.pstmt.execute();
//			}catch (Exception e) {
//				e.printStackTrace();
//			}finally {
//				DBManager.close(this.conn, this.pstmt);
//			}
//		}		
//	}
//}	
