public class SwitchExample {
    public static void main(String[] args) {
        int num = (int)(Math.random()*6) + 1;

        switch(num) {
            case 1:
                System.out.println("That is 1"); break;
            case 2:
                System.out.println("That is 2"); break;
            case 3:
                System.out.println("That is 3"); break;
            case 4:
                System.out.println("That is 4"); break;
            case 5:
                System.out.println("That is 5"); break;
            default:
                System.out.println("That is 6"); break;
        }
    }
}