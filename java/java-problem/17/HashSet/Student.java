package HashSet;

public class Student {
	public int studentNum;
	public String name;
	
	public Student (int studentNum, String name) {
		this.studentNum = studentNum;
		this.name = name;
	}
	
	@Override
	public int hashCode() {
		//Code
		return studentNum + name.hashCode();
	}
	
	@Override
	public boolean equals(Object obj) {
		//Code
		if (obj instanceof Student) {
			Student student = (Student) obj;
			return (studentNum == student.studentNum)&&(name.equals(student.name));
		} else {
			return false;
		}
	}
}
