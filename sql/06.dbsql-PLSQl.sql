/*
PL SQL
*/

/*
:= 오른쪽 값을 왼쪽에 할당한다.
DBMS_OUTPUT.PUT_LINE는 매개변수 값을 출력한다.
OUTPUT 패키지를 사용해 값을 보려면      : SET SERVEROUTPUT ON
블록의 소요시간을 보려면       : SET TIMING ON 처리를 해줘야 한다.
*/
SET SERVEROUTPUT ON
SET TIMING ON

-- 결과값만 보려면 [보기 - DBMS 출력]
DECLARE
        vi_num NUMBER;
BEGIN
        vi_num := 200;
        DBMS_OUTPUT.PUT_LINE('출력 : ' || vi_num);
END;


/*
:= 오른쪽 값을 왼쪽에 할당한다.
DBMS_OUTPUT.PUT_LINE는 매개변수 값을 출력한다.
OUTPUT 패키지를 사용해 값을 보려면      : SET SERVEROUTPUT ON
블록의 소요시간을 보려면       : SET TIMING ON 처리를 해줘야 한다.
*/
SET SERVEROUTPUT ON
SET TIMING ON

-- 결과값만 보려면 [보기 - DBMS 출력]
DECLARE
        vi_num NUMBER;
BEGIN
        vi_num := 56300;
        DBMS_OUTPUT.PUT_LINE('출력 : ' || vi_num);
END;


/*
변수 : 다른 프로그래밍 언어에서 사용하는 변수와 개념이 같으며
선언부에서 변수 선언을 하고 실행부에서 사용한다.

:= 값할당
변수명 데이터타입 := 초깃값;

초깃값을 할당하지 않으면 타입에 관계없이 초깃값은 NULL이 된다.
*/
DECLARE
        vi_num NUMBER := 2;
BEGIN
        vi_num := vi_num ** 10;
        DBMS_OUTPUT.PUT_LINE(vi_num);
END;


/*
상수 : 상수는 변수와 달리 한번 값을 할당하면 변하지 않는다.

상수명 CONSTANT 데이터타입 := 상수값;
상수를 선언할 때는 반드시 CONSTANT란 키워드를 붙여 변수와 구분하며,
선언할 때 반드시 초기화 해야하고 실행부에서 상수를 다른 값으로 변경할 수 없다.
*/
DECLARE
    vi_num CONSTANT NUMBER := 1;
BEGIN
    vi_num := 100;
    DBMS_OUTPUT.PUT_LINE(vi_num);
END;

-- 연산자를 통한 값 할당 가능
DECLARE
    vi_num NUMBER := 2**2*3**2;
    vi_date DATE := SYSDATE;
BEGIN
    DBMS_OUTPUT.PUT_LINE(vi_num);
    DBMS_OUTPUT.PUT_LINE(vi_date);
END;

-- EXERCISE
DECLARE
    vs_name CONSTANT VARCHAR2(50) := '최숙경';
    vs_number  NUMBER;
BEGIN
    SELECT 학번
    INTO vs_number
    FROM 학생
    WHERE 이름=vs_name;
DBMS_OUTPUT.PUT_LINE( vs_name || ' - ' || vs_number);
END;

-- 변수명 테이블명.컬럼명%TYPE; 테이블 컬럼의 타입가져와서 선언
DECLARE
    vs_emp_name /**/ employees.emp_name%TYPE; /**/
    vs_dep_name /**/ departments.department_name%TYPE;/**/
BEGIN
    SELECT a.emp_name, b.department_name
        INTO vs_emp_name, vs_dep_name
    FROM employees a, departments b
    WHERE
        a.department_id = b.department_id AND
        a.employee_id = 100;
    DBMS_OUTPUT.PUT_LINE( vs_emp_name || ' - ' || vs_dep_name );
END;

-- EXERCISE
DECLARE
    vs_emp_name employees.emp_name%TYPE;
    vs_emp_email employees.email%TYPE;
BEGIN
    SELECT emp_name, email
    INTO vs_emp_name, vs_emp_email
    FROM employees
    WHERE employee_id = '201';
    DBMS_OUTPUT.PUT_LINE(vs_emp_name || ' 사원의 E-MAIL : ' || vs_emp_email );
