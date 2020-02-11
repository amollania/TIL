-- 프로시저 예문 만들어보기

/* 테이블 복사 */
CREATE TABLE ch10_departments
AS SELECT department_id, department_name
FROM departments;

/* 테이블 키 수정 */
ALTER TABLE ch10_departments
ADD CONSTRAINTS pk_ch10_departments PRIMARY KEY (department_id);


/* 프로시저 만들기 */
CREATE OR REPLACE PROCEDURE my_new (
    p_id IN ch10_departments.department_id%TYPE,
    p_name IN ch10_departments.department_name%TYPE := 0,
    -- 작업 행위 매개변수
    action VARCHAR2
    )
IS
BEGIN
        -- 작업 변수가 I일 때, 데이터 삽입
        IF UPPER(action) = 'I' THEN
            INSERT INTO ch10_departments ( department_id,  department_name) VALUES( p_id, p_name);
        END IF;
        -- 작업 변수가 U일 때, 데이터 수정
        IF UPPER(action) = 'U' THEN
            UPDATE ch10_departments SET department_name = p_name WHERE department_id = p_id;
        END IF;
        -- 작업 변수가 D일 때, 데이터 삭제
        IF UPPER(action) = 'D' THEN
            DELETE ch10_departments WHERE department_id=p_id;
        END IF;
        COMMIT;
END;


-- 출력하기
EXEC my_new(30, '총무기획부', 'i');