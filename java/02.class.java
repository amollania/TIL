/* 일반적인 클래스 사용방법 */

// main.java
public class main{
	public static void main(String[] args) {
	Book book1 = new Book();
	book1.title = "노인과 바다";
	book1.author = "헤밍웨이";
	book1.year = 1992;

	System.out.println("첫번째 책");
	System.out.println("제목 : " + book1.title);
	System.out.println("작가 : " + book1.author);
	System.out.println("연도 : " + book1.year);

	Book book2 = new Book();
	book2.title = "자전거";
	book2.author = "엄복동";

	System.out.println("첫번째 책");
	System.out.println("제목 : " + book2.title);
	System.out.println("작가 : " + book2.author);
	System.out.println("연도 : " + book2.now);
	}
}

// Book.java
// import java.util.Calendar;
public class Book {
	String title;
	String author;
	int year;
	int now = Calendar.getInstance().get(Calendar.YEAR);
}


/* Private를 이용한 클래스 파일 변수 숨긴 후 쓰는 방법 */
// main.java
public class main{
	public static void main(String[] args) {
	Book book1 = new Book();
	book1.setTitle("노인과 바다");
	book1.setAuthor("헤밍웨이");
	book1.setYear(1992);
	
	System.out.println("첫번째 책");
	System.out.println("제목 : " + book1.getTitle());
	System.out.println("작가 : " + book1.getAuthor());
	System.out.println("연도 : " + book1.getYear());
	
	Book book2 = new Book();
	book2.setTitle("자전거");
	book2.setAuthor("엄복동");
	book2.setYear(1998);
	
	System.out.println("첫번째 책");
	System.out.println("제목 : " + book2.getTitle());
	System.out.println("작가 : " + book2.getAuthor());
	System.out.println("연도 : " + book2.getNow());
	}
}

// Book.java
// import java.util.Calendar;
public class Book {
	private String title;
	private String author;
	private int year;
	private int now = Calendar.getInstance().get(Calendar.YEAR);

	// private로 막은 매소드를 사용하기 위한 단계
	public void setTitle(String title) {
		this.title = title;
	}
	// return 값으로 main.java에서 결과 바로 출력
	public String getTitle() {
		return title;
	}

	public void setAuthor(String author) {
		this.author = author;
	}	
	public String getAuthor() {
		return author;
	}

	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}

	public int getNow() {
		return now;
	}
	public void setNow(int now) {
		this.now = now;
	}
}


// BankAccount
// main.java
public class main{
	public static void main(String[] args) {
	
		/*
			클래스 : BankAccount
			필드 : balance(계좌 잔액)
			메소드
			1. 계좌로 돈 입금 : deposit() -> 매개변수는 금액
			2. 계좌에서 돈 출금 : withdraw() -> 매개변수는 금액
			3. 계좌의 잔액 출력 : printBalance() -> 콘설에 현재 금액 출력
		*/
		
		BankAccount Bank = new BankAccount();
		BankAccount yourBank = new BankAccount();
		
		Bank.deposit(10000);
		System.out.print("출금 후의 내 계좌의 잔액 : ");Bank.printBalance();
		Bank.without(2000);
		System.out.print("출금 후의 내 계좌의 잔액 : ");Bank.printBalance();
		
		yourBank.deposit(5000);
		System.out.print("입금 후의 친구 계좌의 잔액 : ");yourBank.printBalance();
		yourBank.deposit(5000);
		System.out.print("입금 후의 친구 계좌의 잔액 : ");yourBank.printBalance();
		
		Bank.without(2000);
		System.out.print("출금 후의 내 계좌의 잔액 : ");Bank.printBalance();
		Bank.without(2000);
		System.out.print("출금 후의 내 계좌의 잔액 : ");Bank.printBalance();
		Bank.without(2000);
		System.out.print("출금 후의 내 계좌의 잔액 : ");Bank.printBalance();
	}
}
// BankAccount.java
public class BankAccount {
	private int balance;
	// 입금
	public void deposit(int money) {
		balance += money;
	}
	public void without(int money) {
		balance-=money;
	}
	public void printBalance() {
		System.out.printf("%, d\n", balance);
	}
}