END;

-- 변수명을 이용한 자료 삽입
DECLARE
    vn_max_empno /**/ employees.employee_id%TYPE; -- 기본키에 해당하는 employee_id 번호 대입 예정
    vs_email /**/ employees.email%TYPE; -- 이메일 대입 예정
BEGIN
    SELECT MAX(employee_id)
        INTO vn_max_empno
    FROM employees;
    -- 아래는 자료 삽입 구문
    INSERT INTO employees ( employee_id, emp_name, email, hire_date, department_id )
        VALUES ( vn_max_empno +1, 'Harrison Frod', 'HARRIS', SYSDATE, 50 );
    COMMIT;
END;


/*
PL/SQL 제어문
다른 프로그래밍 언어에서 제공하는 다양한 처리문들을 포함하는데
이들을 통칭하여 PL/SQL 제어문이라고 한다.
제어문에는 특정 조건에 맞을 때 처리하는 조건문,
반복처리 시 사용하는 반복문, GOTO나 NULL과 같은 순차적 제어문이 있음.
*/

/*
변수문을 활용한 IF문을 활용
*/
DECLARE
    vn_num1 NUMBER := 1; -- 무슨 번호
    vn_num2 NUMBER := 2; -- 무슨 번호
BEGIN
    IF vn_num1 >= vn_num2 THEN
        DBMS_OUTPUT.PUT_LINE(vn_num1 || '이 큰 수' );
    ELSE
        DBMS_OUTPUT.PUT_LINE(vn_num2 || '이 큰 수');
    END IF;
END;

-- EXERCISE
DECLARE
    vn_salary NUMBER := 0;
    vn_department_id NUMBER := 0;
BEGIN
    vn_department_id := ROUND(DBMS_RANDOM.VALUE(10, 120), -1);
    SELECT salary
        INTO vn_salary
    FROM employees
       WHERE department_id = vn_department_id AND
       ROWNUM = 1;
    DBMS_OUTPUT.PUT_LINE('월급 : ' || vn_salary);
    IF vn_salary BETWEEN 1 AND 3000 THEN
        DBMS_OUTPUT.PUT_LINE('낮음');
    ELSIF vn_salary BETWEEN 3001 AND 6000 THEN
        DBMS_OUTPUT.PUT_LINE('중간');
    ELSIF vn_salary BETWEEN 6001 AND 10000 THEN
        DBMS_OUTPUT.PUT_LINE('높음');
    ELSE
        DBMS_OUTPUT.PUT_LINE('최상위');
    END IF;
END;

/*
CASE문
*/
CASE 표현식
    WHEN 결과1 THEN
        처리문1;
    WHEN 결과2 THEN
        처리문2;
    ...
    ELSE
        기타 처리문;
END CASE;

CASE
    WHEN 표현식1 THEN
    처리문1;
    WHEN 표현식2 THEN
    처리문2;
    ...
    ELSE
        기타 처리문;
END CASE;

/*
LOOP문
반복문은 특정 조건을 만족할 때만 루프를 돌며 로직을 처리하는데
LOOP문은 특정조건 없이 실행되며 EXIT를 사용해 루프를 빠져나간다.
*/
LOOP
    처리문;
    EXIT [WHEN 조건];
END LOOP;

/*
WHILE문
LOOP문과 비슷하지만 조건에 만족할 때만 루프를 돌면서 로직을 처리한다.
*/
WHILE 조건
    LOOP
        처리문;
    END LOOP;

/*
FOR문
인덱스 초깃값에서 시작해 최종값까지 루프를 돌며 1씩 증가시키는데,
인덱스는 참조는 가능하지만 변경할 수는 없고 참조도 오직 루프 안에서만 가능하다.

REVERSE를 명시하면 순서가 거꾸로 된다. 즉 최종값부터 시작해 최솟값에 이르기까지 감소하면서
루프를 돈다.
*/
FOR 인덱스 IN [REVERSE] 초깃값..최종값
LOOP
    처리문;
END LOOP;

