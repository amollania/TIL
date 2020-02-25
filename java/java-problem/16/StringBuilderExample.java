public class StringBuilderExample {
	public static void main(String[] args) {
		String str = "";
		for (int i = 1; i<= 100; i++) {
			str += i;
		}
		System.out.println(str);
		
		StringBuilder sb = new StringBuilder();
		for(int j=1; j<=100; j++) {sb.append(j);}
		System.out.println(sb);
	}
}