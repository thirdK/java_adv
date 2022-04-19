package dto;

/*
CREATE TABLE `user` (
		`user_no` INT(10) NOT NULL AUTO_INCREMENT,
		`user_name` VARCHAR(20) NOT NULL,
		`user_pw` VARCHAR(20) NOT NULL ,
		`user_birth` VARCHAR(10) NOT NULL ,
		`user_zipcode` VARCHAR(5) NOT NULL ,
		`user_addr` VARCHAR(100) NOT NULL ,
		`user_addrdetail` VARCHAR(100) NOT NULL ,
		`user_gender` CHAR(1) NOT NULL ,
		`user_email` VARCHAR(30) NOT NULL,
		`user_phone` VARCHAR(13) NOT NULL ,
		`user_admin` TINYINT(3) NULL DEFAULT NULL,
		`user_kakao` TINYINT(3) NULL DEFAULT NULL,
		`user_auth` VARCHAR(6) NOT NULL ,
		`user_status` TINYINT(3) NULL DEFAULT NULL,
		PRIMARY KEY (`user_no`) 
	)
*/
public class UserDTO {
	private int user_no;
	private String user_name;
	private String user_pw;
	private String user_birth;
	private String user_zipcode;
	private String user_addr;
	private String user_addrdetail;
	private boolean user_gender;	// false : 여자, true : 남자
	private String user_email;
	private String user_phone;
	private boolean user_admin;		// false : 일반, true : admin
	private boolean user_kakao;		// 사용 여부 불확실
	private String user_auth;		// 사용 여부 불확실
	private boolean user_status;	// false : 정상, true : 탈퇴
	
	public UserDTO() {;}		//자바빈즈용 기본생성자
	
	// 모든 매개변수를 받는 생성자 -> 다른 매개변수 필요시 오버로딩 할 것
	public UserDTO(int user_no, String user_name, String user_pw, String user_birth, String user_zipcode,
			String user_addr, String user_addrdetail, boolean user_gender, String user_email, String user_phone,
			boolean user_admin, boolean user_kakao, String user_auth, boolean user_status) {
		this.user_no = user_no;
		this.user_name = user_name;
		this.user_pw = user_pw;
		this.user_birth = user_birth;
		this.user_zipcode = user_zipcode;
		this.user_addr = user_addr;
		this.user_addrdetail = user_addrdetail;
		this.user_gender = user_gender;
		this.user_email = user_email;
		this.user_phone = user_phone;
		this.user_admin = user_admin;
		this.user_kakao = user_kakao;
		this.user_auth = user_auth;
		this.user_status = user_status;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_pw() {
		return user_pw;
	}

	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	
	public String getUser_birth() {
		return user_birth;
	}

	public void setUser_birth(String user_birth) {
		this.user_birth = user_birth;
	}

	public String getUser_zipcode() {
		return user_zipcode;
	}

	public void setUser_zipcode(String user_zipcode) {
		this.user_zipcode = user_zipcode;
	}

	public String getUser_addr() {
		return user_addr;
	}

	public void setUser_addr(String user_addr) {
		this.user_addr = user_addr;
	}

	public String getUser_addrdetail() {
		return user_addrdetail;
	}

	public void setUser_addrdetail(String user_addrdetail) {
		this.user_addrdetail = user_addrdetail;
	}

	public boolean isUser_gender() {
		return user_gender;
	}

	public void setUser_gender(boolean user_gender) {
		this.user_gender = user_gender;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getUser_phone() {
		return user_phone;
	}

	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}

	public boolean isUser_admin() {
		return user_admin;
	}

	public void setUser_admin(boolean user_admin) {
		this.user_admin = user_admin;
	}

	public boolean isUser_kakao() {
		return user_kakao;
	}

	public void setUser_kakao(boolean user_kakao) {
		this.user_kakao = user_kakao;
	}

	public String getUser_auth() {
		return user_auth;
	}

	public void setUser_auth(String user_auth) {
		this.user_auth = user_auth;
	}

	public boolean isUser_status() {
		return user_status;
	}

	public void setUser_status(boolean user_status) {
		this.user_status = user_status;
	}
	

	
	
}


















