package lecture07;

public class Anonymous {
	Vehicle field = new Vehicle(){
		@Override
		public void run(){
			System.out.println("엄복동 나가신다!!");
		}
	};


	void method1(){
		Vehicle localVar = new Vehicle(){
			@Override
			public void run(){
				System.out.println("조형기가 추격합니다.");
			}
		};

		localVar.run();
	}

	void method2(Vehicle v){
		v.run();
	}
}