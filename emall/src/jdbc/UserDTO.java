package jdbc;

/*CREATE TABLE `user` (
		`uid` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
		`upw` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
		`uname` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
		`ugender` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
		`ubirth` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
		`uemail` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
		`uphone` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
		`uaddr` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
		`uregiday` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
		PRIMARY KEY (`uid`) USING BTREE
	)
	COLLATE='utf8mb4_0900_ai_ci'
	ENGINE=InnoDB
	;

*/
public class UserDTO {
	private String uid;
	private String upw;
	private String uname;
	private String ugender;
	private String ubirth;
	private String uemail;
	private String uphone;
	private String uaddr;
	private String uregiday;
	
	public UserDTO() {;}
	
	public UserDTO(String uid, String upw, String uname, String ugender, String ubirth, String uemail, String uphone,
			String uaddr, String uregiday) {
		super();
		this.uid = uid;
		this.upw = upw;
		this.uname = uname;
		this.ugender = ugender;
		this.ubirth = ubirth;
		this.uemail = uemail;
		this.uphone = uphone;
		this.uaddr = uaddr;
		this.uregiday = uregiday;
	}


	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getUpw() {
		return upw;
	}

	public void setUpw(String upw) {
		this.upw = upw;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getUgender() {
		return ugender;
	}

	public void setUgender(String ugender) {
		this.ugender = ugender;
	}

	public String getUbirth() {
		return ubirth;
	}

	public void setUbirth(String ubirth) {
		this.ubirth = ubirth;
	}

	public String getUemail() {
		return uemail;
	}

	public void setUemail(String uemail) {
		this.uemail = uemail;
	}

	public String getUphone() {
		return uphone;
	}

	public void setUphone(String uphone) {
		this.uphone = uphone;
	}

	public String getUaddr() {
		return uaddr;
	}

	public void setUaddr(String uaddr) {
		this.uaddr = uaddr;
	}

	public String getUregiday() {
		return uregiday;
	}

	public void setUregiday(String uregiday) {
		this.uregiday = uregiday;
	}
	
}
