-- SQL Function
--
-- 숫자함수
-- ABS 매개변수로 숫자를 받아 절대값 반환
SELECT
    ABS(10),
    ABS(-10),
    ABS(-10.422)
FROM DUAL;

-- CEIL 매개변수로 n과 '같거나' 가장 큰 점수를 반환
SELECT
    CEIL(10.00),
    CEIL(10.01),
    CEIL(11.001)
FROM DUAL;

-- FLOOR매개 변수로 n 보다 작으면서 가장 큰 점수를 반환
SELECT
    FLOOR(10.2054),
    FLOOR(10.5230),
    FLOOR(10.5230)    
FROM DUAL;


--ROUND
--매개 변수 n을 소수점 기준 ( i +1)번째에서 반올림한 결과를 반환 디폴트 0
--n이 0일 때 i 입력된 숫자에 상과넚이 0을 반환하며,
--i가 음수이면 소수점을 기준으로 왼쪽 i 번째에서 반올림이 일어남
SELECT
    ROUND(10.154),
    ROUND(11.054),
    ROUND(18.054)
FROM DUAL;

SELECT
    ROUND(10.154, 1),
    ROUND(11.054, 2),
    ROUND(13.054, 3)
FROM DUAL;

SELECT
    ROUND(10.154, -1),
    ROUND(671.054, -2),
    ROUND(0, 3)
FROM DUAL;


-- TRUNC
-- 반올림을 하지 않고 n1을 소수점 기준 n2 자리에서 무조건 잘라낸다.(0으로 치환) 디폴트는 0
-- 양수일 때는 소수점 기준으로 오른쪽, 음수일 때는 소수점 기준으로 왼쪽 자리에서 잘라낸다.
SELECT
    TRUNC(115.155),
    TRUNC(115.155, 0),
    TRUNC(115.155, 1),
    TRUNC(115.155, 2),
    TRUNC(115.155, -1),
    TRUNC(115.155, -2)
FROM DUAL;


--POWER
--n2를 n1 제곱한 결과를 반환
--n1은 정수와 실수 모두 올 수 있지만,
--n2가 음수일 때 n1은 정수만 올 수 있다.
SELECT
    POWER(3, 2),
    POWER(3, 3),
    POWER(3, 3.001),
    POWER(4, 1)
FROM DUAL;
-- Result
--        EX1        EX2        EX3        EX4
-- ---------- ---------- ---------- ----------
--          9         27 27.0296788          4

SELECT
    POWER(5, 1),
    POWER(5, 2),
    POWER(7, 3)
FROM DUAL;

SELECT
    POWER(-3, 3) -- 정수만 올 수 있다
FROM DUAL;


--MOD(n1, n2) n2를 n1으로 나눈 나머지 값을 반환


-- 문자함수
--
-- CONCAT
-- || 연산자처럼 매개변수로 들어오는 두 문자를 붙여 반환
SELECT
    CONCAT('I Have to', ' Going'), -- 아래와 동일
    'I Have to' || ' Going'
FROM DUAL;


-- SUBSTR
SELECT
    SUBSTR('ABCD EFG', 1, 4)
FROM DUAL;

-- 
SELECT
    SUBSTR('ABCDEFG', 1, 4) AS A,
    SUBSTR('ABCDEFG', -4, 3) AS B,
    SUBSTR('ABCDEFG', -4, 1) AS C,
    SUBSTR('ABCDEFG', -1, 4) AS D,
    SUBSTR('ABCDEFG', 5) AS E
FROM DUAL;
-- Result
-- A    B   C D E  
-- ---- --- - - ---
-- ABCD DEF D G EFG


-- SUBSTARB
-- SUBSTAR와 동일하지만 byte 수로 자름
SELECT
    SUBSTRB('ABCDEFG', 1, 4), SUBSTRB('가나다라마바사', 1, 4)
FROM DUAL;

-- LOWER, UPPER
SELECT
    LOWER('You must be in HERE, NEVER SAY GOODBYE'),
    UPPER('You must be in hERE, naver say goodbye')
FROM DUAL;


-- LTRIM
--
SELECT
    LTRIM('ABCDEFGBBQ', 'ABC'),
    LTRIM('가나다라', '가'),
    RTRIM('ABCDEFGBBQ', 'ABC'),
    RTRIM('ABCDEFGBBQ', 'BBQ'),
    RTRIM('가나다라', '가'),
    RTRIM('가나다라', '라')
FROM DUAL;

SELECT
    LTRIM('가나다라마', '나'),
    RTRIM('가나다라마', '나')
FROM DUAL;

-- 공백제거
SELECT
    '    안녕하시요',
    TRIM('안녕 하 시 오'),
    TRIM('     안녕하시오')
FROM DUAL;


-- LPAD, RPAD
-- 숫자형 문자인 경우 문자 길이를 똑같이 맞춰야 하는 경우가 있음
-- 자릿수를 맞추어 숫자를 반환한다.
SELECT
    LPAD(152, 5, '0'),
    LPAD(15, 5, '0'),
    LPAD(1, 5, '0'),
    RPAD(152, 5, '0'),
    RPAD(15, 5, '0'),
    RPAD(1, 5, '0')
