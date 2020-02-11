import java.util.Scanner;

public class BankApplication {
	private static Account[] accountArray = new Account[100];
	private static Scanner scanner = new Scanner(System.in);

	public static void main(String[] args) {
		boolean run = true;
		while (run) {
			System.out.println("+---------------------------------------+");
			System.out.println("1.계좌생성 | 2.계좌목록 | 3.예금 | 4.출금 | 5.종료");
			System.out.println("+---------------------------------------+");
			System.out.print("선택> ");
			
			int selectNo = scanner.nextInt();

			if (selectNo == 1) {
				createAccount();
			} else if (selectNo == 2) {
				accountList();
			} else if (selectNo == 3) {
				deposit();
			} else if (selectNo == 4) {
				withdraw();
			} else if (selectNo == 5) {
				run = false;
			}
		}
		System.out.println("프로그램 종료");
	}

	//계좌생성하기
	private static void createAccount() {
		//작성 위치
		System.out.println("----------");
		System.out.println(" 계 좌 생 성");
		System.out.println("----------");
		System.out.print("계좌번호 : ");
		
		System.out.print("계좌주 : ");
		String owner = scanner.next();

		System.out.print("초기입금액 : ");
		int money = scanner.nextInt();

		for (int i = 0; i < accountArray.length; i++){
			if (accountArray[i] == null) {
				accountArray[i] = new Account(ano, owner, money);
				System.out.println("결과 : 계좌가 생성되었습니다.");
				break;
			}
		}

	}

	//계좌목록보기
	private static void accountList() {
		//작성 위치
		System.out.println("--------");
		System.out.println("계좌  목록");
		System.out.println("--------");

		for (int i =0; i < accountArray.length; i++){
			if (accountArray[i] == null){
				break;
			}
			System.out.println(accountArray[i].getAno()+"\t"+accountArray[i].getOwner() + "\t" + accountArray[i].getBalance());
		}
	}

	//예금하기
	private static void deposit() {
		//작성 위치, findAccount호출해서 이용
		System.out.println("--------");
		System.out.println(" 예   금 ");
		System.out.println("--------");
		System.out.println("계좌  번호");
		String ano = scanner.next();
		System.out.print("예금액 : ");
		int dep = scanner.nextInt();
		
		if (findAccount(ano) == null){
			System.out.println("입력한 계좌번호를 찾지 못했습니다.");
		} else {
			findAccount(ano).setBalance(findAccount(ano).getBalance() + dep);
			System.out.println("결과 : 입금이 성공되었습니다.");
		}
	}

	//출금하기
	private static void withdraw() {
		//작성 위치, findAccount호출해서 이용
		System.out.println("--------");
		System.out.println(" 출   금 ");
		System.out.println("--------");
		System.out.println("계좌  번호");

		int withd = scanner.nextInt();

		if (findAccount(ano) == null){
			System.out.println("입력한 계좌번호를 찾지 못했습니다.");
		} else {
			if (withd > findAccount(ano).getBalance()){
				System.out.println("잔액보다 큰 액수를 입력하셨습니다.")
			} else {
				findAccount(ano).setBalance(findAccount(ano).getBalance() - withd);
				System.out.println("결과 : 출금이 성공되었습니다.")
			}
		}
	}

	//Account 배열에서 ano와 동일한 Account 객체 찾기
	private static Account findAccount(String ano) {
		//작성 위치
		for (int i = 0; i < count; i++) {
			if (accountArray[i].getAno().equals(ano)){
				return accountArray[i];
			}
		}
		return null;
	}
}