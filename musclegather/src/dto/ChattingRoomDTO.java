package dto;

/*
CREATE TABLE `chatting_room` (
		`chatr_no` INT(10) NOT NULL,
		`user_no` INT(10) NOT NULL,
		`chatr_regdate` DATETIME NULL DEFAULT NULL,
		PRIMARY KEY (`chatr_no`) ,
		FOREIGN KEY (`user_no`) REFERENCES `user` (`user_no`)
)
*/
public class ChattingRoomDTO {
	private int chatr_no;
	private int user_no;
	private String chatr_regdate;
	
	public ChattingRoomDTO() {;}	// 자바빈즈용 기본 생성자

	
	public ChattingRoomDTO(int chatr_no, int user_no, String chatr_regdate) {
		this.chatr_no = chatr_no;
		this.user_no = user_no;
		this.chatr_regdate = chatr_regdate;
	}

	
	public int getChatr_no() {
		return chatr_no;
	}

	public void setChatr_no(int chatr_no) {
		this.chatr_no = chatr_no;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public String getChatr_regdate() {
		return chatr_regdate;
	}

	public void setChatr_regdate(String chatr_regdate) {
		this.chatr_regdate = chatr_regdate;
	}
	
}
