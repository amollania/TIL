-- 프로시저 예문 만들어보기

-- 테이블 복사
CREATE TABLE ch10_departments
AS SELECT department_id, department_name
FROM departments;

-- 테이블 키 수정
ALTER TABLE ch10_departments
ADD CONSTRAINTS pk_ch10_departments PRIMARY KEY (department_id);
