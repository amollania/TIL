public class SwitchCharExample {
    public static void main(String[] args) {
        char grade = 'B';

        switch(grade) {
            case 'A':
            case 'a':
                System.out.println("it's great");
                break;
            case 'B':
            case 'b':
                System.out.println("it's good");
                break;
            default:
                System.out.println("it's noob");
        }
    }
}