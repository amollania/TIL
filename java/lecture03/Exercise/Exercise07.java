import java.util.Scanner;

public class Exercise07 {
    public static void main(String[] args) {
        boolean run = true;
        int balance = 0;
        Scanner scanner = new Scanner(System.in);

        while(run) {
            System.out.println("--------------------------");
            System.out.println("1.Deposit || 2.Withdrawal || 3.Balance || 4.Ends");
            System.out.println("--------------------------");
            System.out.print("Selct >>");
            int input = scanner.nextInt();
        
            System.out.println("");

            if(input == 1) {
                System.out.print("Deposit >> ");
                balance += scanner.nextInt();
                System.out.println("");
            } else if(input == 2) {
                System.out.print("Withdrawal >> ");
                balance -= scanner.nextInt();
                System.out.println("");
            } else if(input == 3) {
                System.out.println("Balance >> " + balance);
            } else {
                break;
            }
        }
        System.out.println("Program Exit");

    }
}