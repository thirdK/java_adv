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
*/
public class NoticeBoardDTO {
	private int notice_no;
	private int user_no;
	private String notice_title;
	private String notice_content;
	private String notice_regdate;
	private int view_cnt;
	private String notice_images;
	// 이미지는 여러개여도 보낼 때, 가져올 때 문자열 형태로 전달합니다.
	// ArrayList처리는 DAO에서 합니다.
	
	public NoticeBoardDTO() {;}	// 자바빈즈용 기본 생성자

	public NoticeBoardDTO(int notice_no, int user_no, String notice_title, String notice_content, String notice_regdate,
			int view_cnt, String notice_images) {
		this.notice_no = notice_no;
		this.user_no = user_no;
		this.notice_title = notice_title;
		this.notice_content = notice_content;
		this.notice_regdate = notice_regdate;
		this.view_cnt = view_cnt;
		this.notice_images = notice_images;
	}

	public int getNotice_no() {
		return notice_no;
	}

	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public String getNotice_title() {
		return notice_title;
	}

	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}

	public String getNotice_content() {
		return notice_content;
	}

	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}

	public String getNotice_regdate() {
		return notice_regdate;
	}

	public void setNotice_regdate(String notice_regdate) {
		this.notice_regdate = notice_regdate;
	}

	public int getView_cnt() {
		return view_cnt;
	}

	public void setView_cnt(int view_cnt) {
		this.view_cnt = view_cnt;
	}

	public String getNotice_images() {
		return notice_images;
	}

	public void setNotice_images(String notice_images) {
		this.notice_images = notice_images;
	}
}
