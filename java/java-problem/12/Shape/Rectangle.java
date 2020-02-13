public class Rectangle extends Shape {
	double width;
	double height;
	
	public Rectangle(double width, double height) {
		this.width = width;
		this.height = height;
	}
	
	public double area(){
		return (width + height) * 2;
	}
	
	public double perimeter(){
		return width*height;
	}
	
	@Override
	public String toString(){
		return "사각형, 둘레 : " + area() + " 사각형, 넓이 : " + perimeter();
	}
}
