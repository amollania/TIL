/*
  트리거 Trigger 
  사전적 의미로 총의 방아쇠를 뜻한다. 
  방아쇠가 당겨지면 -> 발사되는 개념

  어떤 테이블에 특정한 이벤트가 발생 되었을때 _ Trigger 가 동작
  INSERT, UPDATE, DELETE 의 DML문 또는 DDL 문이 실행 되었을때 
  데이터베이스에서 특정 이벤트가 발생되었다 라고 하는데 
  이런 이벤트가 발생하면 자동으로 정해진 동작을 실행하는 데이터베이스 객체

  * 트리거의 사용목적

   1.테이블 생성 과정에서 참조 무결성과 ㅁ데이터 무결성 등의 복잡한 제약 조건을 생성하는 경우
   2.데이터베이스 테이블의 데이터에 생기는 작업의 감시, 보완
   3.데이터베이스 테이블에 생기는 변화에 따라 필요한 다른 프로그램을 실행하는 경우
   4.불필요한 트랜잭션을 금지하기 위해 
   5.컬럼의 값을 자동으로 생성되도록 하는 경우
   6.복잡한 뷰를 생성하는 경우 

   [기본형식]

   CREATE TRIGGER 트리거명
   BEFORE | AFTER  INSERT | DELETE | UPDATE (ON 컬럼...N)
   ON 테이블명
   FOR EACH ROW
   WHEN : OLD 
   OR : NEW.COLUMN..
   BEGIN 
    트리거내용
   END;

   * BEFORE OR AFTER  = 동작 시점을 설정 트랜잭션 발생 전, 또는 트랜잭션 이후 트리거 작동.

   * INSERT | UPDATE | DELETE  = 이벤트 종류를 정의 INSERT OR UPDATE 처럼 복수의 이벤트를 정의할 수 있다. 

   * (OF 컬럼..N) ON 테이블명 = 트리거가 주목하는 대상 테이블을 정의하고 특정 컬럼의 이벤트에 트리거가 동작하려면 컬럼명을 명시해준다. 

   * FOR EACH ROW   = 행 트리거를 정의한 내용으로 추가되는 행의 수만큼 트리거가 동작하여 행 내에서 이벤트가 발생되는걸 기준으로 트리거의 감시, 보완 범위를 정해두는 내용.

   * : OLD & : NEW  = 행트리거에서 컬럼의 실제 데이터 값을 제어하는데 사용되는 연산자  
      INSERT 문의 경우에 : NEW, UPDATE문의 경우 변경 전 컬럼 데이터값은 :OLD, 수정할 새로운 데이터 값은 : NEW로 나타내고 
      DELETE 문의 경우 삭제되는 컬럼값은 : OLD 컬럼명에 저장된다.

   * BEGIN ~ END = 트리거가 동작할 때 실행되는 내용을 정의한다. 
     
*/



CREATE TABLE EX11_1 AS
SELECT
    employee_id,
    emp_name,
    salary
FROM employees;

CREATE OR REPLACE TRIGGER test_trig
BEFORE UPDATE ON ex11_1
BEGIN
    DBMS_OUTPUT.PUT_LINE('요청하신 작업이 처리 되었다.');
END
;

UPDATE ex11_1
SET salary =10000
WHERE employee_id = 100;



CREATE OR REPLACE TRIGGER test3_tring

BEFORE UPDATE OF SALARY
ON EX11_1
FOR EACH ROW

BEGIN
    INSERT INTO CHK_ROW (SEO_NO, TIME_IN, EMPLOYEE_ID, EMP_NAME, COL_NAME, O_DATA, N_DATA)
        VALUES (
            (
            SELECT NVL(MAX(SEO_NO), 0) + 1 AS SEO_NO FROM CHK_ROW),
            SYSDATE,
            :OLD.EMPLOYEE_ID,
            :OLD.EMP_NAME,
            'SALARY',
            :OLD.SALARY,
            :NEW.SALARY
            );
    DBMS_OUTPUT.PUT_LINE(:OLD.EMP_NAME || '님의 급여정보가 변경되었습니다. ');
    DBMS_OUTPUT.PUT_LINE('수정 전 급액' || :OLD.SALARY);
    DBMS_OUTPUT.PUT_LINE('수정 후 금액' || :NEW.SALARY);
