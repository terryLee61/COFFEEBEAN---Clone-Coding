package model.User;

import java.sql.Timestamp;

public class User {
	private int member_no;
	private String id;
	private String password;
	private String name;
	private String email;
	private Timestamp join_date;
	private String address;
	private int postcode;
	private String salt; // 솔트 값을 저장하는 필드

	public User(int member_no, String id, String password, String name, String email, Timestamp join_date,
			String address, int postcode, String salt) {
		this.member_no = member_no;
		this.id = id;
		this.password = password;
		this.name = name;
		this.email = email;
		this.join_date = join_date;
		this.address = address;
		this.postcode = postcode;
		this.salt = salt;
	}

	public User(int member_no, String id, String password, String name, String email, String salt) {
		this.member_no = member_no;
		this.id = id;
		this.password = password;
		this.name = name;
		this.email = email;
		this.salt = salt;
	}

	public User(int member_no, String id, String password, String name, String email, String address, int postcode) {
		this.member_no = member_no;
		this.id = id;
		this.password = password;
		this.name = name;
		this.email = email;
		this.address = address;
		this.postcode = postcode;
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

	public String getAddress() {
		return address;
	}

	public int getPostcode() {
		return postcode;
	}

	public String getSalt() {
		return salt; // 저장된 솔트 값을 반환
	}
	
	

	    public void setSalt(String salt) {
	        this.salt = salt;
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
		return String.format("id : %s\npassword : %s\nname; : %s\nemail : %s\n", this.id, this.password, this.name,
				this.email);
	}

}