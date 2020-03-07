public class SwitchStringExample{
    public static void main(String[] args) {
        String position = "Chief";

        switch(position) {
            case "Director":
                System.out.println("$ 7000");
                break;
            case "Chief":
                System.out.println("$ 5000");
                break;
            default:
                System.out.println("$ 3000");
        }
    }
}