/*
계층형 쿼리
*/
SELECT
    department_id AS "부서번호",
    LPAD(' ', 3 * (LEVEL -1)) || department_name AS "부서명",
    LEVEL
FROM departments
START WITH parent_id IS NULL
CONNECT BY PRIOR department_id = parent_id;



/*
4, 5번 쿼리 모두 부서번호가 30일 건을 조회하고 있지만 5번 쿼리에는 CONECT BY 절에 조건을 준다.
4번 쿼리와 다르게 두 번째 쿼리에서는 부서번호가 90인 최상위 부서도 조회된다.

조회 절차를 보면
1. JOIN이 잇으면 JOIN 먼저 처리
2. START WITH 절을 참조해 최상위 계층 로우를 선택
3. CONNECT BY 절에 명시된 구문에 따라 계층형 관계 (부모-자식) 관계를 파악해 자식 로우를 차례로 선택
4. 자식 로우 찾기가 끝나면 JOIN 조건을 제외한 WHERE 조건에 해당하는 로우를 걸러낸다.
*/

SELECT department_id, LPAD(' ', 3 * (LEVEL-1)) || department_name, LEVEL
FROM departments
START WITH parent_id IS NULL
CONNECT BY PRIOR department_id = parent_id
ORDER BY department_name; -- 계층형 트리가 깨짐

SELECT department_id, LPAD(' ', 3 * (LEVEL-1)) || department_name, LEVEL
FROM departments
START WITH parent_id IS NULL
CONNECT BY PRIOR department_id = parent_id
ORDER BY parent_id ASC;



SELECT
    department_id,
    LPAD(' ', 3 * (LEVEL-1)) || department_name,
    LEVEL,
    CONNECT_BY_ISLEAF
FROM
    departments
START WITH parent_id IS NULL
CONNECT BY PRIOR department_id = parent_id;

SELECT
    department_id,
    LPAD(' ', 3 * (LEVEL-1)) || department_name,
    LEVEL,
    SYS_CONNECT_BY_PATH(department_name, '|')
FROM
    departments
START WITH parent_id IS NULL
CONNECT BY PRIOR department_id = parent_id;

SELECT
    department_id,
    LPAD(' ', 3 * (LEVEL-1)) || department_name,
    LEVEL,
    SYS_CONNECT_BY_PATH(department_name, '/')
FROM
    departments
START WITH parent_id IS NULL
CONNECT BY PRIOR department_id = parent_id;



/*
CONNECT BY 절을 이용하여 계층 질의에서 상위계층(부모행)과 하위계층(자식행)의 관계를 규정할 수 있다.
PRIOR 연산자와 함께 사용하여 계층 구조로 표현할 수 있다.

CONNECT BY PRIOR 자식컬럼 = 부모컬럼 : 부모에서 자식으로 트리구성(Top Down)
CONNECT BY PRIOR 부모커럼 = 자식컬럼 : 자식에서 부모로 트리 구성(Bottom UP)
CONNECT BY NOCYCLE PRIOR : NOCYCLE 파라미터를 이용하여 무한푸르 방지

서브쿼리를 사용할 수 없다.
*/

SELECT
    department_id,
    lpad(' ', (level - 1) * 3) || department_name,
    parent_id,
    level as lvl
FROM departments
START WITH department_id = 90
CONNECT BY department_id = PRIOR parent_id; -- BOTTOM -> TOP
-- CONNECT BY PRIOR department_id = parent_id; -- TOP -> BOTTOM



/*
계층형 쿼리 응용
샘플 데이터 생성
*/
SELECT level
FROM DUAL
CONNECT BY LEVEL <= 12;

SELECT LPAD(level, 2, '0') lv
FROM DUAL
CONNECT BY LEVEL <= 12;

SELECT ADD_MONTHS(TO_DATE('201812', 'YYYYMM'), LEVEL) AS "DT"
FROM DUAL CONNECT BY LEVEL <= 12