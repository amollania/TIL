package lecture04;

import java.util.Arrays;

public class Exampletest {
	public static void main(String[] args) {
	  Apple[] apples = new Apple[10];
	  apples[0] = new Apple("1번 사과", Color.GREEN);
	  apples[1] = new Apple("2번 사과", Color.RED);
	  apples[2] = new Apple("3번 사과", Color.GREEN);
	  apples[3] = new Apple("4번 사과", Color.BLUE);
	  apples[4] = new Apple("5번 사과", Color.GREEN);
	  apples[5] = new Apple("6번 사과", Color.RED);
	  apples[6] = new Apple("7번 사과", Color.GREEN);
	  apples[7] = new Apple("8번 사과", Color.RED);
	  apples[8] = new Apple("9번 사과", Color.GREEN);
	  apples[9] = new Apple("10번 사과", Color.RED);
	  Apple[] filterApples = new MyUtils().filter(apples, new Predicate() {
		
		@Override
		public boolean test(Apple apple) {
			// TODO Auto-generated method stub
			return apple.getColor() == Color.RED;
		}
	  });
	  System.out.println(filterApples.length);
	}
}
