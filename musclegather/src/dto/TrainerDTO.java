package dto;

//DTO상속에 관해 알아보니 부정적인 의견과 예시가 나왔습니다.
//저희는 DTO와 엔티티가 일치한다고 볼 수 있고, DTO를 HashMap에 담을 일은 없을것이기에 
//큰 문제는 없을듯 하지만		(https://okky.kr/article/740523)
//DTO를 통해 데이터를 주고 받을 때 알수 없는 오류가 발생하면 DTO상속에 관한 부분도 의심하셔야합니다.

/*
CREATE TABLE `trainer` (
		`trainer_no` INT(10) NOT NULL AUTO_INCREMENT,
		`user_no` INT(10) NOT NULL,
		`trainer_title` VARCHAR(50) NOT NULL ,
		`trainer_content` TEXT NOT NULL ,
		`trainer_secret` TINYINT(3) NULL DEFAULT NULL,
		`trainer_regdate` DATETIME NULL DEFAULT NULL,
		`trainer_images` VARCHAR(100) NULL DEFAULT NULL ,
		PRIMARY KEY (`trainer_no`),
		FOREIGN KEY (`user_no`) REFERENCES `user` (`user_no`)
	)

*/
public class TrainerDTO extends UserDTO{
	// user_no는 UserDTO를 상속하기 때문에 TrainerDTO에는 선언하지 않음(상속받으니까)
	private String trainer_no;
	private String trainer_title;
	private String trainer_content;
	private String trainer_secret;		// 0 : 비공개, 1 : 공개
	private String trainer_addr;
	private String trainer_regdate;
	private String trainer_images;	
	// 이미지는 여러개여도 보낼 때, 가져올 때 문자열 형태로 전달합니다.
	// ArrayList처리는 DAO에서 합니다.
	
	public TrainerDTO() {;}		//자바 빈즈를 위한 기본생성자
	//자식 클래스로 빈즈사용이 되는지는 모름. 테스트 필요

	
	//전체(부모클래스 필드를 포함한) 매개변수를 받는 생성자 -> 다른 매개변수의 생성자 필요시 오버로딩
	public TrainerDTO(String user_no, String user_name, String user_pw, String user_birth, String user_zipcode,
			String user_addr, String user_addrderail, String user_gender, String user_email, String user_phone,
			String user_admin, String user_kakao, String user_auth, String user_status, String trainer_no,
			String trainer_title, String trainer_content, String trainer_secret, String trainer_addr,
			String trainer_regdate, String trainer_images) {
		super(user_no, user_name, user_pw, user_birth, user_zipcode, user_addr, user_addrderail, user_gender,
				user_email, user_phone, user_admin, user_kakao, user_auth, user_status);
		this.trainer_no = trainer_no;
		this.trainer_title = trainer_title;
		this.trainer_content = trainer_content;
		this.trainer_secret = trainer_secret;
		this.trainer_addr = trainer_addr;
		this.trainer_regdate = trainer_regdate;
		this.trainer_images = trainer_images;
	}

	
	
	
	public String getTrainer_no() {
		return trainer_no;
	}

	
	public void setTrainer_no(String trainer_no) {
		this.trainer_no = trainer_no;
	}


	public String getTrainer_title() {
		return trainer_title;
	}


	public void setTrainer_title(String trainer_title) {
		this.trainer_title = trainer_title;
	}


	public String getTrainer_content() {
		return trainer_content;
	}


	public void setTrainer_content(String trainer_content) {
		this.trainer_content = trainer_content;
	}


	public String getTrainer_secret() {
		return trainer_secret;
	}


	public void setTrainer_secret(String trainer_secret) {
		this.trainer_secret = trainer_secret;
	}


	public String getTrainer_addr() {
		return trainer_addr;
	}


	public void setTrainer_addr(String trainer_addr) {
		this.trainer_addr = trainer_addr;
	}


	public String getTrainer_regdate() {
		return trainer_regdate;
	}


	public void setTrainer_regdate(String trainer_regdate) {
		this.trainer_regdate = trainer_regdate;
	}


	public String getTrainer_images() {
		return trainer_images;
	}


	public void setTrainer_images(String trainer_images) {
		this.trainer_images = trainer_images;
	}
	
	
	
}
