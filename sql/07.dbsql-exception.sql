/*
예외처리
*/

/*
PL/SQL 코드 작성할 때 발생할 수 있는 오류에는크게 두가지
문법오류
실행오류
*/
EXCEPTION
    WHEN 에외명1 THEN 예외처리 구문1
    WHEN 예외명2 THEN 예외처리 구문2
    ...
    WHEN OTHERS THEN 예외처리 구문N;


-- divisor is equal to zero 오류
DECLARE
    vi_num NUMBER := 0;
BEGIN
    vi_num := 10/ 0;
    DBMS_OUTPUT.PUT_LINE('SUCCESS1');
END;

-- 예외처리
DECLARE
    vi_num NUMBER := 0;
BEGIN
    vi_num := 10 / 0;
    DBMS_OUTPUT.PUT_LINE('SUCCESS1');
EXCEPTION WHEN OTHERS THEN -- 예외처리 구문처리로 오류가 발생하지 않음
    DBMS_OUTPUT.PUT_LINE('오류가 발생했습니다.');
END;

/*
WHEN OTHERS절은 제일 마지막에 한번만 기술이 가능하다.
PL/SQL문장에서 예외가 발생했을때만 EXCEPTION절이 수행된다.
*/



/*
SQLCODE, SQLERRM을 이용한 예외정보 참조
SQLCODE : 실행부에서 발생한 예외에 해당하는 코드를 반환
SQLERRM : 발생한 예외 메세지를 반환
*/

CREATE OR REPLACE PROCEDURE ch10_exception_proc
IS
    vi_num NUMBER := 0;
BEGIN
    vi_num := 10/0;
    DBMS_OUTPUT.PUT_LINE('SUCCESS !!');
EXCEPTION WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('오류가 발생했다.');
    DBMS_OUTPUT.PUT_LINE('SQL ERROR CODE: '|| SQLCODE); -- SQL ERROR CODE: -1476
    DBMS_OUTPUT.PUT_LINE('오류가 발생했다.' || SQLERRM); -- 오류가 발생했습니다.ORA-01476: divisor is equal to zero
    DBMS_OUTPUT.PUT_LINE(SQLERRM(SQLCODE)); -- ORA-01476: divisor is equal to zero
    DBMS_OUTPUT.PUT_LINE(DBMS_UTILITY.FORMAT_ERROR_BACKTRACE); -- ORA-06512: at "JAVA.CH10_EXCEPTION_PROC", line 5
END;
-- 실행 구문
EXEC ch10_exception_proc;



CREATE OR REPLACE PROCEDURE ch11_exception_proc
IS
    vi_num NUMBER := 0;
    vi_date date;
BEGIN
    -- vi_num := 10/0;
    DBMS_OUTPUT.PUT_LINE('SUCCESS');
    vi_date := to_date(12.349999999999999999999999);
    
EXCEPTION WHEN ZERO_DIVIDE THEN
        DBMS_OUTPUT.PUT_LINE('오류 발생했다');
        DBMS_OUTPUT.PUT_LINE('SQL ERROR MESSAGE -1- : ' || SQLERRM);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('오류2 발생했다');
        DBMS_OUTPUT.PUT_LINE('SQL ERROR MESSAGE -2- : ' || SQLERRM);
END;
-- 실행 구문
EXEC ch11_exception_proc;



/*
사용자 정의 예외처리
개발자가 직접 예외를 정의하는 방법
*/
CREATE OR REPLACE PROCEDURE ch10_ins_emp_proc ( 
    p_emp_name       employees.emp_name%TYPE,
    p_department_id  departments.department_id%TYPE )
IS
    vn_employee_id  employees.employee_id%TYPE;
    vd_curr_date    DATE := SYSDATE;
    vn_cnt          NUMBER := 0;
    ex_invalid_depid EXCEPTION; -- 잘못된 부서번호일 경우 예외 정의
BEGIN
        -- 부서테이블에서 해당 부서번호 존재유무 체크
        SELECT COUNT(*)
        INTO vn_cnt
        FROM departments
        WHERE department_id = p_department_id;
        IF vn_cnt = 0 THEN
        RAISE ex_invalid_depid; -- 사용자 정의 예외 발생
        END IF;
        -- employee_id의 max 값에 +1
        SELECT MAX(employee_id) + 1
        INTO vn_employee_id
        FROM employees;
        -- 사용자예외처리 예제이므로 사원 테이블에 최소한 데이터만 입력함
        INSERT INTO employees ( employee_id, emp_name, hire_date, department_id )
            VALUES ( vn_employee_id, p_emp_name, vd_curr_date, p_department_id );            
    COMMIT;              
                
