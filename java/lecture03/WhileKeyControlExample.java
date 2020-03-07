public class WhileKeyControlExample {
    public static void main(String[] args) throws Exception {
        boolean run = true;
        int speed = 0;
        int keyCode = 0;

        while(run) {
            if(keyCode!=13 && keyCode!=10) {
                System.out.println("--------------------------");
                System.out.println("1.fast | 2.slow | 3.stop");
                System.out.println("--------------------------");
                System.out.print("Select");
            }

            keyCode = System.in.read();

            if (keyCode == 49) {
                speed++;
                System.out.println("Now Speed = " + speed);
            } else if (keyCode == 50) {
                speed--;
                System.out.println("Now Speed = " + speed);
            } else if (keyCode == 51) {
                run = false;
            }
        }

        System.out.println("Program Exit");
    }
}