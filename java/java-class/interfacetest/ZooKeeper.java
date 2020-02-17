package interfacetest;

public class ZooKeeper {

    //Tiger를 호출했다면 predator에는 Tiger 클래스 명이 대입
    public void feed(Predator predator) {
        System.out.println("feed "+predator.getFood()); //대입된 클래스명의 메서드 호출하여 리턴값을 얻음
    }

    public static void main(String[] args) {
        ZooKeeper zooKeeper = new ZooKeeper(); //ZooKeeper.java의 생성자 생성
        Tiger tiger = new Tiger(); //Tiger.java의 생성자 생성
        Lion lion = new Lion();

        zooKeeper.feed(tiger); //ZooKeeper.java의 feed메서드에 tiger 클래스명 대입하여 feed 메서드 호출
        zooKeeper.feed(lion);
    }
}