EXCEPTION WHEN ex_invalid_depid THEN -- 사용자 정의 예외 처리
                DBMS_OUTPUT.PUT_LINE('해당 부서번호가 없습니다');
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('오류다 오류' || SQLERRM);              
END;
-- 프로시져 실행
EXEC ch10_ins_emp_proc ('홍길동', 999);



/*
date 형식을 체크하는 함수 생성
*/
CREATE OR REPLACE FUNCTION fn_is_date(
    p_str_date VARCHAR2,
    p_format VARCHAR2 DEFAULT 'YYYYMMDD'
)
RETURN NUMBER
IS /* 데이터가 DATE 형인지 검사하는 함수이다. 1이 나오면 DATE 출력 */
    v_date DATE;
BEGIN
    v_date := TO_DATE(p_str_date, p_format);
    RETURN 1;
EXCEPTION
    WHEN OTHERS THEN RETURN 0
END;

CREATE OR REPLACE PROCEDURE dday_test_proc(p_date VARCHAR2)
IS
    vn_date := 0;



/*
   PRAGMA 컴파일러가 실행되기 전에 처리하는 전처리기 역할 

   PRAGMA EXCEPTION_INIT(예외명, 예외번호)
   사용자 정의 예외 처리를 할 때 사용되는것으로 
   특정 예외번호를 명시해서 컴파일러에 이 예외를 사용한다는 것을 알리는 역할 
   (해당 예외번호에 해당되는 시스템 에러시 발생) 
*/
--1
CREATE OR REPLACE PROCEDURE ch10_ins_emp_proc ( 
                  p_emp_name       employees.emp_name%TYPE,
                  p_department_id  departments.department_id%TYPE,
                  p_hire_month  VARCHAR2  )
IS
   vn_employee_id  employees.employee_id%TYPE;
   vd_curr_date    DATE := SYSDATE;
   vn_cnt          NUMBER := 0;
   
   ex_invalid_depid EXCEPTION; -- 잘못된 부서번호일 경우 예외 정의
   ex_invalid_month EXCEPTION; -- 잘못된 입사월인 경우 예외 정의
   PRAGMA EXCEPTION_INIT ( ex_invalid_month, -1843); -- 예외명과 예외코드 연결
BEGIN
	
	 -- 부서테이블에서 해당 부서번호 존재유무 체크
	 SELECT COUNT(*)
	   INTO vn_cnt
	   FROM departments
	  WHERE department_id = p_department_id;
	  
	 IF vn_cnt = 0 THEN
	    RAISE ex_invalid_depid; -- 사용자 정의 예외 발생
	 END IF;
	 
	 -- 입사월 체크 (1~12월 범위를 벗어났는지 체크)
	 IF SUBSTR(p_hire_month, 5, 2) NOT BETWEEN '01' AND '12' THEN
	    RAISE ex_invalid_month; -- 사용자 정의 예외 발생
	 
	 END IF;
	 
	 -- employee_id의 max 값에 +1
	 SELECT MAX(employee_id) + 1
	   INTO vn_employee_id
	   FROM employees;
	 
	 -- 사용자예외처리 예제이므로 사원 테이블에 최소한 데이터만 입력함
	 INSERT INTO employees ( employee_id, emp_name, hire_date, department_id )
              VALUES ( vn_employee_id, p_emp_name, TO_DATE(p_hire_month || '01'), p_department_id );    
   COMMIT;              
EXCEPTION WHEN ex_invalid_depid THEN -- 사용자 정의 예외 처리
               DBMS_OUTPUT.PUT_LINE('해당 부서번호가 없습니다');
          WHEN ex_invalid_month THEN -- 입사월 사용자 정의 예외 처리
               DBMS_OUTPUT.PUT_LINE(SQLCODE);
               DBMS_OUTPUT.PUT_LINE(SQLERRM);
               DBMS_OUTPUT.PUT_LINE('1~12월 범위를 벗어난 월입니다');               
          WHEN OTHERS THEN
               DBMS_OUTPUT.PUT_LINE(SQLERRM);              
END;

EXEC ch10_ins_emp_proc ('홍길동', 110, '201314');



