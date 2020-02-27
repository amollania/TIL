package lecture09;

public class Util {
	public static <T extends Number> int compare(T t1, T t2) {
		double v1 = t1.doubleValue();
		double v2 = t2.doubleValue();
		
		return Double.compare(v1, v2); //t1이 크면 1, t2까 크면 -1 반환 메소드
	}
}
