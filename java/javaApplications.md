Javaのアプリケーション
====
Javaの塾の授業中に学んだことを応用して作成しました。

じゃんけんぽん
----
```java
public static void main(String[] args) {
    System.out.println("ヨンヒはあなたに挑戦状を差し出した。");
    System.out.println("1は_じゃん_ 2は_けん_ 3以上は_ぽん_");

    Scanner scan = new Scanner(System.in);
    Random random = new Random();
    int soo = scan.nextInt();
    int hee = random.nextInt(3) + 1;

    String strg = "";
    String strg2 = "";

    // Change Numer from String
    switch(soo) {
    case 1:strg = "じゃん";break;
    case 2:strg = "けん";break;
    default:strg = "ぽん";break;
    }

    switch(hee) {
    case 1:strg2 = "じゃん";break;
    case 2:strg2 = "けん";break;
    default:strg2 = "ぽん";break;
    }


    if(soo==1&&hee==1 || soo==2&&hee==2 || soo==3&&hee==3){
        System.out.println("山本"+strg);
        System.out.println("ヨンヒ"+strg2);
        System.out.println("ゲームで引き分けた。");
    }else if(soo==1&&hee==3 || soo==2&&hee==1 || soo==3&&hee==2){
        System.out.println("山本"+strg);
        System.out.println("ヨンヒ"+strg2);
        System.out.println("ゲームで勝利");
    }else {
        System.out.println("山本"+strg);
        System.out.println("ヨンヒ"+strg2);
        System.out.println("ゲームからまけた！");
    };

    scan.close();
}
```

うるう年はこちら
----
```java
import java.util.Scanner;
public static void main(String[] args) {
    /*
        * 연도를 입력받고 입력한 연도가 윤년인지 아닌지를 확인하는 프로그램 작성
        * 윤년의 조건
        * 4의 배수이어야 하고, 100의 배수는 아니어야 한다.
        * 또 400의 배수는 무조건 윤년이 된다.
        */
    Scanner scan = new Scanner(System.in);
    System.out.println("윤년인지 확인 할 연도를 입력해라.");
    System.err.print("숫자 입력 : ");

    while(!scan.hasNextInt()) {
        scan.next();
        System.err.println("숫자 아니다. 다시 입력해라.");
        System.err.print("숫자 입력 : ");
    }
    int year = scan.nextInt();

    if (year%4==0 && year%100 != 0 || year%400==0) {
        System.out.print("윤년입니다.");
    }else {
        System.err.print("윤년 아니다.");
    }

    scan.close();
}
```

曜日出力プログラム
----
```java
import java.util.Scanner;

public static void main(String[] args) {
Scanner scan = new Scanner(System.in);
System.out.println("연도는?");
int year = scan.nextInt();
System.out.println("월은?");
int month = scan.nextInt();
System.out.println("일은?");
int day = scan.nextInt();
int totalDays =0;
totalDays += (year - 1900) * 365;
totalDays += (year - 1900) / 4;

if (((year%4 ==0)&&(year%100!=0))&&(month<=2)||(year%400==0)&&(month<=2)){
    totalDays += -1;
}

// 경고 표시 if문으로 시작
if (year>=1900 && month >=3 || year<=2100 && month <=2) {
    if(month >=1 && day<31){totalDays+=day;
        // 입력 성공시
        if(month >=2 && day<28){totalDays+=28;
        if(month >=3 && day<31){totalDays+=31;
        if(month >=4 && day<30){totalDays+=30;
        if(month >=5 && day<31){totalDays+=31;
        if(month >=6 && day<30){totalDays+=30;
        if(month >=7 && day<31){totalDays+=31;
        if(month >=8 && day<31){totalDays+=31;
        if(month >=9 && day<30){totalDays+=30;
        if(month >=10 && day<31){totalDays+=31;
        if(month >=11 && day<31){totalDays+=31;
        if(month >=12 && day<31){totalDays+=31;
        }}}}}}}}}}}

        totalDays += ((month)*31)+day;

        switch(totalDays%7) {
        case 1:System.out.println(year+"년"+ month+"월 "+day+"일은 "+"월요일입니다."); break;
        case 2:System.out.println(year+"년"+ month+"월 "+day+"일은 "+"화요일입니다."); break;
        case 3:System.out.println(year+"년"+ month+"월 "+day+"일은 "+"수요일입니다."); break;
        case 4:System.out.println(year+"년"+ month+"월 "+day+"일은 "+"목요일입니다."); break;
        case 5:System.out.println(year+"년"+ month+"월 "+day+"일은 "+"금요일입니다."); break;
        case 6:System.out.println(year+"년"+ month+"월 "+day+"일은 "+"토요일입니다."); break;
        default:System.out.println(year+"년"+ month+"월 "+day+"일은 "+"일요일입니다."); break;}

    }else {System.out.println("결과 : 입력이 잘못되었습니다.");}
}else{
    System.out.println("알고리즘을 사용할 수 없다.");
}

System.out.print("종료");
scan.close();
}
```

