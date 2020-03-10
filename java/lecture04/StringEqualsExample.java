public class StringEqualsExample {
    public static void main(String[] args) {
        String strVar1 = "Shin";
        String strVar2 = "Shin";

        if(strVar1 == strVar2) {
            System.out.println("strVar1 and strVar2 are the same");
        } else {
            System.out.println("strVar1 and strVar2 have different references");
        }

        if(strVar1.equals(strVar2)) {
            System.out.println("strVar1 and strVar2 have the same string");
        }

        String strVar3 = new String("Shin");
        String strVar4 = new String("Shin");

        if(strVar3 == strVar4) {
            System.out.println("strVar3 and strVar4 are the same");
        } else {
            System.out.println("strVar3 and strVar4 have different references");
        }

        if(strVar3.equals(strVar4)) {
            System.out.println("strVar3 and strVar4 have the same string");
        }
    }
}