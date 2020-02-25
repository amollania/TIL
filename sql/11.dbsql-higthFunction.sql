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


