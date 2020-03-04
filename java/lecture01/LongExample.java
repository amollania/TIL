public class LongExample {
    public static void main(String[] args) {
        long var1 = 10;
        long var2 = 20L;
        // long var3 = 10000000000;
        // compile ERORR
        long var4 = 10000000000L;

        System.out.println(var1);
        System.out.println(var2);
        System.out.println(var4);
    }
}