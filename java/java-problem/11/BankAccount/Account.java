package javaclear;

public class Account {
	private int balance;
	private final int MIN_BALANCE = 0; // 상수 지정
	private final int MAX_BALANCE = 1000000; // 상수 지정
	
	// This를 작성할 필요가 없다.
	public void setBalance(int money) {
		if (balance > MAX_BALANCE || balance < MIN_BALANCE) {
			System.out.println("ERROR");
		}
		else if(money > MAX_BALANCE || money < MIN_BALANCE) {
			System.out.println("FULL");
		}
		else {
			balance += money;
		}
	}
	
	// balance RETURN하기
	public int getBalance() {
		return balance;
	}
}