END;


-- 컬럼 수정을 하여 트리거에 문제가 생기도록하기
ALTER TABLE EX11_1 RENAME COLUMN SALARY TO SALARY_IMS1;

-- 업데이트를 통해 트리거 확인
UPDATE EX11_1
SET SALARY_IMS1 = 1000
WHERE employee_id  = 199;

SELECT *
FROM TEST2_TRIG;

UPDATE EX11_1
SET SALARY_IMS1 = 100
WHERE EMPLOYEE_ID = 199;
-- 트리거가 사용되지 않도록
ALTER TRIGGER TEST2_TRIG DISABLE;
-- 다시 컬럼을 변경
ALTER TABLE EX11_1 RENAME COLUMN SALARY_IMS1 TO SALARY;
-- 트리거 사용으로 변경
ALTER TRIGGER TEST2_TRIG ENABLE;



---------------------------------------------------------------------------------------------
    CREATE TABLE 상품 (
       상품코드 VARCHAR2(10) CONSTRAINT 상품_PK PRIMARY KEY 
      ,상품명   VARCHAR2(100) NOT NULL
      ,제조사  VARCHAR2(100)
      ,소비자가격 NUMBER
      ,재고수량 NUMBER DEFAULT 0
    );
    
    CREATE TABLE 입고 (
       입고번호 NUMBER CONSTRAINT 입고_PK PRIMARY KEY
      ,상품코드 VARCHAR(10) CONSTRAINT 입고_FK REFERENCES 상품(상품코드)
      ,입고일자 DATE DEFAULT SYSDATE
      ,입고수량 NUMBER
      ,입고단가 NUMBER
      ,입고금액 NUMBER
    );
    
    INSERT INTO 상품 (상품코드, 상품명, 제조사, 소비자가격) VALUES ('a001','마우스','삼성','1000');
    INSERT INTO 상품 (상품코드, 상품명, 제조사, 소비자가격) VALUES ('a002','마우스','NKEY','2000');
    INSERT INTO 상품 (상품코드, 상품명, 제조사, 소비자가격) VALUES ('b001','키보드','LG','2000');
    INSERT INTO 상품 (상품코드, 상품명, 제조사, 소비자가격) VALUES ('c001','모니터','삼성','1000');

----------------- 다음과 같은 트리거를 생성하시오 

-- 입력트리거 (입고테이블에 상품이 입력되었을 때 재고수량 증가) EX (warehousing_insert)
예 ) 입고테이블에 키보드가 10 개 입고되었을때 자동으로 상품테이블의 'A002' 상품의 재고가 0 -> 10 으로 변경

-- 수정 트리거(입고테이블에 상품의 입고수량이 변경되었을때 상품테이블의 재고수량 변경) (warehousing_update)
-- 삭제 트리거(입고테이블 특정 데이터 삭제시 상품 제고 수량 변경) (warehousing_delete)
------------------------------------------------------------------------------

INSERT INTO 입고 ( 입고번호, 상품코드, 입고수량, 입고단가, 입고금액 )
    VALUES ( (SELECT NVL(MAX(입고번호), 0) + 1 FROM 입고), 'a002', 200,1000, 10000);

CREATE OR REPLACE TRIGGER warehousing_insert
BEFORE INSERT ON 입고
FOR EACH ROW
DECLARE
    vn_cnt 상품.재고수량%TYPE;
    vn_nm 상품.상품명%TYPE;
BEGIN
    
    SELECT SUM(입고수량)
    INTO vn_cnt
    FROM 입고
    WHERE 상품코드 = :new.상품코드;
    
    UPDATE 상품
    SET 재고수량 = 재고수량+ vn_cnt
    WHERE 상품코드 = :new.상품코드;
    
    DBMS_OUTPUT.PUT_LINE('수정 전 재고수량' || vn_cnt);

END;