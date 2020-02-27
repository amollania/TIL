package lecture09;
import java.util.*;

public class HashSetExample2 {
	public static void main(String[] args) {
		Set<Member> set = new HashSet<Member>();
		
		set.add(new Member("Hong", 30));
		set.add(new Member("King", 30));
		
		System.out.println("Result : " + set.size());
	}
}
