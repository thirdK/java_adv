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
	private int user_no;
	private int chatr_no;
	private String chat_context;
	private String chat_regdate;
	private String chat_images;
	// 이미지는 여러개여도 보낼 때, 가져올 때 문자열 형태로 전달합니다.
	// ArrayList처리는 DAO에서 합니다.
	
	public ChattingDTO() {;} // 자바빈즈용 기본 생성자
	
	public ChattingDTO(int user_no, int chatr_no, String chat_context, String chat_regdate, String chat_images) {
		this.user_no = user_no;
		this.chatr_no = chatr_no;
		this.chat_context = chat_context;
		this.chat_regdate = chat_regdate;
		this.chat_images = chat_images;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public int getChatr_no() {
		return chatr_no;
	}

	public void setChatr_no(int chatr_no) {
		this.chatr_no = chatr_no;
	}

	public String getChat_context() {
		return chat_context;
	}

	public void setChat_context(String chat_context) {
		this.chat_context = chat_context;
	}

	public String getChat_regdate() {
		return chat_regdate;
	}

	public void setChat_regdate(String chat_regdate) {
		this.chat_regdate = chat_regdate;
	}

	public String getChat_images() {
		return chat_images;
	}

	public void setChat_images(String chat_images) {
		this.chat_images = chat_images;
	}
	
}
