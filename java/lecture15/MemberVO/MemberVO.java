package lecture25;

public class MemberVO {
	
	

	private String memId;
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
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
	public String getMemAdd2() {
		return memAdd2;
	}
	public void setMemAdd2(String memAdd2) {
		this.memAdd2 = memAdd2;
	}
	public String getMemHp() {
		return memHp;
	}
	public void setMemHp(String memHp) {
		this.memHp = memHp;
	}
	public int getMemMileage() {
		return memMileage;
	}
	public void setMemMileage(int memMileage) {
		this.memMileage = memMileage;
	}
	private String memName;
	private String memAdd1;
	private String memAdd2;
	private String memHp;
	private int memMileage;
	@Override
	public String toString() {
		return "MemberVO [memId=" + memId + ", memName=" + memName + ", memAdd1=" + memAdd1 + ", memAdd2=" + memAdd2
				+ ", memHp=" + memHp + ", memMileage=" + memMileage + "]";
	}
	public MemberVO(String memId, String memName, String memAdd1, String memAdd2, String memHp, int memMileage) {
		super();
		this.memId = memId;
		this.memName = memName;
		this.memAdd1 = memAdd1;
		this.memAdd2 = memAdd2;
		this.memHp = memHp;
		this.memMileage = memMileage;
	}
	
	
	


}
