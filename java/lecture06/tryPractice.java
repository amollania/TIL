package lecture06;

import java.util.Scanner;

public class tryPractice {
	public static void main(String[] args) {
		// 두 정수를 입력받아 첫번째 수에서 두번째 수를 나누어
		// 결과를 표시하는 프로그램을 작성하세요.
		// 만약 나누는 수가 0이면 0으로 나눌 수 없다로
		// 출력하고 다시 입력받도록 할 것.
		// 만약 나눌 수가 숫자가 아니면 다시 입력 받도록 할 것.
		
		Scanner scanner = new Scanner(System.in);
		int num1 = 0;
		
		// 반복문
		do {			
			System.out.print("어떤 수를 나누겠습니까?");
			String str1 = scanner.next();
			try {
				num1 = Integer.parseInt(str1);
			} catch(NumberFormatException e) {
				System.out.println("잘못된 입력이뢰다.");
				continue;
			}
			
			System.out.print("어떤 수로 나누겠습니까?");			
			
			int num2 = scanner.nextInt();
			int result;
			
			try {
				result = num1 / num2;
			} catch (ArithmeticException e) {
				System.out.println("0으로 나눌 수 없다. 다시 입력해라");
				continue;
			}
			System.out.println(result);
			break;
			
			//continue 실행 시 다음 문구를 실행하지 않고 반복문을 계속 맴돌게 된다.
			//break 실행 전까지 반복 실행된다.
		} while (true);
		
		
		scanner.close();
	}
}