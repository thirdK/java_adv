package jdbc;

/*CREATE TABLE `order` (
		`oid` INT(10) NOT NULL AUTO_INCREMENT,
		`opid` INT(10) NOT NULL,
		`ouid` INT(10) NOT NULL,
		`opname` VARCHAR(20) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
		`oprice` VARCHAR(20) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
		`ostatus` VARCHAR(10) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
		`odate` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
		`ograde` VARCHAR(10) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
		`ocomm` VARCHAR(20) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
		PRIMARY KEY (`oid`) USING BTREE
	)
*/

public class OrderDTO {
	private int oid;
	private String opid;
	private String ouid;
	private String opname;
	private String oprice;
	private String ostatus;
	private String odate;
	private String ograde;
	private String ocomm;
	
	public OrderDTO() {;}
	
	
	public OrderDTO(int oid, String opid, String ouid, String opname, String oprice, String ostatus, String odate,
			String ograde, String ocomm) {
		this.oid = oid;
		this.opid = opid;
		this.ouid = ouid;
		this.opname = opname;
		this.oprice = oprice;
		this.ostatus = ostatus;
		this.odate = odate;
		this.ograde = ograde;
		this.ocomm = ocomm;
	}
	public int getOid() {
		return oid;
	}
	public void setOid(int oid) {
		this.oid = oid;
	}
	public String getOpid() {
		return opid;
	}
	public void setOpid(String opid) {
		this.opid = opid;
	}
	public String getOuid() {
		return ouid;
	}
	public void setOuid(String ouid) {
		this.ouid = ouid;
	}
	public String getOpname() {
		return opname;
	}
	public void setOpname(String opname) {
		this.opname = opname;
	}
	public String getOprice() {
		return oprice;
	}
	public void setOprice(String oprice) {
		this.oprice = oprice;
	}
	public String getOstatus() {
		return ostatus;
	}
	public void setOstatus(String ostatus) {
		this.ostatus = ostatus;
	}
	public String getOdate() {
		return odate;
	}
	public void setOdate(String odate) {
		this.odate = odate;
	}
	public String getOgrade() {
		return ograde;
	}
	public void setOgrade(String ograde) {
		this.ograde = ograde;
	}
	public String getOcomm() {
		return ocomm;
	}
	public void setOcomm(String ocomm) {
		this.ocomm = ocomm;
	}
	
}
