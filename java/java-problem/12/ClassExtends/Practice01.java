
public class Practice01 {
	public static void main(String[] args) {
		Human man = new Human("Steve", 30);
		System.out.println(man);
		
		Strudent student = new Strudent("Parker", 23, "Physics");
		System.out.println(student);
		
		student.setName("Peter");
		student.setAge(19);
		student.setMajor("Computer Science");
		
		System.out.print("이름 : " + student.getName() + ", ");
		System.out.print("나이 : " + student.getAge() + ", ");
		System.out.print("전공 : " + student.getMajor());
	}
}
