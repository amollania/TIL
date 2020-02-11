public class account {
	String id;
	String password;
	
	boolean login(String id, String password) { //bloolean + 메소드 명 (타입 변수, n개)
		if (id.equals("hong") && password.equals("12345")) { // 조건부 구간
			return true; // 기본적으로 false 이기 때문에 true로 바꿀 기회를 제공
		}
		return false; // 출력 부분에도 return 값이 존재해야 한다.
	}
	
	String logout( String id ) {
		if (id.equals("hong")){
		return "로그아웃 되었습니다.";
		}
		return "로그아웃 실패";
	}
}