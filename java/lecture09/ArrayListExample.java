package lecture09;

import java.util.ArrayList;

public class ArrayListExample {
	public static void main(String[] args) {
		ArrayList<String> list = new ArrayList<String>();
		list.add("Hong");
		list.add("App");
		list.add("Mong");
		System.out.println(list.toString());
		
		list.remove("App");
		System.out.println(list.toString());

		list.add(2, "Dack");
		System.out.println(list.toString());
		
		list.remove(0);
		System.out.println(list.toString());
		
		list.clear();
		System.out.println(list.toString());
	}

}
