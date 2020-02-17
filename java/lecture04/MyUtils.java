package lecture04;

import java.util.Arrays;

public class MyUtils {
	public Apple[] filter(Apple[] apples, Predicate predicate) {
		Apple[] retApples = new Apple[apples.length];
		int count = 0;
		for(Apple apple : apples) {
			if (predicate.test(apple)) {
				retApples[count++] = apple;
			}
		}
		Apple[] apples2 = Arrays.copyOf(retApples, count);
		
		return apples2;
	}
}
