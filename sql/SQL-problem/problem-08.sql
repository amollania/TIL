/* 오류구문 체크하는 프로시저 직접 만들어보기 */

-- 숫자인지 체크하는 함수 만들기 (IS_NUMBER)
CREATE OR REPLACE FUNCTION is_number(str VARCHAR2) RETURN NUMBER
IS
    v_ret NUMBER;
BEGIN
    IF str IS NULL OR LENGTH(TRIM(str)) = 0 THEN
        RETURN 0;
    END IF;
    v_ret := TO_NUMBER(str);
    RETURN 1; -- 숫자일 경우 1반환
    
    EXCEPTION WHEN OTHERS THEN
        RETURN 0; -- 숫자가 아닐 경우, 예외 구문 EXCEPTION 실행하여 0 반환
END;


-- 구문 테스트하기
CREATE OR REPLACE PROCEDURE addr_add_ment
    (
    name_sal   addr.name%TYPE,
    age_sal  addr.age%TYPE,
    hobby_sal  addr.hobby%TYPE
    )
IS
    errorprint1 EXCEPTION;
    errorprint2 EXCEPTION;
BEGIN

    SAVEPOINT mysavepoint;  -- 데이터 삽입전 롤백 지정

    INSERT INTO addr(addr.name, addr.age, addr.hobby)
    VALUES (name_sal, age_sal, hobby_sal);
    
    IF is_number(name_sal) = 1 THEN -- 숫자일경우 오류반환
        RAISE errorprint1;
    ELSE
        DBMS_OUTPUT.PUT_LINE('데이터 삽입.');
        COMMIT;
     END IF;

EXCEPTION WHEN errorprint1 THEN
            DBMS_OUTPUT.PUT_LINE('이것은 숫자로다.');
            DBMS_OUTPUT.PUT_LINE(SQLCODE);
            ROLLBACK TO mysavepoint;
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;

-- 앞자리 숫자 입력시 오류 반환&ROLLBACK
EXEC addr_add_ment(2213, 9, '건방기');
-- 앞자리 문자 정상 입력시 구문 그대로 실행\
EXEC addr_add_ment('김갑환', 9, '건방기');