/*
CONTINUE문
FOR나 WHILE 같은 반복문은 아니지만, 반복문 내에서 특정 조건에 부합할 때
처리 로직을 건너뛰고 상단의 루프 조건으로 건너가 루프를 계속 수행할 때 사용한다.
EXIT는 루프를 완전히 빠져 나오는데 반해, CONTINUE는 제어 범위가 조건절로 넘어간다.
*/

/*
GOTO문
PL/SQL 코드 상에서 GOTO문을 만나면 GOTO 문이 지정하는 라벨로 제어가 넘어간다.
*/

/*
NULL문
NULL문은 아무것도 처리하지 않는 문장이다.
*/



/*
사용자 정의 함수
익명 블록은 한 번 사용하고 나면 없어져 버리는 휩발성 블록이지만,
서브 프로그램인 함수나 프로시저는 컴파일을 거쳐 데이터베이스 내에 저장되어
재사용이 가능하다.
*/
CREATE OR REPLACE FUNCTION 함수 이름(매개변수1, 매개변수2, ...)
RETURN 데이터타입;
IS [AS]
    변수, 상수 등 선언
BEGIN
    실행부
    RETURN 반환값;
[EXCEPTION 예외 처리부]
END [함수 이름];


/*
프로시저
함수와 프로시저의 차이는 함수는 클라이언트에서 실행되며 리턴값이 필수이지만
프로시저는 서버에서 실행되며 리턴값이 없이 여러 개가 가능.

테이블에서 데이털르 추출해 입맛에 맞게 조작하고 그 결과를 다른 테이블에 다시 저장하거나 갱신하는
일련의 처리를 할 때 주로 프로시저를 사용한다.

함수나 프로시저는 모두 DB에 저장된 객체이므로 프로시저를 스토어드(Stored, 저장된)
프로시저라고 부르기도 한다. (함수도 스토어드 함수라고도 한다.)
*/

-- 프로시저 생성
CREATE OR REPLACE PROCEDURE 프로시저 이름
(
    매개변수명 1 [IN | OUT | IN OUT] 데이터타입 [:= 디폴트 값],
    매개변수명 2 [IN | OUT | IN OUT] 데이터타입 [:= 디폴트 값],
    ...
)
IS [AS]
    변수, 상수 등 선언
BEGIN
    실행부
[EXCEPTION 예외 처리부]
END [프로시저 이름];


-- 프로시저 실행
/*
함수는 반환 값을 받으므롤 실행할 때 '호출'이라고 명명하지만
프로시저는 '실행'한다고 표현

프로시저는 함수처럼 SELECT 절에는 사용 불가능
*/
EXEC 혹은 EXECUTE 프로시저명(매개변수1 값, 매개변수2 값, ...);
EXEC 혹은 EXECUTE 프로시저명(매개변수1 => 매개변수1 값,
                            매개변수2 => 매개변수2 값, ...);
-- 프로시저의 매개 변수가 많으명 실행할 때 매개변수 값의 개수나 순서를 혼동할 소지가 높다.
-- 그러므로 아래 두번째 열의 실행 방법으로 값을 매핑하여 실행한다.


-- 프로시저 디폴트 값 설정
/*
프로시저를 실행할 때는 반드시 매개 변수의 개수에 맞춰 값을 전달해 실행하여야 하는데
디폴트 값을 설정하면 실행할 때 해당 매개변수를 전달하지 않더라도 오류가 나지 않음
*/
-- 생성
CREATE OR REPLACE PROCEDURE my_new_job_proc
(
    p_job_id IN jobs.job_id%TYPE,
    p_job_title IN jobs.job_title%TYPE,
    p_min_sal IN jobs.jobs.min_salary%TYPE:=10,
    p_max_sal IN jobs.jobs.max_salary%TYPE:=100
)
IS
...
...
-- 실행
EXECUTE my_new_job_proc('SM_JOB1', 'Sample JOB1');


-- OUT, IN OUT 매개변수
CREATE OR REPLACE PROCEDURE my_new_job_proc
(
    p_job_id IN jobs.job_id%TYPE,
    p_job_title IN jobs.job_title%TYPE,
    p_min_sal IN jobs.jobs.min_salary%TYPE:=10,
    p_max_sal IN jobs.jobs.max_salary%TYPE:=100
    IS
)
-- 실행
EXECUTE my_new_job_proc('sm_job1', 'sample job1');