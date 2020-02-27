package lecture09;

public class BoxExample {
	 public static void main(String[] args) {
		 Box<String> box = new Box<String>();
		 box.setObj("10");
		 String obj = (String)box.getObj();
		 System.out.println(obj);
		 
		 box.setObj("Nara");
		 String obj2 = (String) box.getObj();
		 System.out.println(obj2);
		 
		 box.setObj("Hello");
		 String obj3 = (String)box.getObj();
		 System.out.println(obj3);
		 
		 Box<Fruit> fruitBox = new Box<Fruit>();
		 fruitBox.setObj(new Apple());

	 }
}
