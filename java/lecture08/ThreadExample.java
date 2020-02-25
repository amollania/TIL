package lecture08;

public class ThreadExample {
	public static void main(String[] args) {
		//1. Runnable 인터페이스를 구현
		Runnable runnable = new Runnable() {		
			@Override
			public void run() {
				for (int i = 0; i<= 30; i++) {
					System.out.println(i + "번째 항목");
					try {
						Thread.sleep(100);
					} catch (InterruptedException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}				
			}
		};
		// runnable.run()
		Thread thread = new Thread(runnable);		
		thread.setPriority(Thread.MAX_PRIORITY);
		
		
		Thread thread2 = new Thread() {
			@Override
			public void run() {
				for (int i = 0; i<= 30; i++) {
					System.out.println(i + "번 작업");
					try {
						Thread.sleep(100);
					} catch (InterruptedException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}				
			}
		};
		thread2.setPriority(Thread.MIN_PRIORITY);
		thread2.start();
	}
}
