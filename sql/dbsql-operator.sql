/*
집합 연산자
*/
--UNION
SELECT goods
FROM exp_goods_asia
WHERE country = '한국'
ORDER BY seq;

SELECT goods
FROM exp_goods_asia
WHERE country = '한국'
ORDER BY seq;


SELECT goods
FROM exp_goods_asia
WHERE country = '한국'
UNION
SELECT goods
FROM exp_goods_asia
WHERE country = '일본'
-- 유니온을 사용할 때는 컬럼 갯수와 타입이 동일해야 한다.

-- EXAMPLE
SELECT period,
    gubun,
    SUM(loan_jan_amt)
FROM kor_loan_status
WHERE
    period LIKE '2013%'
GROUP BY period, gubun
UNION
SELECT period,
    '',
    SUM(loan_jan_amt)
FROM kor_loan_status
WHERE period LIKE '2013%'
GROUP BY period;

--UNION ALL
-- INTERSRT

-- GROUPING SETS
SELECT
        period,
        gubun ,
        SUM(loan_jan_amt) totl_jan
FROM
        kor_loan_status
WHERE period LIKE '2013%'
GROUP BY GROUPING sets(period, gubun);

SELECT
        period,
        gubun,
        region,
        SUM(loan_jan_amt) totl_jan
FROM
        kor_loan_status
WHERE
        period LIKE '2013%'
AND
        region IN ('서울', '경기')
GROUP BY GROUPING SETS(period, (gubun, region));


SELECT
        period,
        SUM(loan_jan_amt) totl_jan
FROM
        kor_loan_status
WHERE
        period LIKE '2013%'
GROUP BY period
UNION
SELECT
        '합계',
        SUM(loan_jan_amt) totl_jan
FROM
        kor_loan_status
WHERE
        period LIKE '2013%';


-- EXAMPLE 1
SELECT
        period,
        SUM(loan_jan_amt) totl_jan
FROM
        kor_loan_status
WHERE
        period LIKE '2013%'
GROUP BY period
UNION
SELECT
        '합계',
        SUM(loan_jan_amt) totl_jan
FROM
        kor_loan_status
WHERE
        period LIKE '2013%';


-- JOIN
-- JOIN에는 여러 종류가 있지만 내부JOIN과 외부JOIN 정도로 크게 구분이 가능하다.
/* 
테이블 사이를 연결해 주는 조인과 서브 쿼리
관계형 데이터베이스에서 SQL을 이용해 '관계'를 연결하는 방법
*/
SELECT *
FROM
        member,
        cart
WHERE member.mem_id = cart.cart_member
AND member.mem_id = 'x001';

SELECT
        a.mem_id,
        b.cart_no
FROM
        member a,
        cart b
WHERE a.mem_id = b.cart_member
AND a.mem_id ='x001';


/*
employee 테이블과 jobs 테이블에서 job_id를 조인시켜
사원, 사원명, 급여, 업무ID, 업무명 게시
AD_PRES는 제외
*/
SELECT
        a.employee_id AS "사원",
        a.emp_name AS "사원명",
        a.salary AS "급여",
        b.job_id AS "업무ID",
        b.job_title AS " 업무명"
FROM
        employees a,
        jobs b
WHERE 
   b.job_id = a.job_id AND
    NOT b.job_id LIKE 'AD_PRES%'
ORDER BY a.employee_id ASC;


/*
세미조인 SEMI-JOIN
서브 쿼리에 존재하는 데이터만 메인 쿼리에서 추출하는 조인방법
*/
SELECT
        department_id,
        department_name
FROM
        departments a
WHERE EXISTS (
                SELECT *
                FROM employees b
                WHERE a.department_id = b.department_id
                AND b.salary > 3000
                );

-- EXISTS와 IN의 차이점은 서브쿼리 내에 두 테이블의 조인 조건이 없는 점.
SELECT
        department_id,
        department_name
FROM
        departments a
WHERE
a.department_id IN (
                SELECT b.department_id
                FROM employees b
                WHERE b.salary > 3000
                )
ORDER BY department_name;


-- EXAMPLE
-- 동등, EqualJOIN
SELECT *
FROM
        addr,
        codehabby
