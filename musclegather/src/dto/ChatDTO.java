package dto;

public class ChatDTO {
	String user_no;
	String chatr_no;
	String chat_content;
	String chat_regdate;
	String chat_images;
	
	public ChatDTO() {;}

	public ChatDTO(String user_no, String chatr_no, String chat_content, String chat_regdate, String chat_images) {
		this.user_no = user_no;
		this.chatr_no = chatr_no;
		this.chat_content = chat_content;
		this.chat_regdate = chat_regdate;
		this.chat_images = chat_images;
	}

	public String getUser_no() {
		return user_no;
	}

	public void setUser_no(String user_no) {
		this.user_no = user_no;
	}

	public String getChatr_no() {
		return chatr_no;
	}

	public void setChatr_no(String chatr_no) {
		this.chatr_no = chatr_no;
	}

	public String getChat_content() {
		return chat_content;
	}

	public void setChat_content(String chat_content) {
		this.chat_content = chat_content;
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
