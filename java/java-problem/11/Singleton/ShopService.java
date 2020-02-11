package javaclear;

public class ShopService {
	private static ShopService singleton = new ShopService(); // 싱글톤 객체를 만드는 법
	
	private ShopService() {} // private에는 아무것도 기재하지 않는다.

	static ShopService getInstance() {
		return singleton;
	}
}