/*
  RAISE 사용자 정의 예외 발생시 
  오라클에서 정의 되어 있는 예외를 발생 시킬수 있다. 
*/
--2
CREATE OR REPLACE PROCEDURE ch10_raise_test_proc ( p_num NUMBER)
IS
/* 이 구문에 적지 않고 오류를 매핑 */
BEGIN
	IF p_num <= 0 THEN
	   RAISE INVALID_NUMBER;
  END IF;
  
  DBMS_OUTPUT.PUT_LINE(p_num);
  
EXCEPTION WHEN INVALID_NUMBER THEN
               DBMS_OUTPUT.PUT_LINE('양수만 입력받을 수 있습니다');
          WHEN OTHERS THEN
               DBMS_OUTPUT.PUT_LINE(SQLERRM);
	
END;

EXEC ch10_raise_test_proc (-10);               



/*
  RAISE_APPLICATOIN_ERROR(예외코드, 예외 메세지);
  예외 코드와 메세지를 사용자가 직접 정의  -20000 ~ -20999 번까지 만 사용가능 
   왜냐면 오라클에서 이미 사용하고 있는 예외들이 위 번호 구간은 사용하지 않고 있기 때문에)
*/
--3
CREATE OR REPLACE PROCEDURE ch10_raise_test_proc ( p_num NUMBER)
IS
BEGIN
	IF p_num <= 0 THEN
	   RAISE_APPLICATION_ERROR (-20000, '양수만 입력받을 수 있단 말입니다!');
	END IF;
    DBMS_OUTPUT.PUT_LINE(p_num);
    EXCEPTION WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;

EXEC ch10_raise_test_proc (-10);
-- -20000
-- -20000 양수만 입력받을 수 있단 말입니다!



-- 4
----------------------------------------------------------------------------------
-- 로그 테이블 
CREATE TABLE error_log (
             error_seq     NUMBER,        -- 에러 시퀀스
             prog_name     VARCHAR2(80),  -- 프로그램명
             error_code    NUMBER,        -- 에러코드
             error_message VARCHAR2(300), -- 에러 메시지
             error_line    VARCHAR2(100), -- 에러 라인
             error_date    DATE DEFAULT SYSDATE -- 에러발생일자
             );

-- 시퀀스 생성
CREATE SEQUENCE error_seq
INCREMENT BY 1
START WITH 1
MINVALUE 1
MAXVALUE 999999
NOCYCLE
NOCACHE;

-- log 프로시져 생성
CREATE OR REPLACE PROCEDURE error_log_proc (
                  p_prog_name      error_log.prog_name%TYPE,
                  p_error_code     error_log.error_code%TYPE,
                  p_error_messgge  error_log.error_message%TYPE,
                  p_error_line     error_log.error_line%TYPE  )
IS
BEGIN
	INSERT INTO error_log (error_seq, prog_name, error_code, error_message, error_line)
  -- NEXTVAL 해당 시퀀스 값을 증가 시킨다.
	VALUES ( error_seq.NEXTVAL, p_prog_name, p_error_code, p_error_messgge, p_error_line );
	COMMIT;
END;

-- 5
-- 처리 프로시져 생성 
CREATE OR REPLACE PROCEDURE ch10_ins_emp2_proc ( 
                  p_emp_name       employees.emp_name%TYPE,
                  p_department_id  departments.department_id%TYPE,
                  p_hire_month     VARCHAR2 )
IS
   vn_employee_id  employees.employee_id%TYPE;
   vd_curr_date    DATE := SYSDATE;
   vn_cnt          NUMBER := 0;
   
   ex_invalid_depid EXCEPTION; -- 잘못된 부서번호일 경우 예외 정의
   PRAGMA EXCEPTION_INIT ( ex_invalid_depid, -20001); -- 예외명과 예외코드 연결

   ex_invalid_month EXCEPTION; -- 잘못된 입사월인 경우 예외 정의
   PRAGMA EXCEPTION_INIT ( ex_invalid_month, -1843); -- 예외명과 예외코드 연결
   
   v_err_code error_log.error_code%TYPE;
   v_err_msg  error_log.error_message%TYPE;
   v_err_line error_log.error_line%TYPE;
BEGIN
    -- 부서테이블에서 해당 부서번호 존재유무 체크
    SELECT COUNT(*)
    INTO vn_cnt
    FROM departments
    WHERE department_id = p_department_id;
	  
IF vn_cnt = 0 THEN
    RAISE ex_invalid_depid; -- 사용자 정의 예외 발생
