public class Triangle extends Shape {
	double side;
	
	public Triangle(double side) {
		this.side = side;
	}
	
	public double area(){
		return side + side * 2;
	}
	
	public double perimeter(){
		return Math.sqrt(3)/4*side*side;
	}
	
	@Override
	public String toString(){
		return "삼각형, 둘레 : "+ area() + " 넓이 : " + perimeter();
	}
}
