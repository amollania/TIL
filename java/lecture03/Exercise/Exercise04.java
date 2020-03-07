public class Exercise05 {
    public static void main(String[] args) {
        int x;
        int result;

        for(x<=10; x++) {
            for(int y=0; y<=10; y++) {
                if ((4*x)+(5*y)==60) {
                    System.out.println("("+x+")"+"("+y+")");
                }
            }
        }
    }
}