FROM DUAL;

-- example
CREATE TABLE TEST0_1 (
    phone_num VARCHAR2(30)
);

INSERT INTO TEST0_1 VALUES ('5100-8234');
INSERT INTO TEST0_1 VALUES ('4225-2564');
INSERT INTO TEST0_1 VALUES ('4528-5234');

SELECT LPAD(phone_num, 12, '(070)')
FROM TEST0_1;


-- 연산 대상이 문자이며 반환 값은 함수에 따라 문자나 숫자를 반환
SELECT
    REPLACE('나는 너를 모르는데, 너는 나를 어케 암', '나', '너')
FROM DUAL;

-- LTRIM, RTRIM, REPLACE
-- LTRIM은 좌측 공백 제거
-- RTRIM은 우측 공백 제거
-- REPLACE는 char1의 문자를 char2문자로 치환
SELECT
    LTRIM(' ABC DEF '),
    RTRIM(' ABC DEF '),
    REPLACE(' ABC DEF ', ' ', '')
FROM DUAL;

-- REPLACE, TRANSLATE
-- REPLACE는 단어를 치환
-- TRANSLATE는 글자 하나씩 치환
SELECT
    REPLACE('난 당신을 모르는데, 당신은 나를 아는가? 당근의 신', '당신', '난') AS rep,
    TRANSLATE('난 당신을 몰라, 난초같은 당신이 나를 알어? 당근의 신은 신 당분 섭취를 원한다.', '당신', '난') AS trn
FROM DUAL;


-- LENGTH, LENGTHB
-- LENGTH는 매개 변수로 들어온 문자열 개수를 반환
-- LENGTH는 매개 변수로 들어온 문자열 비트수를 반환
SELECT
    LENGTH('캐나다자연') AS len,
    LENGTHB('캐나다자연') AS len_byte
FROM DUAL;
-- Result
--        LEN   LEN_BYTE
-- ---------- ----------
--          5         15


-- INSTR(str, substr, pos, occur)
-- Str 문자열에서 substr과 일치하는 위치를 반환
-- pos는 시작 위치이며 디폴트는 1
-- occur은 몇번째 일치하는 지를 명시하며 디폴트는 1
SELECT
    INSTR('당신이 만약 외로울 때면 내가 만약 괴로울 때면', '만약') AS INSTR1,
    INSTR('당신이 만약 외로울 때면 내가 만약 괴로울 때면', '만약', 5) AS INSTR2,
    INSTR('당신이 만약 외로울 때면 내가 만약 괴로울 때면', '만약', 5, 2) AS INSTR3
FROM DUAL;
-- Result
--     INSTR1     INSTR2     INSTR3
-- ---------- ---------- ----------
--          5          5         18

-- 예시
SELECT
    INSTR('LEEAPGIL@GMAIL.COM', '@')
FROM DUAL;
-- Result
--INSTR('LEEAPGIL@GMAIL.COM','@')
---------------------------------
--                              9


-- 날짜 함수
--
-- SYSDATE, SYSTIMESTAMP
-- SYSDATE 년월일, 시분초
-- SYSTIMESTAMP 시분초 + 밀리세컨드까지
SELECT
    SYSDATE, SYSTIMESTAMP
FROM DUAL;

SELECT
    ADD_MONTHS(SYSDATE, 1), ADD_MONTHS(SYSDATE, -1)
FROM DUAL;

SELECT
    MONTHS_BETWEEN(SYSDATE, ADD_MONTHS(SYSDATE, 1)) mon1,
    MONTHS_BETWEEN(ADD_MONTHS(SYSDATE, 1), SYSDATE) mon1
FROM DUAL;

SELECT
    LAST_DAY(SYSDATE)
FROM DUAL;

SELECT
    SYSDATE, ROUND(SYSDATE,'month'), TRUNC(SYSDATE, 'month')
FROM DUAL;

SELECT
    NEXT_DAY(SYSDATE, '금요일')
FROM DUAL;


-- 변환함수 활용하기
SELECT
    TO_CHAR(123456789)
    TO_CHAR(123456789, '999,999,999'),
FROM DUAL;

--  변환함수에서 수가 초과 될 경우
SELECT
    TO_CHAR(123456789, '999,999')
FROM DUAL;
-- Result
-- TO_CHAR(
-- --------
-- ########

SELECT
    TO_CHAR(SYSDATE, 'YYYY-MM-DD')
FROM DUAL;

SELECT
    TO_CHAR(SYSDATE, 'YYMMDD')
FROM DUAL;

SELECT
    TO_CHAR(SYSDATE, 'YYMMDD HH:MI:SS')
FROM DUAL;

SELECT
    TO_DATE('20140101', 'YYYY-MM-DD')
FROM DUAL;

SELECT
    TO_DATE('20140101 13:44:55', 'YYYY-MM-DD HH24:MI:SS')
FROM DUAL;

SELECT
    round((SYSDATE - MEM_MEMORIALDAY)/365),
    SYSDATE - MEM_MEMORIALDAY
FROM MEMBER;