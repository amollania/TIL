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
    