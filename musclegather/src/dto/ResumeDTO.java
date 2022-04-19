package dto;

/*
CREATE TABLE `resume` (
		`user_from_no` INT(10) NOT NULL,
		`user_to_no` INT(10) NOT NULL,
		FOREIGN KEY (`user_from_no`) REFERENCES `user` (`user_no`),
		FOREIGN KEY (`user_to_no`) REFERENCES `user` (`user_no`)
	)
*/
public class ResumeDTO {
	private int user_from_no;
	private int user_to_no;
	
	
	public ResumeDTO() {;}

	
	public ResumeDTO(int user_from_no, int user_to_no) {
		this.user_from_no = user_from_no;
		this.user_to_no = user_to_no;
	}

	public int getUser_from_no() {
		return user_from_no;
	}

	public void setUser_from_no(int user_from_no) {
		this.user_from_no = user_from_no;
	}

	public int getUser_to_no() {
		return user_to_no;
	}

	public void setUser_to_no(int user_to_no) {
		this.user_to_no = user_to_no;
	}
}
