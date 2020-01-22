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