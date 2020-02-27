
/*

 정규 표현식 
 정규표현식(正規表現式, Regular Expression)은 문자열을 처리하는 방법 중의 하나로 
 특정한 조건의 문자를 '검색'하거나 '치환'하는 과정을 매우 간편하게 처리 할 수 있도록 하는 수단이다.

*/

/*
 ORACLE 정규식 (Reqular Expression)
 Oracle 10g에서는 REGEXP_로 시작하는 함수를 지원합니다.

 강력한 Text 분석 도구로써 LIKE 의 한계를 극복
 유닉스의 정규식과 같음.
 Pattern-Matching-Rule

 함수와 표현식 패턴 (Regular Expression Pattern)을 이용하여 원하는 값을 얻는다.
 표현식 패턴에 사용하는 패턴을 만들기 위한 기호

 1.정규식 기본 Syntax

   * 정규식은 언제 사용 ?  ETL/전환/이행, Data Mining, Data Cleansing, 데이터 검증 ....
   * 중복, 공백, 데이터 검증, 패턴 체크 ...

   .(dot) 은 모든 문자와 match된다. 
*/

/* 정규식 함수 
 REGEXP_LIKE   -- like 연산과 유사하며 정규식 패턴을 검색
 REGEXP_REPLACE -- 정규식 패턴을 검색하여 대체 문자열로 변경
 REGEXP_INSTR   -- 정규식 패턴을 검색하여 위치를 반환
 REGEXP_SUBSTR  -- 정규식 패턴을 검색하여 부분 문자 추출
 REGEXP_COUNT   -- 정규식 패턴을 검색하여 발견된 횟수 반환

--------------------------------------------------------------------------------------------------------------------------------------

1.REGEXP_LIKE(srcstr, pattern [,match_option])

 LIKE 연산자와 유사하면, 표현식 패턴 (Regular Expression Pattern)을 수행하여, 일치하는 값을 반환

 srcstr : 소스 문자열, 검색하고자 하는 값.
 pattern : Regular Expression Operator를 통해 문자열에서 
          특정 문자를 보다 다양한 pattern으로 검색하는 것이 가능.
 match_option : match를 시도할 때의 옵션.
*/

--숫자가 아닌 문자열을 찾자.

 WITH V_TEST AS (
  SELECT 'ABCD1234' AS C1 FROM DUAL 
  UNION ALL
  SELECT '1234ABCD' AS C1 FROM DUAL 
  UNION ALL
  SELECT '12345678' AS C1 FROM DUAL
)
SELECT C1
  FROM V_TEST
 WHERE REGEXP_LIKE(C1, '[^[:digit:]]');
 
-- 제품 이름에 'SS' 다음 'P'나 'S'를 포함하는 문자열을 찾자.
WITH V_TEST AS (
  SELECT 'SSA' AS C1 FROM DUAL UNION ALL
  SELECT 'SSP' AS C1 FROM DUAL UNION ALL
  SELECT 'ASSS' AS C1 FROM DUAL
)
SELECT C1
  FROM V_TEST
-- WHERE REGEXP_LIKE(C1, 'SS[^PS]'); -- SS 다음 P나 S를 포함하는 것
 WHERE REGEXP_LIKE(C1, 'SS[^P]'); -- SS 다음 P 를 포함하지 않는 것 

SELECT  MEM_NAME
FROM   MEMBER
WHERE  REGEXP_LIKE (MEM_NAME, '이[쁜진]');



REGEXP_LIKE(emp_name, '^J')       ---> like 'J%'  
REGEXP_LIKE(emp_name, '^J.(N|M)') ---> J 로 시작하며, 세번째 문자가 M 또는 N 인 데이터를 찾는것
REGEXP_LIKE(emp_name, '^ab*')     ---> ab 로 시작하는것 검색
REGEXP_LIKE(emp_name, '^The')     ---> The 로 시작하는 문자열
REGEXP_LIKE(emp_name, 'ab*')      ---> a 다음에 b 가 0개 이상등 다수
REGEXP_LIKE(emp_name, 'notice')   ---> notice 가 들어있는 문자열
REGEXP_LIKE(zip, '[^[:digit:]]')
             zip  
             ab123
             123xy
             007ab
             abcxy

5 개의 숫자로 구성된 우편번호 패턴의 시작부분 반환   --->  [[:digit:]]{5}

 

