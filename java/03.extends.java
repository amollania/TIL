/* 클래스 상속하기 */

//CellPhone.java
public class CellPhone {
	// 필드
	String model;
	String color;
	
	// 생성자
	
	// 메소드
	void powerOn( ) {System.out.println("전원을 켭니다.");}
	void powerOff() {System.out.println("전원을 끕니다.");}
	void bell() {System.out.println("벨이 울립니다.");}
	void sendVoice(String message) {System.out.println("자기: "+ message);}
	void receiveVoice(String message) {System.out.println("상대방: "+ message);}
	void hangUp() {System.out.println("전화를 끊습니다.");}
}


//DmbCellPhone.java
public class DmbCellPhone extends CellPhone {
	//필드
	int channel;
	
	//생성자
	DmbCellPhone(String model, String color, int channel){
		this.model = model;
		this.color = color;
		this.channel = channel;
	}
	
	//메소드
	void turnOnDmb() {
		System.out.println("채널 " + channel + "번 DMB 방송 수신을 시작합니다.");
	}
	
	void changeChannelDmb(int channel) {
		this.channel = channel;
		System.out.println("채널 " + channel + "번으로 바꿉니다.");
	}
	
	void turnOffDmb() {
		System.out.println("DMB 방송 수신을 멈춥니다.");
	}
}


//DmbCellPhoneExample.java
public class DmbCellPhoneExample {
	public static void main(String[] args) {
		//DmbCellPhone 객체 생성
		//DmbCellPhone(String model, String color, int channel) 에서 
		//color와 channel 변수 필드는 DmbCellPhone에서 CellPhone으로부터 상속받아서 사용가능
		DmbCellPhone dmbCellPhone = new DmbCellPhone("갤럭시", "검정", 10);
		
		//CellPhone으로부터 상속받은 필드
		System.out.println("모델 : " + dmbCellPhone.model);
		System.out.println("색상 : " + dmbCellPhone.color);
		
		//DmbCellPhone의 필드
		System.out.println("채널 : " + dmbCellPhone.channel);
		
		//CellPhone으로부터 상속받은 메소드 호출
		dmbCellPhone.powerOn();
		dmbCellPhone.bell();
		dmbCellPhone.receiveVoice("안녕?");
		dmbCellPhone.sendVoice("아예");
		dmbCellPhone.hangUp();
		
		//메소드 호출
		dmbCellPhone.turnOnDmb();
		dmbCellPhone.changeChannelDmb(12);
		dmbCellPhone.turnOffDmb();
	}
}




// Tire.java
public class Tire {
	// 필드
	public int maxRotation;
	public int accumulatedRotation;
	public String location;
	
	// 생성자
	public Tire(String location, int maxRotation) {
		this.location = location;
		this.maxRotation = maxRotation;
	}
	
	// 메소드
	public boolean roll() {
		++accumulatedRotation; // 누적 회전수 1증가
		if(accumulatedRotation < maxRotation) {
			System.out.println(location + " Tire 수명 : " +(maxRotation-accumulatedRotation) + "회");
		return true;
		} else {
			System.out.println("*** " + location + " Tire 펑크  ***");
			return false;
		}
	}
}

// Car.java
public class Car {
	// 필드
	Tire[] tires = {
			new Tire("앞 왼쪽", 6),
			new Tire("앞 오른쪽", 2),
			new Tire("뒤 왼쪽", 3),
			new Tire("뒤 오른쪽", 4)
	};
	
	// 생성자
	int run() {
		System.out.println("[자동차가 달립니다.]");
		for(int i=0; i<tires.length; i++) {
			if(tires[i].roll()==false) {
				stop();
				return (i+1);
			}
		}
		return 0;
	}
	
	void stop() {
		System.out.println("[자동차가 멈춥니다.]");
	}
}

// HankookTire.java
public class HankookTire extends Tire {
	// 필드
	// 생성자
	public HankookTire(String location, int maxRotation) {
		super(location, maxRotation);
	}

	@Override
	public boolean roll() {
		++accumulatedRotation;
		if(accumulatedRotation < maxRotation) {
			System.out.println(location + " HankookTire 수명 : " + (maxRotation-accumulatedRotation) + "회");
			return true;
		} else {
			System.out.println("*** "+ location + " HankookTire 펑크 ***");
			return false;
		}
	}
}

// KumhoTire.java
public class KumhoTire extends Tire {
	// 필드
	// 생성자
	public KumhoTire(String location, int maxRotation) {
		super(location, maxRotation);
	}

	@Override
	public boolean roll() {
		++accumulatedRotation;
		if(accumulatedRotation < maxRotation) {
			System.out.println(location + " KumhoTire 수명 : " + (maxRotation-accumulatedRotation) + "회");
			return true;
		} else {
			System.out.println("*** "+ location + " KumhoTire 펑크 ***");
			return false;
		}
	}
}

// CarExample.java
public class CarExample {
	public static void main(String[] args) {
		Car car = new Car();
		
		for(int i=1; i<=10; i++) {
			int problemLocation = car.run();
			if(problemLocation != 0) {
				System.out.println(car.tires[problemLocation-1].location + " HankookTire로 교체");
				car.tires[problemLocation-1] =
						new HankookTire(car.tires[problemLocation-1].location, 15);
			}
			System.out.println("------------------");
		}
	}
}