END IF;

-- 입사월 체크 (1~12월 범위를 벗어났는지 체크)
IF SUBSTR(p_hire_month, 5, 2) NOT BETWEEN '01' AND '12' THEN
    RAISE ex_invalid_month; -- 사용자 정의 예외 발생
END IF;

 -- employee_id의 max 값에 +1
    SELECT MAX(employee_id) + 1
    INTO vn_employee_id
    FROM employees;

-- 사용자예외처리 예제이므로 사원 테이블에 최소한 데이터만 입력함
INSERT INTO employees ( employee_id, emp_name, hire_date, department_id )
            VALUES ( vn_employee_id, p_emp_name, TO_DATE(p_hire_month || '01'), p_department_id );              
COMMIT;

EXCEPTION WHEN ex_invalid_depid THEN -- 사용자 정의 예외 처리
               v_err_code := SQLCODE;
               v_err_msg  := SQLERRM;
               v_err_line := DBMS_UTILITY.FORMAT_ERROR_BACKTRACE;
               ROLLBACK;
               error_log_proc ( 'ch10_ins_emp2_proc', v_err_code, v_err_msg, v_err_line); 
          WHEN ex_invalid_month THEN -- 입사월 사용자 정의 예외 처리
               v_err_code := SQLCODE;
               v_err_msg  := SQLERRM;
               v_err_line := DBMS_UTILITY.FORMAT_ERROR_BACKTRACE;
               ROLLBACK;
               error_log_proc ( 'ch10_ins_emp2_proc', v_err_code, v_err_msg, v_err_line); 
          WHEN OTHERS THEN
               v_err_code := SQLCODE;
               v_err_msg  := SQLERRM;
               v_err_line := DBMS_UTILITY.FORMAT_ERROR_BACKTRACE;
               ROLLBACK;  
               error_log_proc ( 'ch10_ins_emp2_proc', v_err_code, v_err_msg, v_err_line);        	
END;


-- 잘못된 부서
EXEC ch10_ins_emp2_proc ('HONG', 1000, '201401');
-- 잘못된 월
EXEC ch10_ins_emp2_proc ('HONG', 100, '201413'); 


SELECT *
  FROM  error_log ;


  
/*
  트랜잭션 Transaction '거래'
  은행에서 입금과 출금을 하는 그 거래를 말하는 단어로 
  프로그래밍 언어나 오라클에서 말하는 트랜잭션도 이 개념에서 차용한것 

  A 은행 (출금 하여 송금) -> B 은행 
  송금 중에 오류가 발생 
  A 은행 계좌에서 돈이 빠져나가고 
  B 은행 계좌에 입금되지 않음.

  오류를 파악하여 A계좌 출금 취소 or 출금된 만큼 B 은행으로 다시 송금
  but 어떤 오류인지 파악하여 처리하기에는 많은 문제점이 있다. 

  그래서 나온 해결책 -> 거래가 성공적으로 모두 끝난 후에야 이를 완전한 거래로 승인, 
                      거래 도중 뭔가 오류가 발생했을 때는 이 거래를 처음부터 없었던 거래로 되돌린다. 

  거래의 안정성을 확보하는 방법이 바로 트랜잭션
*/

-- COMMIT 과 ROLLBACK
--6
CREATE TABLE ch10_sales (
       sales_month   VARCHAR2(8),
       country_name  VARCHAR2(40),
       prod_category VARCHAR2(50),
       channel_desc  VARCHAR2(20),
       sales_amt     NUMBER );
    
CREATE OR REPLACE PROCEDURE iud_ch10_sales_proc 
            ( p_sales_month ch10_sales.sales_month%TYPE )
IS

BEGIN
	INSERT INTO ch10_sales (sales_month, country_name, prod_category, channel_desc, sales_amt)
	SELECT A.SALES_MONTH, 
       C.COUNTRY_NAME, 
       D.PROD_CATEGORY,
       E.CHANNEL_DESC,
       SUM(A.AMOUNT_SOLD)
  FROM SALES A, CUSTOMERS B, COUNTRIES C, PRODUCTS D, CHANNELS E
 WHERE A.SALES_MONTH = p_sales_month
   AND A.CUST_ID = B.CUST_ID
   AND B.COUNTRY_ID = C.COUNTRY_ID
   AND A.PROD_ID = D.PROD_ID
   AND A.CHANNEL_ID = E.CHANNEL_ID
 GROUP BY A.SALES_MONTH, 
         C.COUNTRY_NAME, 
       D.PROD_CATEGORY,
       E.CHANNEL_DESC;
