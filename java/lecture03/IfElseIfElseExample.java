public class IfElseIfElseExample {
    public static void main(String[] args) {
        int score = 85;

        if(score >= 90) {
            System.out.println("The score is greater than 90");
        } else if (score >= 80) {
            System.out.println("Score from 80 to 89");
        } else if (score >= 70) {
            System.out.println("Score from 70 to 79");
        } else {
            System.out.println("Score less than 70");
        }
    }
}