WHERE addr.hobby = codehabby.code;

-- 카타시안
SELECT *
FROM
        addr,
        codehabby;

-- 외부 OUTERJOIN
SELECT *
FROM
        addr,
        codehabby
WHERE addr.hobby(+) = codehabby.code;


/*
안티조인 (ANTI-JOIN)
서브 쿼리 B테이블에 없는 메인 쿼리A 테이블의 데이터만 추출하는 조인 방법.
한쪽 테이블에만 있는 데이터를 추출하는 것이므로 조회 조건에서 NOT IN이나 NOT EXISTS 연산자를 사용.
*/
-- NOT IN
SELECT
        a.employee_id,
        a.emp_name,
        a.department_id,
        b.department_name
FROM
        employees a,
        departments b
WHERE
        a.department_id = b.department_id
AND
        a.department_id NOT IN (
            SELECT department_id
            FROM departments
            WHERE manager_id IS NULL
        ); -- 일치하지 않는 레코드를 반환

-- NOT EXISTS
SELECT *
FROM
        employees a
WHERE NOT EXISTS(
    SELECT *
    FROM departments c
    WHERE a.department_id = c.department_id
);


/*
셀프조인(SELF-JOIN)
동일한 테이블 조인
*/
SELECT
        a.employee_id,
        a.emp_name,
        b.employee_id,
        b.emp_name,
        a.department_id
FROM
        employees a,
        employees b
WHERE
        a.employee_id < b.employee_id
AND a.department_id = b.department_id
AND a.department_id = 30;
-- 같은 부서번호를 가진 사원 중 A사원번호가 B사원 번호보다 작은 건을 조회


/*
외부조인(OUTER JOIN)
조인 조건에 만족하는 데이터 + 어느 한쪽 테이블에 조인 조건에 명시된 컬럼에 값이 없거나
해당 로우가 아예 없더라도 데이터 모두 추출
*/
-- Equl
SELECT
        a.department_id,
        a.department_name,
        b.job_id,
        b.department_id
FROM
        departments a,
        job_history b
WHERE
        a.department_id = b.department_id;

-- JOIN 조건에서 데이터가 없는 테이블의 컬럼에 (+)
SELECT
        a.department_id,
        a.department_name,
        b.job_id, b.department_id
FROM
        departments a,
        job_history b
WHERE
        a.department_id = b.department_id (+)
        AND a.department_id = b.department_id(+);
/*
1. JOIN 조건 모두에 (+) 붙여야 한다.
2. (+) 붙은 조건과는 OR을 사용할 수 없다.
3. 한번에 한 테이블에만 외부 조인이 가능하다.
*/


/*
카타시안 조인(CATASIAN PRODUCT) WHERE 절에 JOIN 조건이 없는 조인
두 테이블 간의 곱
*/
SELECT
        a.employee_id,
        a.emp_name,
        b.department_id,
        b.department_name
FROM
        employees a,
        departments b;

--교수 이름 교수 전공 교수 학위 강의실 교시, 강의과목명, 과목학점 출력

SELECT
    교수.교수이름,
    교수.전공,
    교수.학위,
    강의내역.교시,
    강의내역.강의실,
    과목.과목이름,
    과목.학점
FROM
    교수,
    과목,
    강의내역
WHERE
    교수.교수번호 = 강의내역.교수번호
    AND 강의내역.과목번호 = 과목.과목번호;


/*
Sub Query
쿼리 안에 있는 쿼리.
위치에 따라

SELECT절 : 스칼라서브쿼리
FROM절 
*/

-- 스칼라서브쿼리
SELECT a.*,
        (
        SELECT code nm
        FROM codehabby b
        WHERE b.code = a.hobby
        ) AS hobby
FROM addr a;

-- 인라인뷰(FROM절)
SELECT
        a.employee_id,
        a.emp_name,
        b.department_id,
        b.department_name
FROM
        employees a,
        departments b,
        (
        SELECT AVG(c.salary) AS avg_salary
        FROM
            departments b,
            employees c
        WHERE
            b.parent_id = 90
        AND
            b.department_id = c.department_id
        ) d