COMMIT;
END;

-- 프로시저 실행
EXEC iud_ch10_sales_proc ( '199901');

-- sqlplus 접속하여 조회 
-- 건수가 0
SELECT COUNT(*)
FROM ch10_sales ;



--7
CREATE OR REPLACE PROCEDURE iud_ch10_sales_proc 
            ( p_sales_month ch10_sales.sales_month%TYPE )
IS

BEGIN
	INSERT INTO ch10_sales (sales_month, country_name, prod_category, channel_desc, sales_amt)	   
	SELECT A.SALES_MONTH, 
       C.COUNTRY_NAME, 
       D.PROD_CATEGORY,
       E.CHANNEL_DESC,
       SUM(A.AMOUNT_SOLD)
  FROM SALES A, CUSTOMERS B, COUNTRIES C, PRODUCTS D, CHANNELS E
 WHERE A.SALES_MONTH = p_sales_month
   AND A.CUST_ID = B.CUST_ID
   AND B.COUNTRY_ID = C.COUNTRY_ID
   AND A.PROD_ID = D.PROD_ID
   AND A.CHANNEL_ID = E.CHANNEL_ID
 GROUP BY A.SALES_MONTH, 
         C.COUNTRY_NAME, 
       D.PROD_CATEGORY,
       E.CHANNEL_DESC;
       
 COMMIT;
 --ROLLBACK;
END;

TRUNCATE TABLE ch10_sales;

EXEC iud_ch10_sales_proc ( '199901');

SELECT COUNT(*)
FROM ch10_sales ;

TRUNCATE TABLE ch10_sales;


--8
ALTER TABLE ch10_sales ADD CONSTRAINTS pk_ch10_sales PRIMARY KEY (sales_month, country_name, prod_category, channel_desc);
-- 제약조건 설정 후 테스트 

CREATE OR REPLACE PROCEDURE iud_ch10_sales_proc 
            ( p_sales_month ch10_sales.sales_month%TYPE )
IS

BEGIN
	
	INSERT INTO ch10_sales (sales_month, country_name, prod_category, channel_desc, sales_amt)	   
	SELECT A.SALES_MONTH, 
       C.COUNTRY_NAME, 
       D.PROD_CATEGORY,
       E.CHANNEL_DESC,
       SUM(A.AMOUNT_SOLD)
  FROM SALES A, CUSTOMERS B, COUNTRIES C, PRODUCTS D, CHANNELS E
 WHERE A.SALES_MONTH = p_sales_month
   AND A.CUST_ID = B.CUST_ID
   AND B.COUNTRY_ID = C.COUNTRY_ID
   AND A.PROD_ID = D.PROD_ID
   AND A.CHANNEL_ID = E.CHANNEL_ID
 GROUP BY A.SALES_MONTH, 
         C.COUNTRY_NAME, 
       D.PROD_CATEGORY,
       E.CHANNEL_DESC;

 -- 다 처리되고 오류가 없을시 커밋 
 COMMIT;

EXCEPTION WHEN OTHERS THEN
               DBMS_OUTPUT.PUT_LINE(SQLERRM);
               ROLLBACK;
END;   


EXEC iud_ch10_sales_proc ( '199901');

SELECT COUNT(*)
FROM ch10_sales ;



--9
CREATE TABLE ch10_country_month_sales (
               sales_month   VARCHAR2(8),
               country_name  VARCHAR2(40),
               sales_amt     NUMBER,
               PRIMARY KEY (sales_month, country_name) );
              
CREATE OR REPLACE PROCEDURE iud_ch10_sales_proc 
            ( p_sales_month  ch10_sales.sales_month%TYPE, 
              p_country_name ch10_sales.country_name%TYPE )
IS
BEGIN
--기존 데이터 삭제
    DELETE ch10_sales
	  WHERE sales_month  = p_sales_month
	  AND country_name = p_country_name;
  
-- 신규로 월, 국가를 매개변수로 받아 INSERT 
-- DELETE를 수행하므로 PRIMARY KEY 중복이 발생치 않음
INSERT INTO ch10_sales (sales_month, country_name, prod_category, channel_desc, sales_amt)	   
SELECT A.SALES_MONTH, 
       C.COUNTRY_NAME, 
       D.PROD_CATEGORY,
       E.CHANNEL_DESC,
       SUM(A.AMOUNT_SOLD)
