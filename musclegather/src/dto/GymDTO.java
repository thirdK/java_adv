package dto;

//DTO상속에 관해 알아보니 부정적인 의견과 예시가 나왔습니다.
//저희는 DTO와 엔티티가 일치한다고 볼 수 있고, DTO를 HashMap에 담을 일은 없을것이기에 
//큰 문제는 없을듯 하지만		(https://okky.kr/article/740523)
//DTO를 통해 데이터를 주고 받을 때 알수 없는 오류가 발생하면 DTO상속에 관한 부분도 의심하셔야합니다.

/*
CREATE TABLE `gym` (
		`gym_no` INT(10) NOT NULL AUTO_INCREMENT,
		`user_no` INT(10) NOT NULL,
		`gym_name` VARCHAR(20) NOT NULL,
		`gym_content` TEXT NOT NULL ,
		`gym_addr` VARCHAR(100) NOT NULL ,
		`gym_salary` INT(10) NULL DEFAULT NULL,
		`gym_secret` TINYINT(3) NULL DEFAULT NULL,
		`gym_regdate` DATETIME NULL DEFAULT NULL,
		`gym_images` VARCHAR(100) NULL DEFAULT NULL ,
		PRIMARY KEY (`gym_no`),
		FOREIGN KEY (`user_no`) REFERENCES`user` (`user_no`)
	)
*/


public class GymDTO extends UserDTO{
	// user_no는 UserDTO를 상속하기 때문에 GymDTO에는 선언하지 않음(상속받으니까)
	private int gym_no;
	private String gym_name;
	private String gym_content;
	private String gym_addr;
	private int gym_salary;
	private boolean gym_secret;		// false : 비공개, true : 공개
	private String gym_regdate;
	private String gym_images;
	// 이미지는 여러개여도 보낼 때, 가져올 때 문자열 형태로 전달합니다.
	// ArrayList처리는 DAO에서 합니다.
	
	
	public GymDTO() {;}	// 자바빈즈용 기본 생성자
	//자식 클래스로 빈즈사용이 되는지는 모름. 테스트 필요

	//전체(부모클래스 필드를 포함한) 매개변수를 받는 생성자 -> 다른 매개변수의 생성자 필요시 오버로딩
	public GymDTO(int user_no, String user_name, String user_pw, String user_birth, String user_zipcode,
			String user_addr, String user_addrdetail, String user_gender, String user_email, String user_phone,
			boolean user_admin, boolean user_kakao, String user_auth, boolean user_status, int gym_no, String gym_name,
			String gym_content, String gym_addr, int gym_salary, boolean gym_secret, String gym_regdate,
			String gym_images) {
		super(user_no, user_name, user_pw, user_birth, user_zipcode, user_addr, user_addrdetail, user_gender,
				user_email, user_phone, user_admin, user_kakao, user_auth, user_status);
		this.gym_no = gym_no;
		this.gym_name = gym_name;
		this.gym_content = gym_content;
		this.gym_addr = gym_addr;
		this.gym_salary = gym_salary;
		this.gym_secret = gym_secret;
		this.gym_regdate = gym_regdate;
		this.gym_images = gym_images;
	}

	public int getGym_no() {
		return gym_no;
	}

	public void setGym_no(int gym_no) {
		this.gym_no = gym_no;
	}

	public String getGym_name() {
		return gym_name;
	}

	public void setGym_name(String gym_name) {
		this.gym_name = gym_name;
	}

	public String getGym_content() {
		return gym_content;
	}

	public void setGym_content(String gym_content) {
		this.gym_content = gym_content;
	}

	public String getGym_addr() {
		return gym_addr;
	}

	public void setGym_addr(String gym_addr) {
		this.gym_addr = gym_addr;
	}

	public int getGym_salary() {
		return gym_salary;
	}

	public void setGym_salary(int gym_salary) {
		this.gym_salary = gym_salary;
	}

	public boolean isGym_secret() {
		return gym_secret;
	}

	public void setGym_secret(boolean gym_secret) {
		this.gym_secret = gym_secret;
	}

	public String getGym_regdate() {
		return gym_regdate;
	}

	public void setGym_regdate(String gym_regdate) {
		this.gym_regdate = gym_regdate;
	}

	public String getGym_images() {
		return gym_images;
	}

	public void setGym_images(String gym_images) {
		this.gym_images = gym_images;
	}
	
}