where regexp_like(prof_no,'^[^LC || ^PW]')

     --> prof_no 중에서 LC로 시작 하거나 PW로 시작하는것을 제외한 것들을 출력


CREATE TABLE EX12_5 (
    TESTNO NUMBER
   ,TEXT VARCHAR2(100)
)

INSERT INTO EX12_5 VALUES ( 1, 'ABC123') ;
INSERT INTO EX12_5 VALUES ( 2, 'ABC 123') ;
INSERT INTO EX12_5 VALUES ( 3, 'abc 123') ;
INSERT INTO EX12_5 VALUES ( 4, 'a1b2c3') ;
INSERT INTO EX12_5 VALUES ( 5, 'aabbcc123') ;
INSERT INTO EX12_5 VALUES ( 6, '?/!@#$%^&*') ;
INSERT INTO EX12_5 VALUES ( 7, '|~*().') ;
INSERT INTO EX12_5 VALUES ( 8, '123123') ;
INSERT INTO EX12_5 VALUES ( 9, '123abc') ;
INSERT INTO EX12_5 VALUES ( 10, 'ABCD123'); 
INSERT INTO EX12_5 VALUES ( 11, 'ABCD1234'); 



SELECT * FROM EX12_5 WHERE REGEXP_LIKE(text, '[a-z][0-9]');
--[a-z], [0-9]는 소문자 전체와 0부터9까지의 숫자를 나타낸다.

SELECT * FROM EX12_5 WHERE REGEXP_LIKE(text, '[a-z] [0-9]'); 
--[a-z]와[0-9]사이에 공백이 있는 것이 보이시죠? 이렇게 공백도 구분값으로 사용할 수 있다.

SELECT * FROM EX12_5 WHERE REGEXP_LIKE(text, '[a-z]?[0-9]');
SELECT * FROM EX12_5 WHERE REGEXP_LIKE(text, '[a-z]*[0-9]');
--[a-z]?[0-9]와 [a-z]*[0-9] 이 뜻은 공백이 여러개 포함한다는 뜻 

SELECT * FROM EX12_5 WHERE REGEXP_LIKE(text, '*[0-9]');
--숫자를포함한 모든 문자를 select 합니다.

SELECT * FROM EX12_5 WHERE REGEXP_LIKE(text, '*[a-z]');
--소문자 영어 를 포함한 모든 문자를 select 합니다.

SELECT * FROM EX12_5 WHERE REGEXP_LIKE(text, '[A-Z]{3}');
--대문자 영어가 연속으로 3자리 있는 행을 출력합니다.

SELECT * FROM EX12_5 WHERE REGEXP_LIKE(text, '[0-9]{3}');
--숫자가 연속으로 3자리 있는 행을 출력합니다.

SELECT * FROM EX12_5 WHERE REGEXP_LIKE(text, '[A-Z][0-9]{3}');
--영어 대문자, 숫자 대분자 모두 3개 이상

SELECT * FROM EX12_5 WHERE REGEXP_LIKE(text, '^[0-9]');
--숫자로 시작되는 행

SELECT * FROM EX12_5 WHERE REGEXP_LIKE(text, '[a-z]$');
--소문자로끝나는행

SELECT * FROM EX12_5 WHERE REGEXP_LIKE(text, '^[^0-9]');
--숫자로시작하지 않는 행

SELECT * FROM EX12_5 WHERE REGEXP_LIKE(text, 'A|1');
--‘A’나 1을 포함하고 있는행

SELECT * FROM EX12_5 WHERE REGEXP_LIKE(text, '\?');
--'?' 문자가 들어가는행


 /*
2.REGEXP_SUBSTR(srcstr, pattern, [,position[,occurrence[,match_option]]])


SUBSTR 함수의 기능을 확장함. 주어진 문자열을 대상으로 정규 표현식 패턴을 수행하여, 일치하는 하위 문자열을 반환한다.

문법 : REGEXP_SUBSTR(srcstr, pattern, [,position[,occurrence[,match_option]]])

srcstr : 소스 문자열
position : Oracle이 문자열에서 특정 문자를 어디에서 찾아야 하는지 위치를 나타냄. 기본으로 1로 설정되어 있으므로, 문자열의 처음부터 검색을 시작.
occurrence : 검색하고자 하는 문자열에서 특정 문자의 발생 횟수. 기본으로 1로 설정되어 있으며, 이는 Oracle이 문자열에서 첫번째 발생 pattern을 찾는다는 의미.
match_option : match를 시도할 때의 옵션
*/


