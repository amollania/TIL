Homework
====

아래의 코드는 사과를 담는데 필요한 바구니(버킷)의 수를 구하는 코드이다. 만일 사과의 수가 123개이고 하나의 바구니에는 10개의 사과를 담을 수 있다면, 13개의 바구니가 필요할 것이다. (1)에 알맞은 코드를 넣으시오.
실행결과 : 16
```java
public static void main(String[] args) {
    int numOfApples = 156;
    int sizeOfBucket = 10;
    int numOfBucket = ((numOfApples/sizeOfBucket)+(numOfApples%sizeOfBucket==0? 0:1));

    System.out.println("필요한 바구니의 수 : " +numOfBucket);
}
```

아래는 변수 num의 값에 따라 "양수", "음수", "0"을 출력하는 코드이다. 삼항 연산자를 이용해서 (1)에 알맞은 코드를 넣으시오.
```java
public static void main(String[] args) {
    int num =0;
    System.out.println(num>=0? ((num>0)? "양수": "0"):"음수");
}
```

아래는 변수 num의 값 중에서 백의 자리 이하를 버리는 코드이다. 만일 변수 num의 값이 456이라면 400이 되고, 111이라면 100이 된다. (1)에 알맞은 코드를 넣으시오.
```java
public static void main(String[] args) {
    int num = 551;
    System.out.println(num/100*100);
}
```

아래는 변수 num의 값 중에서 일의 자리를 1로 바꾸는 코드이다. 만일 변수 num의 값이 333이라면 331이 되고, 777이라면 771이 된다. (1)에 알맞은 코드를 넣으시오.
```java
public static void main(String[] args) {
    int num = 777;
    System.out.println((num/10)*10 + 1));
}
```

아래는 변수 num의 값보다 크면서도 가장 가까운 10의 배수에서 변수 num의 값을 뺀 나머지를 구하는 코드이다. 예를 들어, 24의 크면서도 가장 가까운 10의 배수는 30이다. 19의 경우 20이고, 81의 경우 90이 된다. 30에서 24를 뺀 나머지는 6이기 때문에 변수 num의 값이 24라면 을 결과로 얻어야 한다. (1)에 알맞은 코드를 넣으시오.
```java
public static void main(String[] args) {
    int num = 22;
    System.out.println(num%10>0? ((num/10+1)*10)-num :((num/10)*10)-num);
}
```

다음은 문자형 변수 ch가 영문자(대문자 또는 소문자)이거나 숫자일 때만 변수 b값이 true가 되도록 하는 코드이다. (1)에 알맞은 코드를 넣으시오.
```java
public static void main(String[] args) {
    char ch = 'a';
    boolean b = (('a'<=ch && ch<='z') || ('A'<=ch && ch<='Z') || ('0'<=ch && ch<='9'));

    System.out.println(b);
}
```

다음은 대문자를 소문자로 변경하는 코드인데, 문자 ch에 저장된 문자가 대문자인 경우에만 소문자로 변경한다. 문자코드는 소문자가 대문자보다 32만큼 더 크다. 예를 들어 'A'의 코드는 65이고, 'a'의 코드는 97이다. (1) ~ (2)에 알맞은 코드를 넣으시오.
```java
public static void main(String[] args) {
    char ch = 'D';
    char lowerCase = ('A'<=ch&&ch<='Z') ? ((char)(ch+32)) : ch;
    System.out.println("ch: "+ch);		
    System.out.println("ch to lowerCase: "+lowerCase);
}
```

For문을 이용해서 1부터 100까지의 정수 중에서 3의 배수의 총합을 구하는 코드를 작성해보세요.
3의 배수의 합: 1683
```java
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
```


배열 arr에 담긴 모든 값을 더하는 프로그램을 완성하시오.
실행 결과 sum=150
```java

public static void main(String[] args) {
    int[] arr = {10, 20, 30, 40, 50};
    int sum = 0;

    for (int i=0; i<arr.length;i++) {
        sum += arr[i];
    }
    System.out.println("sum="+sum);
```


2차원 배열 arr에 담긴 모든 값의 총합과 평균을 구하는 프로그램을 완성하시오.
실행 결과
total = 325
average = 16.25
```java
int[][] arr = {
        {5, 5, 5, 5, 5},
        {10, 10, 10, 10, 10},
        {20, 20, 20, 20, 20},
        {30, 30, 30, 30, 30}
};

int total = 0;
float average = 0;

float count = 0;
for(int i=0; i<arr.length;i++) {
    for(int j=0; j<arr[i].length;j++) {
        System.out.println(arr[i][j]);
        total += arr[i][j];
        count++;
    }
}
average = total/count;

System.out.println("total="+total);
System.out.println("average="+average);
```


