public class AccuracyExample2 {
    public static void main(String[] args) {
        int apple = 1;

        int totalPieces = apple * 10;
        int number = 7;
        int temp = totalPieces - number;

        double result = temp/10.0;
        
        System.out.println("If you subtract 0.7 from one apple");
        System.out.println("is" + result);
    }
}