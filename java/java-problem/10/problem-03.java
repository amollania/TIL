/*
비행기를 나타내는 Plane 클래스를 만들어 보자. 필드는 제작사(manufacturer), 모델명(model), 최대 승객수(maxNumberOfPassengers)가 있다. 생성자는 기본 생성자와 모든 필드를 매개변수로 받는 생성자가 있다. Plane 클래스에 지금까지 생성된 비행기 객체의 수를 나타내는 정적 변수인 numberOfPlanes를 추가로 만들고, 생성자에서 증가시켜준다. 각 필드(numberOfPlanes 제외)의 getter와 setter를 만들어 준다. 정적변수 numberOfPlanes의 값을 반환하는 정적 메소드 getNumberOfPlanes()를 추가한다.
*/

package javaclear;
    public class main{
    public static void main(String[] args) {

        Plane plane1 = new Plane("보잉", "보잉 747", 450);
        System.out.println("제조사: " + plane1.getManufacture());
        System.out.println("모델명: " + plane1.getModel());
        System.out.println("최대 승객수: " + plane1.getMaxNumberOfPassengers());
        System.out.println();
        
        
        Plane plane2 = new Plane("보잉", "보잉 747", 450);
        System.out.println("제조사: " + plane2.getManufacture());
        System.out.println("모델명: " + plane2.getModel());
        System.out.println("최대 승객수: " + plane2.getMaxNumberOfPassengers());
        System.out.println();
        
        
        Plane plane3 = new Plane("보잉", "보잉 747", 450);
        System.out.println("제조사: " + plane3.getManufacture());
        System.out.println("모델명: " + plane3.getModel());
        System.out.println("최대 승객수: " + plane3.getMaxNumberOfPassengers());
        System.out.println();
        
        System.out.println("생산된 비행기의 수: " + Plane.getNumberOfPlanes())
    }
}


/*
필드에는 현재속도(speed) - double, 최대속력(MAX_SPEED) - double 초기값 200, 색상(color) - String이 있고, 모든 필드는 private으로 선언한다. 생성자에는 기본 생성자와, 자동차의 색상만 입력받는 생성자가 있다. 메소드는 상수를 제외한 필드에 getter와 setter를 만들고 getMaxSpeed() 메소드는 최대 속력값을 반환하는 정적 메소드를 만든다. speedUp(double speed) 메소드는 원하는 속도(speed)가 0보다 작거나 최대 속력을 넘으면 현재 속도를 유지하고 false값을 반환한다. 그렇지 않을 경우 원하는 속도(speed)로 현재 속도를 변경하고 true를 반환한다.
*/