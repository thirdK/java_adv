package dto;

public class JoinDTO {
	private String from_no;
	private String to_no;
	private String join_regdate;

	public JoinDTO() {
	}

	// wish join
	public JoinDTO(String user_from_no, String user_to_no) {
		this.from_no = user_from_no;
		this.to_no = user_to_no;
	}

	// 채팅 join
	public JoinDTO(String chatr_no, String user_no, String chatr_regdate) {
		this.from_no = chatr_no;
		this.to_no = user_no;
		this.join_regdate = chatr_regdate;
	}

	public String getFrom_no() {
		return from_no;
	}

	public void setFrom_no(String from_no) {
		this.from_no = from_no;
	}

	public String getTo_no() {
		return to_no;
	}

	public void setTo_no(String to_no) {
		this.to_no = to_no;
	}

	public String getJoin_regdate() {
		return join_regdate;
	}

	public void setJoin_regdate(String join_regdate) {
		this.join_regdate = join_regdate;
	}

}
