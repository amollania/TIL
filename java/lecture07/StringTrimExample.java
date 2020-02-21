package lecture07;

public class StringTrimExample {
	public static void main(String[] args) {
		
		//Example
		//String oldStr = "    Trim     ";
		//String newStr = oldStr.trim();
		String tel1 = "    02";
		String tel2 = "12    ";
		String tel3 = "    25    ";
		
		String tel = tel1.trim() + tel2.trim() + tel3.trim();
		System.out.println(tel);
	}
}
