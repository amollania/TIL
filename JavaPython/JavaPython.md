Random객체를 이용한 IF문 구성하기
=====
2020-01-22

JAVA
----
```java
import java.util.Scanner;
class Main{
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

