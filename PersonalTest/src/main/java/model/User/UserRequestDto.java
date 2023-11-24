package model.User;

import java.sql.Timestamp;

public class UserRequestDto {
	private int member_no;   
	private String id;
	private String password;
	private String name;
	private String email;
	private Timestamp join_date;
	private String address;
	private int postcode;
	private String salt;	
	
	public UserRequestDto(int member_no, String id, String password, String name, String email, Timestamp join_date, String address, int postcode, String salt) {
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
	
	public UserRequestDto(String id, String password, String name, String email) {
		this.id = id;
		this.password = password;
		this.name = name;
		this.email = email;
	}
	
	public UserRequestDto(String id, String password, String name, String email, String address, int postcode, String salt) {
		this.id = id;
		this.password = password;
		this.name = name;
		this.email = email;
		this.address = address;
		this.postcode = postcode;
		this.salt = salt;		
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Timestamp getJoin_date() {
		return join_date;
	}

	public void setJoin_date(Timestamp join_date) {
		this.join_date = join_date;
	}
	
	public String getAddress() {
		return address;
	}
	public String setAddress() {
		return address;
	}
	public int getPostcode() {
		return postcode;
	}
	public int setPostcode() {
		return postcode;
	}
	
	public String getSalt() {
		return salt;
	}
	public String setSalt() {
		return salt;
	}
	

//	public UserRequestDto(String ppassword, String tel, String email, String user_address, int emailCheck) {	
//		this.ppassword = ppassword;
//		this.tel = tel;
//		this.email = email;
//		this.user_address = user_address;
//		this.emailCheck = emailCheck;
//	}
//
//	public UserRequestDto(String pid, String ppassword, String pname, int birth, String tel, int emailCheck) {
//		this.pid = pid;
//		this.ppassword = ppassword;
//		this.pname = pname;
//		this.birth = birth;
//		this.tel = tel;
//		this.emailCheck = emailCheck;
//	}
//
//	public UserRequestDto(String pid, String ppassword, String pname, int birth, String tel, String email, int emailCheck) {
//		this.pid = pid;
//		this.ppassword = ppassword;
//		this.pname = pname;
//		this.birth = birth;
//		this.tel = tel;
//		this.email = email;
//		this.emailCheck = emailCheck;
//	}
//
//	public UserRequestDto(String pid, String ppassword, String pname, int birth, String tel, String email,
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
//	
//	public int getPuserIdx() {
//		return this.puserIdx;
//	}
//	
//	public void setPuserIdx(int puserIdx) {
//		this.puserIdx=puserIdx;
//	}
//
//
//	public String getPid() {
//		return this.pid;
//	}
//
//	public void setPid(String pid) {
//		this.pid = pid;
//	}
//
//	public String getPpassword() {
//		return this.ppassword;
//	}
//
//	public void setPpassword(String ppassword) {
//		this.ppassword = ppassword;
//	}
//
//	public String getPname() {
//		return this.pname;
//	}
//
//	public void setPname(String pname) {
//		this.pname = pname;
//	}
//
//	public int getBirth() {
//		return this.birth;
//	}
//
//	public void setBirth(int birth) {
//		this.birth = birth;
//	}
//
//	public String getTel() {
//		return this.tel;
//	}
//
//	public void setTel(String tel) {
//		this.tel = tel;
//	}
//
//	public String getEmail() {
//		return this.email;
//	}
//
//	public void setEmail(String email) {
//		this.email = email;
//	}
//
//	public String getUser_address() {
//		return this.user_address;
//	}
//
//	public void setUser_address(String user_address) {
//		this.user_address = user_address;
//	}
//
//	public int getEmailCheck() {
//		return emailCheck;
//	}
//
//	public void setEmailCheck(int emailCheck) {
//		this.emailCheck = emailCheck;
//	}
//	
}