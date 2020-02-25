package lecture08;

public class User1Thread extends Thread {
	private Calculator calculator;
	
	public User1Thread(Calculator calculator) {
		this.setName(getClass().getSimpleName());
		this.calculator = calculator;
	}
	
	@Override
	public void run() {
		// TODO Auto-generated method stub
		calculator.setMemory(100);
	}
	
}
