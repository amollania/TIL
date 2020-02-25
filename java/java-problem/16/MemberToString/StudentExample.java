package membertostring;

import java.util.HashMap;
import java.util.Map;

public class StudentExample {
	public static void main(String[] args) {
		// Student 키로 총점을 저자하는 HashMap 객체 생성
		Map<Student, String> map = new HashMap<Student, String>();
		
		// newStudent("1")의 점수 95 저장
		map.put(new Student("1"), "95");
		
		// new Student("1")로 점수를 읽어옴
		String score = map.get(new Student("1"));
		System.out.println("1번 학생의 총점 : " + score);
		
		Member member = new Member("1", "김군");
		String strObj = member.toString();
		System.out.println(strObj);
	}
}