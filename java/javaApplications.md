자바 어플리케이션
====
자바 수업 도중에 배운 것을 응용하여 만들어 본 어플리케이션 모음

가위 바위 보
----
```java
public static void main(String[] args) {
    System.out.println("영희가 당신에게 도전장을 내밀었다.");
    System.out.println("1.가위_ 2.바위_ 3이상_ 보");

    Scanner scan = new Scanner(System.in);
    Random random = new Random();
    int soo = scan.nextInt();
    int hee = random.nextInt(3) + 1;

    String strg = "";
    String strg2 = "";

    // Change Numer from String
    switch(soo) {
    case 1:strg = "가위";break;
    case 2:strg = "바위";break;
    default:strg = "보";break;
    }

    switch(hee) {
    case 1:strg2 = "가위";break;
    case 2:strg2 = "바위";break;
    default:strg2 = "보";break;
    }


    if(soo==1&&hee==1 || soo==2&&hee==2 || soo==3&&hee==3){
        System.out.println("철수"+strg);
        System.out.println("영희"+strg2);
        System.out.println("게임에서 비겼습니다.");
    }else if(soo==1&&hee==3 || soo==2&&hee==1 || soo==3&&hee==2){
        System.out.println("철수"+strg);
        System.out.println("영희"+strg2);
        System.out.println("게임에서 승리");
    }else {
        System.out.println("철수"+strg);
        System.out.println("영희"+strg2);
        System.out.println("게임에서 패배했습니다.");
    };

    scan.close();
}
```