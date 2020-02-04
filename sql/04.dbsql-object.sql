
/*
데이터 VIEW 만들기
*/
-- 위의 쿼리를 자주 사용한다면, 사용할 때마다 SQL 문을 매번 작성해야 하는 불편함이 있다.
CREATE OR REPLACE VIEW emp_dept_v1 AS
SELECT
        a.employee_id,
        a.emp_name,
        a.department_id,
        b.department_name
FROM
        employees a,
        departments b
WHERE
        a.department_id = b.department_id;

-- VIEW 권한주기
GRANT CREATE VIEW TO java;

-- VIEW 삭제하기
DROP VIEW 뷰이름;


-- ALL_OBJECTS : 오브젝트 조회
SELECT * FROM all_objecs WHERE object_name LIKE '오브젝트명';

-- ALL_SYNONYMS : 시노팀 조회
SELECT * FROM all_synonyms WHERE synonym_name='시노님명';

-- ALL_IND_COLUMNS : 테이블 인덱스 정보 조회
SELECT * FROM all_ind_columns WHERE table_name ='테이블명';

-- ALL_TAB_COLUMNS  : 테이블별 컬럼정보 조회
SELECT * FROM all_tab_columns WHERE table_name='테이블명';



/*
INDEX(인덱스) 만들기
테이블에 있는 데이터를 빨리 찾기 위한 용도의 데이터베이스 객체이다.
예시로 책의 목차와 같다.

가장 일반적인 이고 표준인 B-tree 인덱스는 테이블에 있는 한 개 이상의 컬럼으로 만들 수 있다.
*/
-- UNIQE INDEX는 컬럼 값에 중복값을 허용하지 않는다.
CREATE UNIQUE INDEX ex2_10_ix01
ON ex2_10 (col11);

SELECT *
FROM user_indexes
WHERE table_name = 'EX2_10';

/*
1개 이상의 컬럼으로 인덱스를 만들 수 있다.
인덱스 자체에 키와 매핑 주소 값을 별도로 저장한다.
따라서 테이블 입력, 삭제, 수정할 때 인덱스에 저장된 정보도 수정된다.
그러므로 너무 많은 인덱스를 만들게 되면 SELECT 이외의 INSERT, DELETE, UPDATE 시 성능에 부하가 따른다.
*/
CREATE INDEX ex2_10_ix02
ON ex2_10 (col1, col2);

SELECT
        index_name,
        index_type,
        table_name,
        uniqueness
FROM
        user_indexes
WHERE
        table_name = 'EX2_10';

-- 인덱스 삭제
DROP INDEX ex2_10_ix02;



/*
SYNONYM 시노님
객체 각자의 고유한 이름에 대한 동의어를 만드는 것.
PUBLIC 모든 사용자 접근 가능
PRIVATE 시노님은 특정 사용자만 참조되는 시노님.

시노님 생성시 PUBLIC을 생략하면 PRIVATE 시노님이 만들어 진다.
PUBLIC 시노님은 DBA권한이 있는 사용자만 생성 및 삭제 가능.
*/
CREATE OR REPLACE SYNONYM syn_channel
FOR channels;

SELECT COUNT(*)
FROM syn_channel;

GRANT CREATE SYNONYM to java;

-- 다른 사용자로 로그인 해서 만든 시노님을 참조해 보자.
-- 오라클 설치시 자동으로 생성되는 사용자 HR
-- 디폴트 계정으로 계정이 잠겨있으므로 잠긴 계정을 풀고 HR로 접속해서 테스트
ALTER USER hr IDENTIFIED BY hr ACCOUNT UNLOCK;

SELECT COUNT(*)
FROM java.syn_channel;

-- java 계정에서 HR에게 조회 권한을 준다.
GRANT SELECT ON syn_channel TO HR;

-- 계정 교체후 HR로 로그인해서 확인
SELECT COUNT(*)
FROM java.syn_channel;

-- PUBLIC SYNONYM은 DBA 권한있는 계정에서 생성할 수 있다.
CREATE OR REPLACE PUBLIC SYNONYM syn_channel2
FOR java.channels;
-- PUBLIC SYNONYM은 계정을 쓰지 않아도 가능
SELECT COUNT(*)
FROM syn_channel2;
-- 시노님 삭제(PRIVATE 시노님)
DROP SYNONYM syn_channel;
-- 시노님 삭제(PUBLIC 시노님은 DBA 권한이 있는 사용자만 삭제 가능)
DROP PUBLIC SYNONYM syn_channel21;

/* 시노님을 사용하는 이유
1. 데이터베이스의 투명성을 제공하기 위해, 다른 사용자의 객체를 참조할 때 사용

2. 시노님을 새엇ㅇ해 놓으면 나중에 시노님이 참조하고 있는
객체의 이름이 바뀌어도 이전에 사작성해 놨단 SQL문을 수정할 필요가 없다.

3. 시노님은 별칭이므로 원래의 객체를 숨길 수는 없다.
(보안)Private은 쇼유자명.시노님 명이지만 PUBLIC은 쇼유자 명도 숨길 수 있다.
*/



