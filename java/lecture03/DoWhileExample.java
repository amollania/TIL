import java.util.Scanner;

public class DoWhileExample {
    public static void main(String[] args) {
        System.out.println("Please input your Message");
        System.out.println("Type q to end the program");

        Scanner scanner = new Scanner(System.in);
        String inputString;

        do {
            System.out.println(">");
            inputString = scanner.nextLine();
            System.out.println(inputString);
        } while(!inputString.equals("q"));

        System.out.println();
        System.out.println("Programe Exit");
    }
}