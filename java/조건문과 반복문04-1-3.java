class Main_exercise02{
    public static void main(String[] args) {
        
        int natrual = 10;

        for(int x=0; x<=natrual; x++){
            int y=0;
                for(y=0; y<=natrual; y++){
                    if((4*x)+(5*y)==60){
                        System.out.print("("+x+", "+y+")");
                    }
            }
        }
        // System.out.print(count);
    }
}
