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


