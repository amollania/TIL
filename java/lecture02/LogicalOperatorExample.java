public class LogicalOperatorExample {
    public static void main(String[] args) {
        int charCode = 'A';

        if((charCode>=65) & (charCode<=90)) {
            System.out.println("It's uppercase.");
        }

        if((charCode>=97) & (charCode<=122)) {
            System.out.println("It is lowercase.");
        }

        if(!(charCode<48) && !(charCode>57)) {
            System.out.println("It is Number.");
        }

        int value = 6;

        if((value%2==0) | (value%3==0)) {
            System.out.println("It is a multiple of two or three.");
        }

        if((value%2==0) || (value%3==0)) {
            System.out.println("It is a multiple of two or three.");
        }
    }
}