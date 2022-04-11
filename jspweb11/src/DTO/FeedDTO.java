package DTO;

public class FeedDTO {
	private String id, content, ts;
	
	public FeedDTO(String id, String content, String ts) {
		super();
		this.id = id;
		this.content = content;
		this.ts = ts;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getTs() {
		return ts;
	}

	public void setTs(String ts) {
		this.ts = ts;
	}
	
	
}
