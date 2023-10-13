package model.User;

import java.sql.Timestamp;

public class User {
	private int member_no;   
	private String id;
	private String password;
	private String name;
	private String email;
	private Timestamp join_date;
	
	public User(int member_no, String id, String password, String name, String email, Timestamp join_date) {
		this.member_no = member_no;
		this.id = id;
		this.password = password;
		this.name = name;
		this.email = email;
		this.join_date = join_date;
	}
	
	public User(int member_no, String id, String password, String name, String email) {
		this.member_no = member_no;
		this.id = id;
		this.password = password;
		this.name = name;
		this.email = email;
	}
	
	
	public int getMember_no() {
		return member_no;
	}
	public String getId() {
		return id;
	}
	public String getPassword() {
		return password;
	}
	public String getName() {
		return name;
	}
	public String getEmail() {
		return email;
	}
	public Timestamp getJoin_date() {
		return join_date;
	}

	
//	public User(String pid, String ppassword, String pname, int birth, String tel, int emailCheck) {
//		this.pid = pid;
//		this.ppassword = ppassword;
//		this.pname = pname;
//		this.birth = birth;
//		this.tel = tel;
//		this.emailCheck = emailCheck;
//	}
//	public User(String pid, String ppassword, String pname, int birth, String tel, String email, int emailCheck) {
//		this.pid = pid;
//		this.ppassword = ppassword;
//		this.pname = pname;
//		this.birth = birth;
//		this.tel = tel;
//		this.email = email;
//		this.emailCheck = emailCheck;
//	}
//	public User(String pid, String ppassword, String pname, int birth, String tel, String email,
//			String user_address, int emailCheck) {		
//		this.pid = pid;
//		this.ppassword = ppassword;
//		this.pname = pname;
//		this.birth = birth;
//		this.tel = tel;
//		this.email = email;
//		this.user_address = user_address;
//		this.emailCheck = emailCheck;
//	}
//	// 생성자 황인규 작성
//	public User(int puserIdx, String pid, String ppassword, String pname, int birth, String tel, String email,
//			String user_address, int emailCheck) {		
//		this.puserIdx = puserIdx;
//		this.pid = pid;
//		this.ppassword = ppassword;
//		this.pname = pname;
//		this.birth = birth;
//		this.tel = tel;
//		this.email = email;
//		this.user_address = user_address;
//		this.emailCheck = emailCheck;
//	}
//	
//
//	public String getPid() {
//		return pid;
//	}
//	public String getPpassword() {
//		return ppassword;
//	}
//	public String getPname() {
//		return pname;
//	}
//	public int getBirth() {
//		return birth;
//	}
//	public String getTel() {
//		return tel;
//	}
//	public String getEmail() {
//		return email;
//	}
//	public String getUser_address() {
//		return user_address;
//	}	
//	public int getEmailCheck() {
//		return emailCheck;
//	}
//	
	@Override
	public String toString() {
		return String.format("id : %s\npassword : %s\nname; : %s\nemail : %s\n", this.id, this.password, this.name, this.email);
	}
	
}	