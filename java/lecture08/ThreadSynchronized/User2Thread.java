package lecture08;

public class User2Thread extends Thread {
	private Calculator calculator;
	
	public User2Thread(Calculator calculator) {
		this.setName(getClass().getSimpleName());
		this.calculator = calculator;
	}
	
	@Override
	public void run() {
		// TODO Auto-generated method stub
		calculator.setMemory(200);
	}
	
}
