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

