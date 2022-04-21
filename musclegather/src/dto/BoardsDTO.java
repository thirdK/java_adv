package dto;

/*
CREATE TABLE `notice_board` (
		`notice_no` INT(10) NOT NULL AUTO_INCREMENT,
		`user_no` INT(10) NOT NULL,
		`notice_title` VARCHAR(50) NOT NULL ,
		`notice_content` TEXT NOT NULL ,
		`notice_regdate` DATETIME NULL DEFAULT NULL,
		`view_cnt` INT(10) NULL DEFAULT NULL,
		`notice_images` VARCHAR(100) NULL DEFAULT NULL,
		PRIMARY KEY (`notice_no`) ,
		FOREIGN KEY (`user_no`) REFERENCES `user` (`user_no`)
)

CREATE TABLE `ask_board` (
	`ask_no` INT(10) NOT NULL AUTO_INCREMENT,
	`ask_title` VARCHAR(50) NOT NULL ,
	`ask_content` TEXT NOT NULL ,
	PRIMARY KEY (`ask_no`)
)
*/
public class BoardsDTO {
	private String boards_no;
	private String user_no;
	private String boards_title;
	private String boards_content;
	private String boards_regdate;
	private String view_cnt;
	private String boards_images;

	public BoardsDTO() {
	}

	// notice_board DB - DAO
	public BoardsDTO(String notice_no, String user_no, String notice_title, String notice_content,
			String notice_regdate, String view_cnt, String notice_images) {
		this.boards_no 		= notice_no;
		this.user_no 		= user_no;
		this.boards_title 	= notice_title;
		this.boards_content = notice_content;
		this.boards_regdate = notice_regdate;
		this.view_cnt 		= view_cnt;
		this.boards_images 	= notice_images;
	}

	// notice_board DAO - DB
	public BoardsDTO(String user_no, String notice_title, String notice_content, String notice_images) {
		this.user_no 		= user_no;
		this.boards_title 	= notice_title;
		this.boards_content = notice_content;
		this.boards_images 	= notice_images;
	}

	// ask_board DB - DAO
	public BoardsDTO(String ask_no, String ask_title, String ask_content) {
		this.user_no 		= ask_no;
		this.boards_title 	= ask_title;
		this.boards_content = ask_content;
	}

	// ask_board DAO - DB
	public BoardsDTO(String ask_title, String ask_content) {
		this.boards_title 	= ask_title;
		this.boards_content = ask_content;
	}

	public String getBoards_no() {
		return boards_no;
	}

	public void setBoards_no(String boards_no) {
		this.boards_no = boards_no;
	}

	public String getUser_no() {
		return user_no;
	}

	public void setUser_no(String user_no) {
		this.user_no = user_no;
	}

	public String getBoards_title() {
		return boards_title;
	}

	public void setBoards_title(String boards_title) {
		this.boards_title = boards_title;
	}

	public String getBoards_content() {
		return boards_content;
	}

	public void setBoards_content(String boards_content) {
		this.boards_content = boards_content;
	}

	public String getBoards_regdate() {
		return boards_regdate;
	}

	public void setBoards_regdate(String boards_regdate) {
		this.boards_regdate = boards_regdate;
	}

	public String getView_cnt() {
		return view_cnt;
	}

	public void setView_cnt(String view_cnt) {
		this.view_cnt = view_cnt;
	}

	public String getBoards_images() {
		return boards_images;
	}

	public void setBoards_images(String boards_images) {
		this.boards_images = boards_images;
	}
}
