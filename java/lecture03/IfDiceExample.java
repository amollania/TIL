public class IfDiceExample {
    public static void main(String[] args) {
        int num = (int) (Math.random()*6) +1;

        if (num==1) {
            System.out.println("This is 1");
        } else if(num==2) {
            System.out.println("This is 2");
        } else if(num==3) {
            System.out.println("This is 3");
        } else if(num==4) {
            System.out.println("This is 4");
        } else if(num==5) {
            System.out.println("This is 5");
        } else {
            System.out.println("This is 6");
        }
    }
}