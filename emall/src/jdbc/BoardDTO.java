package jdbc;


/*`bid` INT(10) NOT NULL AUTO_INCREMENT,
`buser` VARCHAR(50) NOT NULL DEFAULT '0' COLLATE, 
`btitle` VARCHAR(50) NULL DEFAULT NULL COLLATE, 
`bdate` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP() COLLATE, 
`bcontent` VARCHAR(200) NULL DEFAULT NULL COLLATE, 
PRIMARY KEY (`bid`) USING BTREE*/

public class BoardDTO {
	private String bid;
	private String buser;
	private String btitle;
	private String bdate;
	private String bcontent;
	private String bimage;
	
	
	public BoardDTO() {;}
	
	public BoardDTO(String bid, String buser, String btitle, String bdate, String bcontent, String bimage) {
		super();
		this.bid = bid;
		this.buser = buser;
		this.btitle = btitle;
		this.bdate = bdate;
		this.bcontent = bcontent;
		this.bimage = bimage;
	}

	public String getBimage() {
		return bimage;
	}

	public void setBimage(String bimage) {
		this.bimage = bimage;
	}

	public String getBid() {
		return bid;
	}

	public void setBid(String bid) {
		this.bid = bid;
	}

	public String getBuser() {
		return buser;
	}

	public void setBuser(String buser) {
		this.buser = buser;
	}

	public String getBtitle() {
		return btitle;
	}

	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}

	public String getBdate() {
		return bdate;
	}

	public void setBdate(String bdate) {
		this.bdate = bdate;
	}

	public String getBcontent() {
		return bcontent;
	}

	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}
	
	
	
}
