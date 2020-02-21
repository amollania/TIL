package lecture07;

public class StringReplaceExample {
	public static void main(String[] args) {
		//Use replace
		String oldStr = "Java is good language, You have to use Java";
		String newStr = oldStr.replace("Java", "Python");
		System.out.println(oldStr);
		System.out.println(newStr);
	}
}
