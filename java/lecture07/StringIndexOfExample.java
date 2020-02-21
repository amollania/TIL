package lecture07;

public class StringIndexOfExample {
	public static void main(String[] args) {
		String subject = "Java Programming";
		
		int location = subject.indexOf("Programming");
		System.out.println(location);
		
		if (subject.indexOf("Java") != -1) {
			System.out.println("Java in here");
		} else {
			System.out.println("Java not here");
		}
		
		if (subject.indexOf("JS") != -1) {
			System.out.println("JS in here");
		} else {
			System.out.println("JS not here");
		}
	}
}
