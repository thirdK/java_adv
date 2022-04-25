package jdbc;

public class StudentDTO {
	private String no;
	private String dept;
	private String name;
	private String addr;
	private String phone;
	
	public StudentDTO(String no, String dept, String name, String addr, String phone) {
		this.no = no;
		this.dept = dept;
		this.name = name;
		this.addr = addr;
		this.phone = phone;
	}
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getDept() {
		return dept;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
}
