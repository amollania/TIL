// 원주율 넓이
// main.java
public class main{
    public static void main(String[] args) {
        Circle circle1 = new Circle();
        circle1.setRadius(3.6);
        circle1.setX(0.0);
        circle1.setY(1.5);
        
        System.out.println("반지름 : " + circle1.getRadius());
        System.out.println("중심 좌표 : " + circle1.getX() + ", " + circle1.getY());
        System.out.println("반지름 : " + circle1.area());

        
        Circle circle2 = new Circle();
        circle2.setRadius(-5.0);
        circle2.setX(1.0);
        circle2.setY(2.2);
        
        System.out.println("반지름 : " + circle2.getRadius());
        System.out.println("중심 좌표 : " + "(" + circle2.getX() + "," + circle2.getY()+ ")");
        System.out.println("넓이 : " + circle2.area());
    }
}


// Circle.java
public class Circle {
	private double radius;
	private double x;
	private double y;

    /*
    매개 변수를 받는 생성자가 필요하면 'public class Circle{}'를 추가한다.
    public Circle(double radius, double x, double y)
    {
        this.radius = radius;
        this.x = x;
        this.y = y;
    }
    */
	public void setRadius(double radius) {
		if (radius < 0) {
			this.radius = 0;
		}
		else this.radius = radius;
	}
	
	public void setX(double x) {
		this.x = x;
	}
	
	public void setY(double y) {
		this.y = y;
	}
	
	// 반지름 출력
	public double getRadius() {
		return radius;
	}
	
	public double getX() {
		return x;
	}
	
	public double getY() {
		return y;
	}
    
    /* 생성자를 사용할 때는 To String을 이용해주는 편이 좋다.
    @Override
	public String toString() {
	return "....";
	}*/ 
	public double area() {
		return  Math.round((Math.PI)*(radius*radius)*100)/100.0;
	}
}