SELECT
    REGEXP_SUBSTR(MEM_MAIL, '[^@]+', 1, 1) AS "ID",
    REGEXP_SUBSTR(MEM_MAIL, '[^@]+', 1, 2) AS "MailAddr",
    MEM_MAIL
FROM MEMBER;

SELECT MEM_NAME, MEM_MAIL, REGEXP_SUBSTR(MEM_MAIL, '[^@]+') AS SUBEMAIL
FROM MEMBER;

/*
사용방법
REGEXP_SUBSTR(대상 문자, 패턴, 시작 위치(최소값1),매칭순번)
REGEXP_SUBSTR('C-01-02','[^-]+',1,1)
 결과 = C
REGEXP_SUBSTR('C-01-02','[^-]+',1,2)
 결과 = 01
REGEXP_SUBSTR('C-01-02','[^-]+',1,3)
 결과 = 02

  대괄호 [] 안의 ^ 는  NOT의 의미를 나타냄

^ 문자가 대괄호 밖에서 사용되면 문자열의 시작을 의미함
+ 는 문자패턴이 1개이상 연결될 때를 나타냄, 위 예제에서 01,02등 2개이상 나타내기 위함
+ 시작위치 & 매칭 순번

앞의 대상문자와 패턴에 의해 나누어진 문자들을 몇번째 INDEX에서 시작하여 몇번째의 나누어진 문자를 가져올것인지에 대한 PARAMETER
위 예제에서 (1,2)는 C // 01 // 02 의 나누어진 문자중 1번째 INDEX부터 시작하는 2번째 문자를 가져오라는 뜻

*/

SELECT REGEXP_SUBSTR('아빠_엄마_형님_동생', '[^_]+', 1,3) from dual ;


/**
3.REGEXP_REPLACE

주어진 문자열을 대상으로 정규 표현식 패턴을 조사하여, 다른 문자로 대체한다.
문법 : REGEXP_REPLACE(srcstr, pattern [,replacestr[,position[,occurrence[,match_option]]]])
replacestr : 대체하고자 하는 문자열을 나타낸다. 
*/

WITH V_TEST AS (
  SELECT '7907051234567' SSN FROM dual
)
SELECT REGEXP_REPLACE(SSN, '[0-9]', '*', 7) AS "SSN"
FROM V_TEST;

--둘 이상의 공백 문자를 하나로 대체하여 가독성을 높이자.
SELECT REGEXP_REPLACE('Oracle is the   Information Company', '( ){2,}', ' ') AS "Result"
FROM dual;

/*
4.REGEXP_INSTR

정규 표현을 만족하는 부분의 위치를 반환한다.

- 문법 -
REGEXP_INSTR(srcstr, pattern [,position[,occurrence[,returnparam[,match_option]]]])

position : 검색 시작 위치
occurrence : 발생 횟수.
returnparam : 반환 옵션.
match_option : match를 시도할 때의 옵션.
*/

SELECT REGEXP_INSTR('Regular Expression', 'a') AS "REGEXP_INSTR"
 FROM dual;


/*
 한정자 : 앞의 문자(그룹, 식) 제한  
   * : 0개 이상 
   + : 1개 이상 
   ? : 0,1 개 
   {n} : n번 
   {n,} : n번 이상 
   {n,m} : n번 이상  m번이하 

  한정자 : Greedy : 기본적을 패턴에 일치하는 최대를 찾죠 , 이것을 최소한으로 찾도록 
  한정자  다음에 ? 사용시 (Non Greedy )

   *? , +?  , {n,}? 
  
  앵커 
   ^  : 시작할때  , $ : 끝날때  , \b : 단어의 경계   
  
  문자 
   . : 임의 한문자(\n 제외)  
   [abc]
   [a-c]
   [^a-c]

   펄표기법 
    \w , \W = [a-zA-Z0-9_] 
    \d , \D = [0-9]
    \s , \S = [ \t\r\f\v]   
   
   | : 또는 
   () : 그룹, 처음부터 1..9개 까지     
   역참조  
   <td>  aaaaaa   </td>
   <li>  bbbb     </aaa>
   <tr> ....   </tr>
   -- be 문자가 있는데 .... be 전에 문자하고 , be 다음의 문자하고 같은것 찾기 ???
   abea  abec    abex  cbex cbec  zbea  zbez     
*/

