// 첫 번째는 알파벳으로 시작하고 두 번째 부터 숫자와 알파벳으로
// 구성된 8자~12자 사이의 ID값인지 검사하고 싶습니다.
// 알파벳은 대소문자를 모두 허용할 경우에 정규 표현식을 이용해서
// 검증하는 코드를 작성해보세요.

import java.util.Scanner;
import java.util.regex.Pattern;

public class PatternMatcherExample {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		String regExp = "[a-zA-Z]\\w{7,11}";
		while (true) {
			System.out.print("아이디를 확인하시겠습니까? (확인은 y, 종료는 n) : ");
			String confirm = scanner.next();
			if (confirm.equalsIgnoreCase("n")) {
				break;
			}
			System.out.print("아디리를 입력하세요 : ");
			String id = scanner.next();
			boolean isMatch = Pattern.matches(regExp, id);
			if (isMatch) {
				System.out.println("ID로 사용할 수 있습니다.");
			} else {
				System.out.println("ID로 사용할 수 없습니다.");
			}
			System.out.println();
		}
		scanner.close();
	}
}
