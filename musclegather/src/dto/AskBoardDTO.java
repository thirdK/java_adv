package dto;
/*
CREATE TABLE `ask_board` (
		`ask_no` INT(10) NOT NULL AUTO_INCREMENT,
		`ask_title` VARCHAR(50) NOT NULL ,
		`ask_content` TEXT NOT NULL ,
		PRIMARY KEY (`ask_no`)
	)
*/

public class AskBoardDTO {
	private int ask_no;
	private String ask_title;
	private String ask_content;
	
	public AskBoardDTO() {;}	// 자바빈즈용 기본 생성자

	public AskBoardDTO(int ask_no, String ask_title, String ask_content) {
		this.ask_no = ask_no;
		this.ask_title = ask_title;
		this.ask_content = ask_content;
	}

	public int getAsk_no() {
		return ask_no;
	}

	public void setAsk_no(int ask_no) {
		this.ask_no = ask_no;
	}

	public String getAsk_title() {
		return ask_title;
	}

	public void setAsk_title(String ask_title) {
		this.ask_title = ask_title;
	}

	public String getAsk_content() {
		return ask_content;
	}

	public void setAsk_content(String ask_content) {
		this.ask_content = ask_content;
	}
	
}
