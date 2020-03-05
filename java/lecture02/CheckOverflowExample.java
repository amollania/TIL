public class CheckOverflowExample {
    public static void main(String[] args) {
        try {
            int result = safeAdd(2000000000, 2000000000);
            System.out.println(result);
        } catch(ArithmeticException e) {
            System.out.println("Overflow! Can't Access");
        }
    }

    public static int safeAdd(int left, int right) {
        if((right > 0)) {
            if(left>(Integer.MAX_VALUE - right)) {
                throw new ArithmeticException("Overflow!");
            }
        } else {
            if(left < (Integer.MIN_VALUE - right)) {
                throw new ArithmeticException("Overflow!");
            }
        }
        return left + right;
    }
}