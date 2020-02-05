Java Starting
============

真偽値
--------------
'''java
boolean bool = true; //ダブルクォーテーションはつけない
'''

比較演算子
---------------
'''java
6+2 ==5 // false
6+2 !=5 //true
6/3 ==2 //true
6/3 !=2 //false
'''

真偽値を出力
----------
'''java
System.out.println(true);   // true
System.out.println(false);  // false
System.out.println(6+2==5); // false
System.out.println(6+2!=5); // true
'''

比較演算子
---------
'''java
2>6     // false
8/4 <5  // true
4+2 >=6 // true
2*5 <=9 // false
'''


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


&演算子一つと二つの違い
----
演算子が＆一つの場合最初段落と後の段落をすべて実行してTrue, Falseを比較する。
演算子が＆＆二つの場合最初の段落がFalseの場合後の段落は実行しない。


論理演算子 if文
----
```java
int number = 12;
    
// numberが20より小さいとき、どちらでもないときの条件分岐を追加してください
if (number < 10) {
    System.out.println("10より小さい");
}
else if (number < 20) {
    System.out.println("10以上、20より小さい");
}
else {
    System.out.println("20以上");
}
```


論理演算子 switch文
----
```java
int number = 12;
    
// switch文を用いて、numberを3で割った余りで条件分岐をしてください
switch(number % 3){
    case 0:
        System.out.println("3で割り切れます");
        break;
    case 1:
        System.out.println("3で割ると1余ります");
        break;
    case 2:
        System.out.println("3で割ると2余ります");
        break;
    default:
        System.out.println("吉です")
}
```


繰り返し処理 while文
----
```java
int number = 1;

// while文を用いて、numberが0より大きい場合に繰り返す、繰り返し処理を作ってください
while (10 > number) {
    System.out.println(number);
    number ++ ;
}

//iが5の倍数のとき、繰り返し処理を終了してください
int i = 1;
    while (i < 10) {
      // iが5の倍数のとき、繰り返し処理を終了してください
      if (i % 5 == 0 ){
        break;
      }
      System.out.println(i);
      i++;
    }
```


繰り返し処理 for文
----
```java
// for文を用いて、繰り返し処理をつくってください
for(int i=1; i <= 20; i++){
    System.out.println(i+"回目のループです");
    if (i % 3 == 0){
        continue;
    }
}

```

配列を使ってみよう
----
```java
    // 変数namesに、配列を代入してください
    String names[] = {"サメ", "カゴメ", "ウサギ"};

    // インデックス番号が0の要素を出力してください
    System.out.println(names[0]);

    // インデックス番号が2の要素を出力してください
    System.out.println(names[2]);
```

향상된 for문
```java
public static void main(String[] args) {

    String res[] = {"d", "b", "c", "f"};
    int num[] = {1, 2, 3, 5};
    int sum = 0;

    for(String nums : res) {
        System.out.println(nums);
    }
}
```

