public class ForSumFrom1To100Example {
    public static void main(String[] args) {
        int sum = 0;
        
        int i = 0;
        for(i=0;i<=100;i++){
            sum += i;
        }

        System.out.println( i + "is 1~100 sum : " + sum);
    }
}