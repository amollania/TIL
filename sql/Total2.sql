-- 표현식
 SELECT employee_id, salary, 
         CASE WHEN salary <= 5000 THEN 'C등급'
            WHEN salary > 5000 AND salary <= 15000 THEN 'B등급'
            ELSE 'A등급'
       END AS salary_grade
  FROM employees;

-- OR

SELECT employee_id, salary 
  FROM employees
WHERE salary = 2000
   OR salary = 3000
   OR salary = 4000
ORDER BY employee_id;  

-- BETWEEN AND 조건식
SELECT employee_id, salary 
  FROM employees
WHERE salary BETWEEN 2000 AND 2500
ORDER BY employee_id;

-- IN 조건식
SELECT employee_id, salary 
  FROM employees
WHERE salary IN (2000, 3000, 4000)
ORDER BY employee_id;

-- EXISTS 조건식
SELECT department_id, department_name
  FROM departments a
 WHERE EXISTS ( SELECT * 
                 FROM employees b
                WHERE a.department_id = b.department_id
                  AND b.salary > 3000)
ORDER BY a.department_name;


-- LIKE 조건식
SELECT emp_name
  FROM employees
 WHERE emp_name LIKE 'A%'
 ORDER BY emp_name;


-- 수식 연산자 
SELECT  employee_id             as 직원아이디 
      , emp_name                as 직원이름
      , salary / 8              as 시급
      , salary                  as 월급
      , salary - salary * 0.1   as 실수령액
      , salary * 12             as 연봉
 FROM employees 
WHERE department_id = 30 ; 

 -- 논리 연산자 
 SELECT * FROM employees WHERE salary = 2600;  -- 같다
 SELECT * FROM employees WHERE salary <> 2600; -- 같지 않다
 SELECT * FROM employees WHERE salary != 2600; -- 같지 않다
 SELECT * FROM employees WHERE salary < 2600;  -- 미만
 SELECT * FROM employees WHERE salary > 2600;  -- 초과
 SELECT * FROM employees WHERE salary <= 2600; -- 이하
 SELECT * FROM employees WHERE salary >= 2600; -- 이상





/* ROUND
매개변수 n 을 소수점 기준 ( i+1) 번 째에서 반올림한 결과를 반환 디폴트 0)
N 이 0 일때 i 입력된 숫자에 상관없이 0 을 반환하며 , 
i 가 음수이면 소수점을 기준으로 왼쪽 i 번째에서 반올림이 일어난다
*/
SELECT ROUND(10.154)
     , ROUND(10.541)
     , ROUND(11.001)
  FROM DUAL;
SELECT ROUND(10.154, 1)
     , ROUND(10.154, 2)
     , ROUND(10.154, 3)
  FROM DUAL;   
SELECT ROUND(0, 3)
     , ROUND(115.155, -1)
     , ROUND(115.155, -2)
  FROM DUAL;  

-- 문자함수 

SELECT LOWER('NEVER SAY GOODBYE')
     , UPPER('never say goodbye')
  FROM DUAL;  
   
SELECT SUBSTR('ABCD EFG', 1, 4)
  FROM DUAL;

SELECT employee_id,
       LPAD(SUBSTR(phone_number, 5), 12, '(02)')
  FROM employees;

SELECT REPLACE('나는 너를 모르는데 너는 나를 알겠는가?', '나', '너')
  FROM DUAL; 

SELECT LENGTH('대한민국'),
       LENGTHB('대한민국')
  FROM DUAL; 



--날짜 함수

-- SYSDATE 년월일 시분초
-- SYSTIMESTAMP  시분초 + 밀리세컨드 까지 
SELECT SYSDATE, SYSTIMESTAMP
  FROM DUAL;    
  
SELECT ADD_MONTHS(SYSDATE, 1), ADD_MONTHS(SYSDATE, -1)
  FROM DUAL;  
  
SELECT MONTHS_BETWEEN(SYSDATE, ADD_MONTHS(SYSDATE, 1)) mon1, 
       MONTHS_BETWEEN(ADD_MONTHS(SYSDATE, 1), SYSDATE) mon2
  FROM DUAL;    
  
SELECT LAST_DAY(SYSDATE)
  FROM DUAL;  
  
SELECT SYSDATE, ROUND(SYSDATE, 'month'), TRUNC(SYSDATE, 'month')
  FROM DUAL;   
  
SELECT NEXT_DAY(SYSDATE, '금요일')
  FROM DUAL;

SELECT
     SYSDATE   "현재시간",
     SYSDATE - 1 "어제 이시간",
     SYSDATE + 1 "내일 이시간"
     , systimestamp 
 FROM  dual;

-- 변환함수

SELECT TO_CHAR(123456789, '999,999,999')
  FROM DUAL;   
SELECT TO_CHAR(123456789, '999,999')
  FROM DUAL;   
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD')
FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'YYMMDD')
FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'YYMMDD HH:MM:SS')
FROM DUAL;
SELECT TO_NUMBER('123456')
FROM DUAL;
SELECT TO_DATE('20140101', 'YYYY-MM-DD')
  FROM DUAL;
SELECT TO_DATE('20140101 13:44:50', 'YYYY-MM-DD HH24:MI:SS')
  FROM DUAL;  


