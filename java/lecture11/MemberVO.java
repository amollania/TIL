package lecture11;

public class MemberVO {
	private String mem_Id;
	private String memName;
	private String memAdd1;
	private String memHp;
	
	public MemberVO(String mem_Id, String memName, String memAdd1, String memHp) {
		super();
		this.mem_Id = mem_Id;
		this.memName = memName;
		this.memAdd1 = memAdd1;
		this.memHp = memHp;
	}
	
	public String getMemId() {
		return mem_Id;
	}
	public void setMem_Id(String mem_Id) {
		this.mem_Id = mem_Id;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public String getMemAdd1() {
		return memAdd1;
	}
	public void setMemAdd1(String memAdd1) {
		this.memAdd1 = memAdd1;
	}
	public String getMemHp() {
		return memHp;
	}
	public void setMemHp(String memHp) {
		this.memHp = memHp;
	}
	@Override
	public String toString() {
		return "MemberVO [mem_Id=" + mem_Id + ", memName=" + memName + ", memAdd1=" + memAdd1 + ", memHp=" + memHp
				+ "]";
	}
	
	
}