FROM SALES A, CUSTOMERS B, COUNTRIES C, PRODUCTS D, CHANNELS E
WHERE A.SALES_MONTH  = p_sales_month
   AND C.COUNTRY_NAME = p_country_name
   AND A.CUST_ID = B.CUST_ID
   AND B.COUNTRY_ID = C.COUNTRY_ID
   AND A.PROD_ID = D.PROD_ID
   AND A.CHANNEL_ID = E.CHANNEL_ID
GROUP BY A.SALES_MONTH, 
       C.COUNTRY_NAME, 
       D.PROD_CATEGORY,
       E.CHANNEL_DESC;
       
-- SAVEPOINT 확인을 위한 UPDATE

-- 현재시간에서 초를 가져와 숫자로 변환한 후 * 10 (매번 초는 달라지므로 성공적으로 실행 시 이 값은 매번 달라짐)
UPDATE ch10_sales
    SET sales_amt = 10 * to_number(to_char(sysdate, 'ss'))
  WHERE sales_month  = p_sales_month
	   AND country_name = p_country_name;
	   
-- SAVEPOINT 지정      
SAVEPOINT mysavepoint;      
 
-- ch10_country_month_sales 테이블에 INSERT
-- 중복 입력 시 PRIMARY KEY 중복됨
INSERT INTO ch10_country_month_sales 
       SELECT sales_month, country_name, SUM(sales_amt)
         FROM ch10_sales
        WHERE sales_month  = p_sales_month
	        AND country_name = p_country_name
	      GROUP BY sales_month, country_name;         
COMMIT;

EXCEPTION WHEN OTHERS THEN
               DBMS_OUTPUT.PUT_LINE(SQLERRM);
               ROLLBACK TO mysavepoint; -- SAVEPOINT 까지만 ROLLBACK
               COMMIT; -- SAVEPOINT 이전까지는 COMMIT
END;

TRUNCATE TABLE ch10_sales;

EXEC iud_ch10_sales_proc ( '199901', 'Italy');

SELECT DISTINCT sales_amt
FROM ch10_sales;


EXEC iud_ch10_sales_proc ( '199901', 'Italy');

SELECT DISTINCT sales_amt
FROM ch10_sales;


--10
CREATE TABLE EX8_1 (
      EX_NO NUMBER
     ,EX_NM VARCHAR2(1000)
);

CREATE OR REPLACE PROCEDURE ex_8_1_proc (flag varchar2)
IS
	  point1 EXCEPTION;
  	point2 EXCEPTION;
    vn_num number;
BEGIN
    INSERT INTO EX8_1 VALUES (1, 'POINT BEFORE'); 
    INSERT INTO EX8_1 VALUES (2, 'POINT1');
    SAVEPOINT mysavepoint1;

    INSERT INTO EX8_1 VALUES (3, 'POINT1');
    INSERT INTO EX8_1 VALUES (4, 'POINT2');
    SAVEPOINT mysavepoint2;
    
    INSERT INTO EX8_1 VALUES (5, 'POINT2');
    
    INSERT INTO EX8_1 VALUES (6, 'ELSE');
    INSERT INTO EX8_1 VALUES (7, 'ELSE');
  	INSERT INTO EX8_1 VALUES (8, 'ELSE');
    INSERT INTO EX8_1 VALUES (9, 'ELSE');

    IF flag = '1' then
	      RAISE point1;
	  ELSIF  flag = '2' then
         RAISE point2;    
    ELSE 
        vn_num := 10 / 0;     
    END IF;

EXCEPTION WHEN point1 THEN 
            DBMS_OUTPUT.PUT_LINE('POINT1');
            ROLLBACK TO mysavepoint1;
            COMMIT;
          WHEN point2 THEN 
            DBMS_OUTPUT.PUT_LINE('POINT2');
    	    ROLLBACK TO mysavepoint2;
            COMMIT;
          WHEN OTHERS THEN 
            DBMS_OUTPUT.PUT_LINE('ORDERS');
      	    ROLLBACK;
END;

EXEC ex_8_1_proc(3);

SELECT *
FROM EX8_1;
TRUNCATE TABLE EX8_1;


-------------------------문제 
ALTER TABLE INFO ADD(CHECK_YN VARCHAR2(2));

CREATE TABLE TB_INFO_PC (
    INFO_NO NUMBER,
    PC_NO   VARCHAR(4)
);

