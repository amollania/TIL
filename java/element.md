Java Starting
============

真偽値
--------------
```java
boolean bool = true; //ダブルクォーテーションはつけない
```

比較演算子
---------------
```java
6+2 ==5 // false
6+2 !=5 //true
6/3 ==2 //true
6/3 !=2 //false
```

真偽値を出力
----------
```java
System.out.println(true);   // true
System.out.println(false);  // false
System.out.println(6+2==5); // false
System.out.println(6+2!=5); // true
```


&연산자 1개와 2개의 차이
----
연산자가 &일 경우 첫 문단과 뒷 문단을 모두 실행 후에 True, False를 비교해봄.
연산자가 &&일 경우 첫 문단이 False인 경우 뒷 문단은 실행을 하지 않음.