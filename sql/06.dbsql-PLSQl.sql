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