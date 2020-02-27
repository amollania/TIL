package lecture09;

public class Person {
	private String type;
	
	public Person(String type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return type;
	}

}