다음은 1과 9 사이의 중복되지 않은 숫자로 이루어진 3자리 숫자를 만들어내는 프로그램이다. (1) ~ (2)에 알맞은 코드를 넣어서 프로그램을 완성하시오.

실행 결과
486
```java
class main {
    public static void main(String[] args) {

        int[] ballArr = {1, 2, 3, 4, 5, 6, 7, 8, 9};
        int[] ball3 = new int[3];
        
        // 배열 ballArr의 임의의 요소를 골라서 위치를 바꾼다.
        for(int i=0; i< ballArr.length; i++){
            int j = (int) (Math.random() * ballArr.length);
            int tmp = 0;

            tmp = ballArr[i];
            ballArr[i] = ballArr[j];
            ballArr[j] = tmp;        
        }

        // 배열 ballArr의 앞에서 3개의 수를 배열 ball3로 복사한다.
        for(int i=0; i<3; i++){
            ball3[i] = ballArr[i];
        }

        for(int i=0; i<ball3.length; i++){
            System.out.print(ball3[i]);
        }

    }
    
}
```


다음은 거스름돈을 몇 개의 동전으로 지불할 수 있는지를 계산하는 문제이다. 변수 money의 금액을 동전으로 바꾸었을 때 각각 몇 개의 동전이 필요한지 계산해서 출력하라. 단, 가능한 한 적은 수의 동전으로 거슬러 주어야 한다.(1)에 알맞은 코드를 넣어서 프로그램을 완성하시오.

실행 결과
money=2680
500원: 5
100원: 1
50원: 1
10원: 3

```java
class main {
    public static void main(String[] args) {

        int[] coinUnit = {500, 100, 50, 10};

        int money = 2680;
        System.out.println("money="+money);

        for(int i=0; i<coinUnit.length; i++){
            System.out.println(coinUnit[i]+"원:"+money/coinUnit[i]);
            money = money%coinUnit[i];
        }
    }
}
```


커맨드라인으로부터 거슬러 줄 금액을 입력 받아 계산한다. 보유한 동전의 개수로 거스름돈을 지불할 수 없으면, '거스름돈이 부족합니다.'라고 출력하고 종료한다. 지불할 돈이 충분히 있으면, 거스름돈을 지불한 만큼 가진 돈에서 빼고 남은 동전의 개수를 화면에 출력한다. (1)에 알맞은 코드를 넣어서 프로그램을 완성하시오.
```java
class main {
public static void main(String[] args) {

    if(args.length!=1) {
        System.out.println("USAGE: java main 3120");
        System.exit(0);
    }

    // 문자열을 숫자로 변환한다. 입력한 값이 숫자가 아닐 경우 예외가 발생한다.
    int money = Integer.parseInt(args[0]);
    System.out.println("money="+money);

    int[] coinUnit = {500, 100, 50, 10};
    int[] coin = {5, 5, 5, 5};

    for(int i=0; i<coinUnit.length; i++) {
        int coinNum = 0;

        coinNum = money/coinUnit[i];
        if (coin[i] >= coinNum) {
            coin[i] -= coinNum;
        } else {
            coinNum = coin[i];
            coin[i] = 0;
        }
        money -= coinNum*coinUnit[i];
        System.out.println(coinUnit[i]+"원: "+coinNum);
    }

    if(money > 0) {
        System.out.println("거스름돈이 부족합니다.");
        System.exit(0); // 프로그램 종료
    }

    System.out.println("= 남은 동전의 개수 =");

    for(int i=0; i<coinUnit.length; i++) {
        System.out.println(coinUnit[i]+"원 : "+coin[i]);
    }
}}
```


다음은 배열 answer에 담긴 데이터를 읽고 각 숫자의 개수를 세어서 개수만큼
'*'을 찍어서 그래프를 그리는 프로그램이다.
```java
class main {
public static void main(String[] args) {
    int[] answer = {1, 4, 4, 3, 1, 4, 4, 2, 1, 3, 2};
    int[] counter = new int[4];

    // 각 해당하는 숫자를 증가 시키는 과정
    for (int i=0; i<answer.length; i++) {
        // i가 0이고, answer[0]이 1이라면 counter[0]이 1이 증가
        // i가 1이고, answer[1]이 4라면 counter[3]이 1증가
        // i가 2이고, answer[2]이 4라면 counter[3]이 1증가
        counter[answer[i]-1]++;
    }

    // *를 출력하기 위한 과정
    for (int i=0; i<counter.length; i++) {
        System.out.println(counter[i]);
        for (int j=0; j<counter[i]; j++) {
            System.out.print("*");
        }
        System.out.println();
    }
}}
```