WHERE
    a.department_id = b.department_id
AND
    a.salary > d.avg_salary;


-- EXAMPLE 1
SELECT
    *
FROM(
        SELECT
                a.*,
                rownum as rum
        FROM(
            SELECT
                교수.교수이름,
                교수.전공,
                교수.학위,
                COUNT(*) AS H_CNT
            FROM
                교수,
                강의내역,
                과목
            WHERE
                교수.교수번호 = 강의내역.교수번호
                AND 강의내역.과목번호 = 과목.과목번호
            GROUP BY
                교수.교수이름,
                교수.전공,
                교수.학위
            ORDER BY 4 DESC
            ) a
) b
WHERE b.rum = 2;

-- EXAMPLE 2
-- 입사연도 2002년 사원 정보 조회
SELECT
    a.*
FROM
        (
        SELECT
            e.employee_id,
            e.emp_name,
            e.salary,
            j.min_salary,
            j.max_salary,
            e.hire_date
        FROM
            employees e,
            jobs j
        WHERE
            e.job_id = j.job_id
        ) a
WHERE
    TO_CHAR(a.HIRE_DATE, 'YYYY') = '2002';

/*
ANSI 내부조인
FROM 절에 INNER JOIN 구문을 쓴다.
JOIN 조건은 ON 절에 명시
JOIN 조건 외의 조건은 WHERE 절에 명시
*/
SELECT
        a.employee_id,
        a.emp_name,
        b.department_id,
        b.department_name
FROM
        employees a INNER JOIN
        departments b ON (a.department_id = b.department_id)
WHERE
        a.hire_date >= TO_DATE('2003-01-01', 'YYYY-MM-DD');

-- ANSI 구문 예시
SELECT
        m.mem_name,
        l.lprod_gu,
        p.prod_name,
        c.cart_qty
FROM
        member m
        INNER JOIN cart c ON(m.mem_id = c.cart_member)
        INNER JOIN prod p ON(c.cart_prod = p.prod_id)
        INNER JOIN lprod l ON(p.prod_lgu = l.lprod_gu)
        WHERE
m.mem_id ='g001';

/*
ANSI 외부조인
앞서 나온 '외부조인(OUTER JOIN)' 대신 사용 가능한 구절
LEFT OUTER JOIN
LEFT JOIN
RIGHT OUTER JOIN
RIGHT JOIN
*/
-- 오른쪽 테이블에 JOIN시킬 컬럼값이 없을 경우
SELECT
        a.employee_id,
        a.emp_name,
        b.job_id,
        b.department_id
FROM
        employees a
LEFT OUTER JOIN
        job_history b ON (
                a.employee_id = b.employee_id AND
                a.department_id = b.department_id
        );

SELECT
        a.employee_id,
        a.emp_name,
        b.job_id,
        b.department_id
FROM
        employees a,
        job_history b
WHERE
        a.employee_id = b.employee_id(+) AND
        a.department_id = b.department_id(+);

-- EXAMPLE
SELECT
        a.department_id,
        a.department_name
FROM
        departments a,
        employees b
WHERE
        a.department_id = b.department_id AND
        b.salary > 3000
ORDER BY a.department_name;

-- 오류남 수정할 것
SELECT
        a.department_id,
        a.department_name
FROM
        department_id a LEFT OUTER JOIN
        employee b ON(
                a.department_id = b.department_id )
WHERE b.salary > 3000
ORDER BY a.department_name;


/*
FULL OUTER JOIN
*/
CREATE TABLE HONG_A (EMP_ID NUMBER);
CREATE TABLE HONG_B (EMP_ID NUMBER);

INSERT INTO HONG_A VALUES(10);
INSERT INTO HONG_A VALUES(10);
INSERT INTO HONG_A VALUES(10);
INSERT INTO HONG_B VALUES(10);
INSERT INTO HONG_B VALUES(10);
INSERT INTO HONG_B VALUES(10);

COMMIT;

SELECT a.emp_id, b.emp_id
FROM hong_a a
FULL OUTER JOIN hong_b b
ON (a.emp_id = b.emp_id);

