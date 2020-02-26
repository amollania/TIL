/*
NTILE(expr) 함수는 파티션 별로 expr에 명시된 값만큼 분할한 결과를 반환
그룹을 expr 만큼 분할(분할하는 수를 버킷(bucket) 수라고 하며 ex) NTILE(4) 해당 로우수에서 4개로 분할
*/
SELECT *
FROM
    (
    SELECT
        employee_id,
        emp_name,
        salary,
        department_id,
        NTILE(4) over (partition by department_id order by salary) cd
FROM employees)
WHERE cd = 1;



/*
부서별 급여를 10분위로 나누었을 때 1분위에 속하는 직원만 조회
*/
SELECT *
FROM
    (
    SELECT
        employee_id,
        emp_name,
        salary,
        department_id,
        NTILE(10) over (partition by department_id ORDER BY salary DESC) cd
    FROM
        employees
    )
WHERE cd = 1;



/*
주어진 그룹과 순서에 따라 로우에 있는 값을 참조할 때 사용
LAG 선행로우 값을 가져와서 반환, LEAD 후행 로우 값을 가져와서 반환
LAG(expr, offset, default_value) 선행 로우 값
offset : 디폴트 1, 2로 하면 2개의 로우씩 계산 default_value : 참조 로우가 없을 때,
LEAD(expr, offset, default_value) 후행 로우값
offset : 선행과 후행 로우간의 간격
default_value는 로우가 없을 때 나오는 값
*/
SELECT
    employee_id,
    emp_name,
    salary,
    department_id,
    hire_date,
    LAG(emp_name, 1, '가장 높음') over (partition by department_id ORDER BY salary DESC) ap_emp_neme,
    LEAD(emp_name, 1, '아래') over(partition by department_id ORDER BY salary DESC) ap_emp_name2
FROM employees
WHERE department_id IN (10, 60);



/* Pratice */
WITH
    T1 AS
    (
        SELECT
            REGION,
            SUM(LOAN_JAN_AMT) AS REGION_SUM
        FROM KOR_LOAN_STATUS
        GROUP BY REGION
    ),
    T2 AS
    (
        SELECT
            T1.REGION AS 가장많은,
            T1.REGION_SUM AS 가장많은지역,
            LEAD(T1.REGION, 1, '가장 낮음') OVER (ORDER BY T1.REGION_SUM DESC) AS 두번째지역,
            LEAD(T1.REGION_SUM, 1, 0) OVER (ORDER BY T1.REGION_SUM DESC) AS 두번째지역금액,
            RANK() OVER (ORDER BY T1.REGION_SUM DESC) REGION_RANK
        FROM T1
    )
SELECT
    T2.가장많은,
    T2.가장많은지역,
    T2.두번째지역,
    T2.두번째지역금액
FROM T2
WHERE REGION_RANK =1;

/* Pratice2 */
SELECT
    T2.가장많은,
    T2.가장많은지역,
    T2.두번째지역,
    T2.두번째지역금액
FROM
    (
        SELECT
            T1.REGION AS 가장많은,
            T1.REGION_SUM AS 가장많은지역,
            LEAD(T1.REGION, 1, '가장 낮음') OVER (ORDER BY T1.REGION_SUM DESC) AS 두번째지역,
            LEAD(T1.REGION_SUM, 1, 0) OVER (ORDER BY T1.REGION_SUM DESC) AS 두번째지역금액,
            RANK() OVER (ORDER BY T1.REGION_SUM DESC) REGION_RANK
        FROM
            (
                SELECT
                    REGION,
                    SUM(LOAN_JAN_AMT) AS REGION_SUM
                FROM
                    KOR_LOAN_STATUS
                GROUP BY REGION
            ) T1
    ) T2
WHERE T2.REGION_RANK =1;



