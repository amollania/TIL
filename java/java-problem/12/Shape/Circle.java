public class Circle extends Shape {
	double radius;
	
	public Circle(double radius) {
		this.radius = radius;
	}
	
	public double area(){
		return 2*radius*Math.PI;
	}
	
	public double perimeter(){
		return Math.PI *(radius * radius);
	}
	
	@Override
	public String toString(){
		return "원, 둘레 : " + area() + " 넓이 : " + perimeter();
	}
}
