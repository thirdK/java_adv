package dto;

/*
CREATE TABLE `chatting` (
		`user_no` INT(10) NOT NULL,
		`chatr_no` INT(10) NOT NULL,
		`chat_context` TEXT NULL DEFAULT NULL ,
		`chat_regdate` DATETIME NULL DEFAULT NULL,
		`chat_images` VARCHAR(100) NULL DEFAULT NULL ,
		FOREIGN KEY (`user_no`) REFERENCES `user` (`user_no`) ,
		FOREIGN KEY (`chatr_no`) REFERENCES `chatting_room` (`chatr_no`)
	)
*/

public class ChattingDTO {
	private String user_no;
	private String other_user_no;
	private String chatr_no;
	private String chatr_content;
	private String chatr_regdate;
	private String chatr_images;
	// 이미지는 여러개여도 보낼 때, 가져올 때 문자열 형태로 전달합니다.
	// ArrayList처리는 DAO에서 합니다.
	
	public ChattingDTO() {;} // 자바빈즈용 기본 생성자
	
	public ChattingDTO(String user_no, String other_user_no, String chatr_no, String chatr_content,
			String chatr_regdate, String chatr_images) {
		this.user_no = user_no;
		this.other_user_no = other_user_no;
		this.chatr_no = chatr_no;
		this.chatr_content = chatr_content;
		this.chatr_regdate = chatr_regdate;
		this.chatr_images = chatr_images;
	}

	public String getUser_no() {
		return user_no;
	}

	public void setUser_no(String user_no) {
		this.user_no = user_no;
	}

	public String getOther_user_no() {
		return other_user_no;
	}

	public void setOther_user_no(String other_user_no) {
		this.other_user_no = other_user_no;
	}

	public String getChatr_no() {
		return chatr_no;
	}

	public void setChatr_no(String chatr_no) {
		this.chatr_no = chatr_no;
	}

	public String getChatr_content() {
		return chatr_content;
	}

	public void setChatr_content(String chatr_content) {
		this.chatr_content = chatr_content;
	}

	public String getChatr_regdate() {
		return chatr_regdate;
	}

	public void setChatr_regdate(String chatr_regdate) {
		this.chatr_regdate = chatr_regdate;
	}

	public String getChatr_images() {
		return chatr_images;
	}

	public void setChatr_images(String chatr_images) {
		this.chatr_images = chatr_images;
	}
	
}
