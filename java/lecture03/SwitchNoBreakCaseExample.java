public class SwitchNoBreakCaseExample {
    public static void main(String[] args) {
        int time = (int)(Math.random()*4) + 8;
        System.out.println("[Now time] : " + time + " hour");

        switch(time){
            case 8:
            System.out.println("Start");
            case 9:
            System.out.println("Working");
            case 10:
            System.out.println("Meet up");
            default:
            System.out.println("go home");
        }
    }
}