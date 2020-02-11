public class main{
	public static void main(String[] args) {

		boolean nee;
		
		account ACCOUNT = new account();
		
		
		nee = ACCOUNT.login("hong", "12345");
		System.out.println(nee);
		
		System.out.println(ACCOUNT.logout("hongs"));
		
	}
}
