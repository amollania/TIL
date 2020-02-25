package lecture08;

public class SynchroExample {
	public static void main(String[] args) {
		Calculator calculator = new Calculator();
		User1Thread user1Thread = new User1Thread(calculator);
		user1Thread.start();
		
		User2Thread user2Thread = new User2Thread(calculator);
		user2Thread.start();

		User3Thread user3Thread = new User3Thread(calculator);
		user3Thread.start();
		
	}
}
