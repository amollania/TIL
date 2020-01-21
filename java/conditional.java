//java条件分岐
//if文の例

class Main{
    public static void main(String[] args) {
        if (true) {
            System.out.println("This is TRUE");
        }

        if (false) {
            System.out.println("This is FALSE");
        }

        int x = 5;
        int y = 10;

        if (x < y) {
            System.out.println(x+"は"+y+"より小さい");
            System.out.println("合計は"+(x+y)+"です。");
        }



        //比較式要約 Result = A
        int score = 95;
		char grade = (score> 90) ? 'A' : 'B';
		
		System.out.println(grade);
    }
}
