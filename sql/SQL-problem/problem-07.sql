/* 첫번째 구문 */
-- 100일 : 17/11/22 : 811 지남
-- 200일 : 18/03/02 : 711 지남
-- 300일 : 18/06/10 : 611 지남
-- 400일 : 18/09/18 : 511 지남
-- 500일 : 18/12/27 : 411 지남
-- 600일 : 19/04/06 : 311 지남
-- 700일 : 19/07/15 : 211 지남
-- 800일 : 19/10/23 : 111 지남
-- 900일 : 20/01/31 : 11 지남
-- 1000일 : 20/05/10 : 89 남음

CREATE OR REPLACE PROCEDURE ddday
IS
    base_date DATE := TO_DATE(20170814);
    chapter_day NUMBER := 0;
    number_date DATE := SYSDATE;
    count_day NUMBER := 100;
    to_day NUMBER;
BEGIN
    FOR i in 1..10
        LOOP
        SELECT
            count_day,
            TRUNC(TO_DATE(20170814)) + count_day,
            TRUNC(SYSDATE)- (TO_DATE(20170814) + count_day)
        INTO chapter_day, number_date, to_day
        FROM DUAL;
        
        IF to_day < 0 THEN
            to_day := ABS(to_day);
            DBMS_OUTPUT.PUT_LINE(chapter_day || '일 : ' || number_date || ' : ' || to_day || ' 남음');
        ELSE 
            DBMS_OUTPUT.PUT_LINE(chapter_day || '일 : ' || number_date || ' : ' || to_day || ' 지남');
        END IF;
        count_day := count_day+100;
        END LOOP;
END;

-- 출력
EXEC ddday;



/* 두 번째 구문 */
-- date 형식을 체크하는 함수 생성
CREATE OR REPLACE FUNCTION fn_is_date(
    p_str_date VARCHAR2,
    p_format VARCHAR2 DEFAULT 'YYYYMMDD'
)
RETURN NUMBER
IS -- 데이터가 DATE 형인지 검사하는 함수이다. 1이 나오면 DATE 출력
    v_date DATE;
BEGIN
    v_date := TO_DATE(p_str_date, p_format);
    RETURN 1;
EXCEPTION
    WHEN OTHERS THEN RETURN 0;
END;


-- 일수 더해주는 함수 만들기
CREATE OR REPLACE FUNCTION fn_d_day(p_start_dt varchar2, p_add_dt number)
    RETURN DATE
IS
    vn_date DATE;
BEGIN
     vn_date := TO_DATE(p_start_dt-1) + p_add_dt;
END;


-- 구분 함수 만들기
CREATE OR REPLACE FUNCTION fn_d_day_check (p_check_date DATE)
    RETURN varchar2
IS
    vn_date DATE := sysdate;
    vn_number NUMBER := 0;
    vn_dday VARCHAR2(100);
BEGIN
    vn_number :=  TRUNC(p_check_date - vn_date);
    IF vn_number > 0 THEN
        vn_dday := vn_number+1 || '남음';
    ELSE
        vn_dday := ABS(vn_number) || '지남';
    END IF;
    RETURN vn_dday;
END;

-- 함수 만들기
CREATE OR REPLACE PROCEDURE dday_test_proc (p_date VARCHAR2)
IS
    vn_date date;
    ex_date EXCEPTION;
BEGIN
    IF fn_is_date(p_date) = 1 THEN,ㅣㅏ
    ['
    
    ']
        FOR i IN 1..10
        LOOP
            vn_date := fn_d_day(p_date, i * 100);
            DBMS_OUTPUT.PUT_LINE( i * 100 || ' 일 : ' || vn_date || ' : ' || fn_d_day_check(vn_date));
        END LOOP;
    ELSE
        RAISE ex_date;
    END IF;

EXCEPTION WHEN ex_date THEN
        DBMS_OUTPUT.PUT_LINE('YYYYMMDD 형식이어야 합니다. ');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;

EXEC dday_test_proc(50);

