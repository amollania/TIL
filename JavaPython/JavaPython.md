IF文を構成する
=====
2020-01-22

JAVA
----
```java
import java.util.Scanner;
class Main{
    public static void main(String[] args){
        Scanner scanner = new Scanner(System.in);
        int score = scanner.nextInt();

        if (score >= 90) {
            System.out.println("A Class");
        } else if (score >= 80) {
            System.out.println("B Class");
        } else if (score >= 70) {
            System.out.println("C Class");
        } else if (score >= 60) {
            System.out.println("D Class");
        } else {
            System.out.println("F Class");
        }
        scanner.close();
    }
}
```


Python
----
```python
score = int(input(''))
if score >= 90:
    print('A Class')
elif score >= 80:
    print('B Class')
elif score >= 70:
    print('C Class')
elif score >= 60:
    print('D Class')
else:
    print('F Class')
```



Switch文を構成する
=====
2020-01-22

JAVA
----
```java
import java.util.Random;
class Main{
    public static void main(String[] args){
        Random random = new Random();
        int num = random.nextInt(6) + 1;

        switch (num) {
        case 1:
            System.out.println("Appeared number 1");
            break;
        case 2:
            System.out.println("Appeared number 2");
            break;
        case 3:
            System.out.println("Appeared number 3");
            break;
        case 4:
            System.out.println("Appeared number 4");
            break;
        case 5:
            System.out.println("Appeared number 5");
            break;
        case 6:
            System.out.println("Appeared number 6");
            break;
        defalut:
            System.out.println("Appeared number 0");
            break;
        }
    }
}
```

Python
----
Python is not switch
```python
from random import *

num = randint(1,6)
if num is 1:
    print('Appeared number 1')
elif num is 2:
    print('Appeared number 2')
elif num is 3:
    print('Appeared number 3')
elif num is 4:
    print('Appeared number 4')
elif num is 5:
    print('Appeared number 5')
elif num is 6:
    print('Appeared number 6')
else:
    print('Appeared number 0')
```

JAVA
----
```java
import java.util.Random;
class Main{
    public static void main(String[] args){
        Scanner scanner = new Scanner(System.in);
        int grade = scanner.nextInt();

        switch(grade/10) {
        case 9:
            System.out.println("A");
            break;
        case 8:
            System.out.println("B");
            break;
        case 7:
            System.out.println("C");
            break;
        case 6:
            System.out.println("D");
            break;
        default:
            System.out.println("F");
            break;
        }
    }
}
```

Python
----
Python is not switch


For, While文を構成する
=====
2020-01-28
Make Multiplication Table use to 'FOR' and 'WHILE'

Java
----
```java
class Main{
    public static void main(String[] args){
        for(int m=2; m<=9; m++){
            System.out.println("***"+m+"st***");
            for(int n=1; n<=9; n++){
                System.out.println(m+"x"+n+"="+(m*n));
            }
        }
}
```
```java
class Main{
    public static void main(String[] args){
    int i = 2;
    while(i<=9) {
        System.out.println("***"+i+"st***");
        int j = 1;
        while(j<=9) {
            System.out.println(i+"x"+j+"="+(i*j));
            j++;
        }
        i++;
    }
}
```

Python
----
```python
for m in range(2, 10):
    print("***"+str(m)+"st***")
    for n in range(2, 10):
        print(str(m)+"x"+str(n)+"="+str((m*n)))
```
```python
i = 2
while i <= 9:
    print("***"+str(i)+"st***")
    j = 1
    while j <= 9:
        print(str(i)+"x"+str(j)+"="+str((i*j)))
        j+=1
    i+=1
```


while문 종료 break를 사용하여 Make 주사위
Java
----
```java
class Main{
    public static void main(String[] args){
        while(true) {
            int num = (int)(Math.random()*6)+1;
            System.out.println(num);
            if(num == 6) {
                break;
            }
        }
        System.out.println("Program exit");
    }
}
```

Python
----
```python
from random import *

while True:
    num = randint(1,8)
    print(num)
    if num == 6:
        break
```


Outter While TEXT exit
Java
----
```java
class Main{
    public static void main(String[] args){
        Qutter:for(char upper='A'; upper<='Z'; upper++) {
                for(char lower='a'; lower<='z'; lower++) {
                    System.out.println(upper + "-" + lower);
                    if(lower=='g') {
                        break Qutter;
                    }
                }
            }
        System.out.println("Program Exit");
    }
}
```


Outputs even numbers only from 1 to 10
Java
----
```java
class Main{
    public static void main(String[] args){
        for(int i=1; i<=10; i++) {
                if(i%2 != 0) {
                    continue;
                }
                System.out.println(i);
            }
    }
}
```

Python
----
```python
for i in range(1 ,11):
    if i%2 != 0:
        continue
    print(i)
```