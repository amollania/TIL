
public class Strudent extends Human{
	private String major;
	
	public Strudent(String name, int age, String major) {
		super(name, age);
		this.major = major;
	}
	
	public void setMajor(String major) {
		this.major = major;
	}
	
	public String getMajor() {
		return major;
	}
	
	@Override
	public String toString() {
		return super.toString() + major;
	}
}