/*
Sequence(시퀀스)
자동 순번을 반환하는 매개체
*/
CREATE SEQUENCE my_sql1
INCREMENT BY 1  -- 증강숫자
START WITH 1    -- 시작숫자
MINVALUE 1      -- 최솟값(시작숫자와 같아야 한다.)
MAXVALUE 1000   -- 최댓값 (시작숫자 보다 커야한다.)
NOCYCLE         -- 디폴트 값으로 최대나 최솟값에 도달하면 생성 중지
NOCACHE;        -- 디폴트로 메모리에 시퀀스 값을 미리 할당해 놓지 않으며 디폴트 값은 20

SELECT my_sql1.CURRVAL -- 현재 시퀀스값 (시퀀스 값이 존재하지 않으면 오류 반환)
FROM DUAL;
SELECT my_sql1.NEXTVAL -- 시퀀스에서 다음 순번 값을 가져온다.
FROM DUAL;
-- 시퀀스 삭제
DROP SEQUENCE my_sql1;

SELECT NVL(MAX(INFO_NO), 0)+1
FROM INFO;


/*
MERGE
특정 조건에 따라 어떤 때는 INSERT
다른 경우에는 UPDATE 문을 수행할 때 사용이 가능하다.
과거에는 해당 조건을 처리하는 로직을 작성해야 했지만,
MERGE문이 나오면서 한번체 처리가 가능하게 되었다.
*/
CREATE TABLE ex3_3(
        employee_id NUMBER,
        bonus_amt NUMBER DEFAULT 0
        );
/*
SALES 테이블에서 2000년 10월부터 2000년 12월까지 매출을 낸 사원번호를 입력 GROUP BY 절을 추가해 사원의 중복을 없앤다.
*/
INSERT INTO ex3_3(employee_id)
SELECT e.employee_id
FROM employees e, sales s
WHERE e.employee_id = s.employee_id
AND s.sales_month between '200010' AND '200012'
GROUP BY e.employee_id;


/*
1. 사원 테이블에서 관리자 사번 MANAGER_ID가 146번인 사원을 찾아
2. EX3_3 테이블에 있는 사원의 사번과 일치하면 보너스 금액에 자신의 급여 1% 보너스로 갱신
3. 사번과 일치하는게 없으면 (1)의 결과를 신규로 입력(이 때 보너스 금액은 급여의 0.1%로 한다.
이 때 급여가 8000 미만인 사원만 처리.
*/
-- 매니저 사번이 146
SELECT
        employee_id, salary, manager_id
FROM
        employees
WHERE
        manager_id = 146;
-- 이 데이터 중 ex_3_3 테이블에 있는 건 1% 인상
SELECT
        employee_id, manager_id, salary, salary = 0.01
FROM
        employees
WHERE
        employee_id IN (SELECT employee_id FROM ex3_3) AND
        manager_id = 146;
-- INSERT 대상건 (사번과 일치하는게 없다면)
SELECT
        employee_id, manager_id, salary, salary = 0.001
FROM
        employees
WHERE
        employee_id NOT IN (SELECT employee_id FROM ex3_3) AND
        manager_id = 146;

-- MERGE 문을 이용한 데이터 수정 작업
MERGE INTO ex3_3 d
        USING(
                SELECT employee_id, salary, manager_id
                FROM employees
                WHERE manager_id = 146) b
                ) ON (d.employee_id = b.employee_id)
        WHEN MATCHED THEN
                UPDATE SET d.bonus_amt = d.bonus_amt + b.salary * 0.01
        WHEN NOT MATCHED THEN
                INSERT (d.employee_id, d.bonus_amt) VALUES (b.employee_id, b.salary *.001)
                WHERE (b.salary < 8000);

-- MERGE 문을 이용한 데이터 수정 작업
MERGE INTO ex3_3 a
        USING DUAL
                ON (A.employee_id = 148)
        WHEN MATCHED THEN
                UPDATE SET A.BONUS_AMT = 10
        WHEN NOT MATCHED THEN
                INSERT (a.employee_id, a.bonus_amt) VALUES (148, 10);

-- MERGE 문을 이용한 데이터 수정 작업
MERGE INTO 과목 -- MERGE 문 시작 (테이블 이름 지정)
        USING DUAL
                ON (과목이름 = '스장키')
        WHEN MATCHED THEN -- 존재할 경우 실행 구문
                UPDATE SET 학점 = 6
        WHEN NOT MATCHED THEN -- 존재하지 않을 경우 실행 구문
                INSERT (과목번호 , 과목이름, 학점)  VALUES(515, '수학천재과', 10);

/*
과목테이블에 과목에 수영이라는 과목이 있다면
학점을 6점으로 업데이트,
없다면 수영 과목을 INSERT하는 MERGE문
*/
MERGE INTO 과목 s
        USING DUAL
                ON (s.과목이름 = '데이터베이스2')
        WHEN MATCHED THEN
                UPDATE SET s.학점 = 3
        WHEN NOT MATCHED THEN
                INSERT (s.과목번호, s.과목이름, s.학점)
                -- (SELECT NVL(MAX(A.과목번호), 0)+1 FROM 과목 A) 
                VALUES ((SELECT NVL(MAX(A.과목번호), 0)+1 FROM 과목 a), '데이터베이스2', 1);
