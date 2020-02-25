package membertostring;

public class Member {
	private String id;
	private String name;
	public Member(String id, String name) {
		this.id = id;
		this.name = name;
	}
	
	@Override
	public String toString(){
		return id + "번 " + name + "학생의 총점 : " + 95;
	}
	
}