/* Window 절 */
/* example 1 */
SELECT department_id, emp_name, hire_date, salary,
SUM(salary) OVER
    (
    PARTITION BY department_id ORDER BY hire_date
    ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) AS all_salary,
    -- 부서별, 일자순, 시작 위치가 부서별 입사일자가 가장 빠른 사워, ~ 끝위치는 입사일자가 가장 최근인 사원이 되고
    -- 부서별 급여 총합이 모든 로우에 걸쳐 출력.
    
    SUM(salary) OVER
    (
        PARTITION BY department_id ORDER BY hire_date
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS first_current_sal,
    -- 가장 입사가 빠른 사원부터 현재 로우까지 즉 사원별 급여의 누적 합계가 계산된다.

    SUM(salary) OVER
    (
        PARTITION BY department_id ORDER BY hire_date
        ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING
    ) AS current_end_sal
    -- 현재 로우부터 입사가 가장 높은 사원까지 급여 총합계가 계산되어 누적 합계가 역으로 산출된다.
FROM
    employees
WHERE
    department_id IN(30, 90);



/* example 2 */
SELECT
    hire_date,
    salary,
    SUM(salary) OVER (
            ORDER BY hire_date
            ROWS BETWEEN 3 preceding AND 1 preceding
        ) AS precdeing_3_1,
        -- 3행 이전부터 1행 이전까지
    SUM(salary) OVER (
            ORDER BY hire_date
            ROWS BETWEEN 1 FOLLOWING AND 3 FOLLOWING
        ) AS following_1_3
        -- 1행 이후부터 3행 이후까지
FROM
    employees
WHERE
    department_id IN (90, 60);



/* example 3 */
SELECT
    department_id, emp_name, hire_date, salary,
    SUM(salary) OVER (
        PARTITION BY department_id ORDER BY hire_date
        RANGE 365 PRECEDING
    ) AS range_sal1,
    -- 365 PRECEDING order by 절에서 사용한 컬럼 값에 대해 상수로 범위를 줄일 수 있다.
    -- 입사 일자로 정렬을 했으므로 365 PRECEDING은 각 로우의 입사일 기준 365일, 즉 1년 이하에
    -- 속하는 입사일을 가진 로우가 시작 위치가 된다.
    
    SUM(salary) OVER (
        PARTITION BY department_id ORDER BY hire_date
        RANGE BETWEEN 365 PRECEDING AND CURRENT ROW
    ) AS range_sal2
    -- between이 있지만 끝 위치가 현재 로우이므로 range_sal1과 동일하다.
FROM
    employees
WHERE
    department_id IN (30, 90);



-- FIRST_VALUE(expr) 주어진 그룹 상에서 가장 첫 번째 값.
SELECT department_id, emp_name, hire_date, salary,
    FIRST_VALUE(salary) OVER (
        PARTITION BY department_id ORDER BY hire_Date
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) AS all_salary,
    
    FIRST_VALUE(salary) OVER (
        PARTITION BY department_id ORDER BY hire_Date
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS fr_st_to_current_sal,
    
    FIRST_VALUE(salary) OVER (
        PARTITION BY department_id ORDER BY hire_Date
        ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING
    ) AS fr_current_to_end_sal
FROM employees
WHERE department_id IN(30, 90);



-- NTH_VALUE(expr, n) 함수는 주어진 그룹에서  n번째 로우에 해당하는 expr 값을 변환.
 SELECT department_id, emp_name, hire_date, salary,
    NTH_VALUE(salary, 2) OVER (
        PARTITION BY department_id ORDER BY hire_Date
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) AS all_salary,
    
    NTH_VALUE(salary, 2) OVER (
        PARTITION BY department_id ORDER BY hire_Date
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS fr_st_to_current_sal,
    
    NTH_VALUE(salary, 2)  OVER (
        PARTITION BY department_id ORDER BY hire_Date
        ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING
    ) AS fr_current_to_end_sal
FROM employees
WHERE department_id IN(30, 90);



/*
기타 분석 함수
WIDTH_BUCKET(expr, min_value, max_value, num_buckets)
expr : 값에
min_value : 최소값
max_value : 최대값을 주어
num_buckets : 수만큼 분할.
NTILE 처럼 분할 결과를 반환하는데, 다른점으로는 expr 값에 따라 분할
*/
SELECT
    department_id,
    emp_name,
    salary,
    NTILE(4) OVER (PARTITION BY department_id ORDER BY salary) NTILES,
    WIDTH_BUCKET(salary, 1000, 10000, 4) widthbucket
FROM employees
WHERE department_id = 60;



/*
RATIO_TOREPORT(expr) 주어진 그룹에 대해 expr 값의 합을 기준으로 각 로우의 상대적 비율을 반환.
*/
SELECT department_id, emp_name, hire_date, salary,
    RATIO_TO_REPORT(salary) OVER (PARTITION BY department_id) AS salary_percent1,
    ROUND(RATIO_TO_REPORT(salary) OVER (PARTITION BY department_id), 2) * 100 AS salary_percent2
FROM
    employees
WHERE
    department_id IN (30, 90);


/* Example */
WITH basis AS ( SELECT WIDTH_BUCKET(TO_CHAR(SYSDATE, 'YYYY') - b.cust_year_of_birth, 10, 110, 10) AS old_seg,
    TO_CHAR(SYSDATE, 'YYYY') - b.cust_year_of_birth AS olds,
    s.amount_sold
    FROM sales s,
    customers b
    WHERE s.sales_month = '200112'
    AND s.cust_id = b.cust_id
    ), real_date AS (
        SELECT old_seg * 10 AS old_segment,
        SUM(amount_sold ) AS old_seg_amt
        FROM basis
        GROUP BY old_seg ), t1 AS (SELECT level * 10 AS cnt_year FROM DUAL CONNECT BY LEVEL <=10)
        SELECT t1.cnt_year || '대',
        nvl(real_date.old_seg_amt, 0 )
        FROM real_date.old_segment(+) -t1.cnt_year
    ORDER BY t1.cnt_year;



    