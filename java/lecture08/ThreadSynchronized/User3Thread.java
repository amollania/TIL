package lecture08;

public class User3Thread extends Thread {
	private Calculator calculator;
	
	public User3Thread(Calculator calculator) {
		this.setName(getClass().getSimpleName());
		this.calculator = calculator;
	}
	
	@Override
	public void run() {
		// TODO Auto-generated method stub
		calculator.setMemory(300);
	}
	
}
