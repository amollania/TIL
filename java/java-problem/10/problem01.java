package java-problem;

public class problem01{
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