-- NULL 관련함수
SELECT NVL(manager_id, employee_id)
  FROM employees
 WHERE manager_id IS NULL;


 

 SELECT prod_id,
         DECODE(channel_id, 3, 'Direct', 
                            9, 'Direct',
                            5, 'Indirect',
                            4, 'Indirect',
                               'Others')  decodes
  FROM sales
  WHERE rownum < 10;  
  
-- 집계함수

 
SELECT SUM(salary) , SUM( DISTINCT salary) 
     , AVG(salary) , MAX(salary) , MIN(salary)
  FROM employees;   

-- GROUP BY 와 HAVING 절

SELECT period, region, SUM(loan_jan_amt) totl_jan
  FROM kor_loan_status
 WHERE period = '201311' 
 GROUP BY period, region
 HAVING SUM(loan_jan_amt) > 100000
 ORDER BY region;


-- ROLLUP과 CUBE
-- 그룹의 소계와 총계를 구한다. (순서가 중요하다. 제일 앞에 놓인 것에 대해서 소계를 구하게 된다.)

 SELECT period, gubun, SUM(loan_jan_amt) totl_jan
  FROM kor_loan_status
 WHERE period LIKE '2013%' 
 GROUP BY ROLLUP(period, gubun); 

-- CUBE 
-- 각 그룹의 모든 경우의 수에 대한 소계와 총계를 구한다

 SELECT period, gubun, SUM(loan_jan_amt) totl_jan
  FROM kor_loan_status
 WHERE period LIKE '2013%' 
 GROUP BY CUBE(period, gubun) ;
 

-- 집합 연산자 UNION 

 
-- 15개 
SELECT goods
  FROM exp_goods_asia
 WHERE country = '한국'
UNION 
SELECT goods
  FROM exp_goods_asia
 WHERE country = '일본';

-- 20개 중복건이 일어난다 
SELECT goods
  FROM exp_goods_asia
 WHERE country = '한국'
UNION ALL
SELECT goods
  FROM exp_goods_asia
 WHERE country = '일본';
 
-- 5건 교집합만 추출  
SELECT goods
  FROM exp_goods_asia
 WHERE country = '한국'
INTERSECT
SELECT goods
  FROM exp_goods_asia
 WHERE country = '일본'; 
 
 
-- 5건 차집합만 추출  
SELECT goods
  FROM exp_goods_asia
 WHERE country = '한국'
MINUS
SELECT goods
  FROM exp_goods_asia
 WHERE country = '일본';  


조인 

--EQUI JOIN
SELECT a.department_id
     , a.department_name
     , b.job_id
     , b.department_id
FROM departments a,
     job_history b
WHERE a.department_id = b.department_id ;

--OUTER JOIN
SELECT a.department_id
     , a.department_name
     , b.job_id
     , b.department_id
FROM departments a,
     job_history b
WHERE a.department_id = b.department_id (+) ;



/*
 서브쿼리
 SUB QUERY SQL 문장 안에 보조로 사용되는 또 다른 SELECT 문 
  메인 쿼리와 연관성에 따라 
 1.연관성 없는 서브 쿼리, 2.있는 서브쿼리 

 형태에 따라 
 1.일반 서브쿼리 (SELECT 절)
 2.인라인 뷰 (FROM 절)
 3.중첩 쿼리 (WHERE 절)
*/
1. SELECT 절에도 서브 쿼리를 넣을 수 있다. (스칼라쿼리)
SELECT a.employee_id
      ,( SELECT b.emp_name
           FROM employees b
          WHERE a.employee_id = b.employee_id) AS emp_name
      ,a.department_id
      ,( SELECT b.department_name
           FROM departments b
          WHERE a.department_id = b.department_id) AS dep_name     
FROM job_history a;

2.인라인뷰
SELECT a.employee_id
     , a.emp_name
     , b.department_id
     , b.department_name
  FROM employees a,
       departments b,
       ( SELECT AVG(c.salary) AS avg_salary 
           FROM departments b,
                employees c
          WHERE b.parent_id = 90  -- 기획부
            AND b.department_id = c.department_id ) d
 WHERE a.department_id = b.department_id 
   AND a.salary > d.avg_salary;

3.where 절
SELECT count(*)
  FROM employees 
 WHERE department_id IN ( SELECT department_id
                            FROM departments
                           WHERE parent_id IS NULL);



-- MERGE

MERGE INTO ex3_3 d
     USING (SELECT employee_id, salary, manager_id
              FROM employees
             WHERE manager_id = 146) b
        ON (d.employee_id = b.employee_id)
 WHEN MATCHED THEN 
      UPDATE SET d.bonus_amt = d.bonus_amt + b.salary * 0.01
      DELETE WHERE (B.employee_id = 161)
 WHEN NOT MATCHED THEN 
      INSERT (d.employee_id, d.bonus_amt) VALUES (b.employee_id, b.salary *.001)
      WHERE (b.salary < 8000);


MERGE INTO ex3_3 A
    USING DUAL
       ON (A.employee_id = 148)
 WHEN MATCHED THEN 
      UPDATE SET A.BONUS_AMT = 10      
 WHEN NOT MATCHED THEN     
      INSERT (A.EMPLOYEE_ID, A.BONUS_AMT) VALUES (148,10);