数字合わせゲーム
----
```java
import java.util.Scanner;
import java.util.Random;

public static void main(String[] args) {
    Scanner scan = new Scanner(System.in);

    // コンピュータの数を作成
    Random random = new Random();
    int computer = random.nextInt(100)+1;

    // ユーザー数の作成
    System.out.println("1부터 100 사이의 정수 중 하나를 입력하세요.");
    int user = scan.nextInt();

    // 使用回数のカウント
    int count = 0;

    while (user != computer) {
        System.out.println(computer);
        if (computer > user) {
            System.out.println("더 큰 수를 입력하세요.");
            count += 1;
        }else if(computer < user) {
            System.out.println("더 작은 수를 입력하세요.");
            count += 1;
        }
        // 数字の再入力する
        user = scan.nextInt();
        count += 1;
    }

    System.out.println("총 시도 횟수는 "+count + "번 입니다.");
    // プログラムの終了
    scan.close();
}
```

上記のコードを少し改善してアップロード
```java
import java.util.Scanner;

Scanner scan = new Scanner(System.in);
int year = 0;
int month = 0;
int day = 0;
int totalDays = 0;

while(true) {
    System.out.println("연도는?");
    year = scan.nextInt();
    System.out.println("월은?");
    month = scan.nextInt();
    System.out.println("일은?");
    day = scan.nextInt();
    if (year>=1900 && year<=2100 && month > 0 && month <= 12 && day > 0 && day <= 31){
        break;
    }
    System.out.println("연도, 월, 일 셋 중 잘 못 입력하셨어요. 다시 입력하도록 하세욧!");
}

totalDays += (year-1900) * 365;
for(int i=1900; i<=year; i++) {
    if((year % 4 ==0 && year % 100 != 0 || year % 400 == 0) && (month==1)) {
        totalDays += 1;
    }
}
totalDays += (year - 1900) / 4;

int months[] = {day,31,28,31,30,31,30,31,31,30,31,30};
for(int i=0; i<month; i++) {
    totalDays += months[i];
}
String days[] = {"일", "월", "화", "수", "목", "금", "토"};

System.out.println(days[totalDays%7]+"요일 입니다.");
scan.close();
```


フィボナッチ数列
----
```java
import java.util.Scanner;

public static void main(String[] args) {

    Scanner scan = new Scanner(System.in);

    // 사용자 숫자 생성
    System.out.print("몇 번째 항까지 출력하시겠습니까? (3 이상 입력) :.");

    // 숫자 입력하기
    int user = scan.nextInt();
    // 숫자 검사하기
    while (user < 3) {
        System.out.print("숫자 3이상 입력해라.");
        user = scan.nextInt();
    }

    int count = 0;
    int n = 0;
    int m = 1;

    while(count < user) {
        System.out.print((n = n + m) + " ");
        count += 1;

        //While문 내에서 중간 숫자 체크
        if (count == user){break;}

        System.out.print((m = n + m) + " ");
        count += 1;
    }

    // プログラムの終了
    scan.close();
}
```


参照型を活用したスコアの入力と出力
----
```java
public class main {
    public static void main(String[] args) {

        Scanner scan = new Scanner(System.in);

        int student = 0;
        // 리스트 생성
        int[] array = null;

        // 최고 점수, 합계, 평균점수
        int max = 0;
        int sum = 0;
        double avg = 0;

        while(true){
            System.out.println("--------------------");
            System.out.println("1.학생수 | 2.점수입력 | 3.점수리스트 | 4.분석 | 5.종료");
            System.out.println("--------------------");
            System.out.print("선택>");
            int num = scan.nextInt();

            switch(num) {
            case 1:
                System.out.print("학생수");
                student = scan.nextInt();
                break;
            case 2:
                array = new int[student];
                for(int i=0; i<array.length;i++) {
                    System.out.print("scores[" +i+"]>");
                    array[i] = scan.nextInt();
                }
                break;
            case 3:
                for(int i=0; i<array.length; i++) {
                    System.out.println("scores[" +array[i]+"]");
                }
                break;
            case 4:
                for(int i=0; i<array.length; i++) {
                    if(max<array[i]) {
                        max = array[i];
                    }
                    sum = sum + array[i];
                }
                avg = sum/student;
                System.out.println("최고 점수 : "+max);
                System.out.println("평균 점수 : "+avg);
                break;
            default:
                System.out.println("프로그램 종료");
                System.exit(0);
                break;
            }
        }
    }
}
```