class Main_exercise01{
    public static void main(String[] args) {
        
        int count = 0;
        for(int i=1; i<=100; i++){
            if (i%3==0) {
                count+=i;
            }
        }
        System.out.print(count);
    }
}
