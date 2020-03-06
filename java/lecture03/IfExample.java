public class IfExample {
    public static void main(String[] args) {
        int score = 93;

        if(score >= 90) {
            System.out.println("The score is greater than 90");
            System.out.println("Grade A");
        }

        if(score < 90) {
            System.out.println("Score is less than 90");
            System.out.println("Grade B");
        }
    }
}