package TreeSetExample;

public class TreeSet {
	public static void main(String[] args) {
		TreeSet<Student> treeSet = new TreeSet<Student>();
		
		treeSet.add(new Student("Blue", 95));
		treeSet.add(new Student("Red", 64));
		treeSet.add(new Student("White", 95));
		
		Student student = treeSet.last();
		System.out.println("High Score : " + student.score);
		System.out.println("High Score ID : " + student.id);
	}
}
