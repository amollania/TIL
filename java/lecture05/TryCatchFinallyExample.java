package lecture08;

import java.lang.reflect.Field;

public class TryCatchFinallyExample {
	public static void main(String[] args) {
		try {
			Class<?> clazz = Class.forName("java.lang.String");
			Field[] fields = clazz.getDeclaredFields();
			for (Field field : fields) {
				System.out.println(field.getName());
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SecurityException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
