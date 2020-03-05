public class StringEqualsExample {
    public static void main(String[] args) {
        String strVar1 = "Shin";
        String strVar2 = "Shin";
        String strVar3 = new String("Shin");

        System.out.println(strVar1 == strVar2);
        System.out.println(strVar1 == strVar3);
        System.out.println();
        System.out.println(strVar1.equals(strVar2));
        System.out.println(strVar1.equals(strVar3));
    }
}