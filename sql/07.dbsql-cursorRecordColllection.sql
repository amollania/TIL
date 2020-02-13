SET SERVEROUTPUT ON 
SET TIMING ON
-- 묵시적 커서와 커서속성
/**
    커서란 특정 SQL문장을 처리한 결과를 담고 있는 영역(PRIVATE SQL 이라는 메모리 영역)을 가리키는 일종의 포인터로, 
    커서를 사용하면 처리된 SQL 문장의 결과 집합에 접근할 수 있다. 
    
    개별 로우에 순차적으로 접근이 가능하다.
    
    종류 
    1. 묵시적 커서 (오라클 내부에서 자동생성) PL/SQL 블로에서 실행하는 SQL 문장( INSERT, UPDATE, SELECT .. ) 이 실행될 때마다 자동으로 생성.
    2. 명시적 커서 (사용자가 직접 정의)
    
    순서 open -> fetch -> close 
    명시적은 선언도 필요 
*/

/* 묵시적 커서 */
DECLARE 
    vn_department_id employees.department_id%TYPE := 80;
BEGIN
	-- 80번 부서의 사원이름을 자신의 이름으로 갱신
	UPDATE employees
	    SET emp_name = emp_name
	WHERE department_id = vn_department_id;	   
	   
	-- 몇 건의 데이터가 갱신됐는지 출력  없으면 0을 반환
	DBMS_OUTPUT.PUT_LINE('묵시적 커서 :'||SQL%ROWCOUNT); 
	COMMIT;
END;


/* 명시적 커서 */
DECLARE
    -- 사원명을 받아오기 위한 변수 선언
    vs_emp_name employees.emp_name%TYPE;
    --1.단계 커서 선언 : 명칭과 사용 쿼리 선언 매개변수로 부서코드를 받는다.
    -- CURSOR 커서명(매개변수1, 매개변수2, ..)
    CURSOR cur_emp_dep ( cp_department_id employees.department_id%TYPE )
    IS

    SELECT emp_name
    FROM employees
    WHERE department_id = cp_department_id;

BEGIN
	--2.단계 커서 오픈 (매개변수로 90번 부서를 전달)
	OPEN cur_emp_dep (90);

	--3.단계 패치 단계에서 커서 사용
	LOOP

    -- 반복문을 통한 커서 패치작업
	-- 커서 결과로 나온 로우를 패치함 (사원명을 변수에 할당)
	FETCH cur_emp_dep INTO vs_emp_name;
	-- 더 이상 패치된 참조로우가 없는 경우 LOOP 탈출
	EXIT WHEN cur_emp_dep%NOTFOUND;
	-- 사원명을 출력
	DBMS_OUTPUT.PUT_LINE(vs_emp_name);
    END LOOP;
  --4.단계 커서 닫기
  CLOSE cur_emp_dep;
END;
	
	
-- 커서와 FOR문
--3
DECLARE
   -- 커서 선언, 매개변수로 부서코드를 받는다.
   CURSOR cur_emp_dep ( cp_department_id employees.department_id%TYPE )

   IS
   SELECT emp_name
     FROM employees
    WHERE department_id = cp_department_id;

BEGIN
	-- FOR문을 통한 커서 패치작업 ("초깃값.. 최종값" 대신 커서가 위치한다)
	-- FOR 레코드 IN 커서명(매개변수1, 매개변수2,...) 

	FOR emp_rec IN cur_emp_dep(90)
	LOOP
	  -- 사원명을 출력, 레코드 타입은 레코드명.컬럼명 형태로 사용
	  DBMS_OUTPUT.PUT_LINE(emp_rec.emp_name);
  END LOOP;
END;

--FOR문에 직접 커서 정의 넣을 수 있다. 
--4
DECLARE
BEGIN
	-- FOR문을 통한 커서 패치작업 ( 커서 선언시 정의 부분을 FOR문에 직접 기술)
	FOR emp_rec IN
        ( SELECT emp_name
                         FROM employees
                         WHERE department_id = 90	
	    ) 
	LOOP
	  -- 사원명을 출력, 레코드 타입은 레코드명.컬럼명 형태로 사용
	  DBMS_OUTPUT.PUT_LINE(emp_rec.emp_name);
	END LOOP;
END;

/**
 명시적 커서는 "CURSOR 커서명 IS SELECT ..." 형태로 선언한 뒤, '커서명'을 참조해서 사용했다. 
 즉 명시적 커서를 사용할 때는 커서명을 마치 변수처럼 사용했는데, 정확히 말하면 
 변수라기보다는 '상수'라고 할 수 있다. 
 커서를 변수처럼 할당한뒤 다시 다른 값을 할당해서 사용하려면 커서변수를 사용해야한다. 
**/
--5
DECLARE
   -- 사원명을 받아오기 위한 변수 선언
   vs_emp_name employees.emp_name%TYPE;

   TYPE emp_dep_curtype IS REF CURSOR;                               -- 약한 커서타입 선언 
-- TYPE emp_dep_curtype IS REF CURSOR RETURN departments%ROWTYPE;    -- 강한 커서타입 선언 (집합을 고정해서)
   -- 커서변수 선언
   emp_dep_curvar emp_dep_curtype; -- 커서변수 선언
BEGIN
  -- 커서변수를 사용한 커서정의 및 오픈
  OPEN emp_dep_curvar FOR SELECT emp_name
                          FROM employees
                          WHERE department_id = 90	;
  -- LOOP문
  LOOP
     -- 커서변수를 사용해 결과집합을  vs_emp_name 변수에 할당 
     FETCH emp_dep_curvar INTO vs_emp_name;
	  -- 더 이상 패치된 참조로우가 없는 경우 LOOP 탈출(커서변수를 이용한 커서속성 참조)
	  EXIT WHEN emp_dep_curvar%NOTFOUND;
	  -- 사원명을 출력
	  DBMS_OUTPUT.PUT_LINE(vs_emp_name);
  END LOOP;
  CLOSE emp_dep_curvar;
END;

--6------------------------------------------------------------------------------------
DECLARE
   -- 사원명을 받아오기 위한 변수 선언
   vs_emp_name employees.emp_name%TYPE;
   -- SYS_REFCURSOR 타입의 커서변수 선언
   -- oracle 에서 제공하는 커서타입
   emp_dep_curvar SYS_REFCURSOR;
BEGIN
  -- 커서변수를 사용한 커서정의 및 오픈
  OPEN emp_dep_curvar FOR SELECT emp_name
                     FROM employees
                    WHERE department_id = 90;
  -- LOOP문
  LOOP
     -- 커서변수를 사용해 결과집합을  vs_emp_name 변수에 할당 
     FETCH emp_dep_curvar INTO vs_emp_name;
	  -- 더 이상 패치된 참조로우가 없는 경우 LOOP 탈출(커서변수를 이용한 커서속성 참조)
	  EXIT WHEN emp_dep_curvar%NOTFOUND;
	  -- 사원명을 출력
	  DBMS_OUTPUT.PUT_LINE(vs_emp_name);
  END LOOP;
  CLOSE emp_dep_curvar;
END;

-- 커서변수를 매개변수로 전달
--7----------------------------------------------------------------------------------------------
DECLARE
    -- (ⅰ) SYS_REFCURSOR 타입의 커서변수 선언
   emp_dep_curvar SYS_REFCURSOR;
    -- 사원명을 받아오기 위한 변수 선언
   vs_emp_name employees.emp_name%TYPE;

   -- (ⅱ) 커서변수를 매개변수르 받는 프로시저, 매개변수는 SYS_REFCURSOR 타입의 IN OUT형
   PROCEDURE test_cursor_argu ( p_curvar IN OUT SYS_REFCURSOR)
   IS
       c_temp_curvar SYS_REFCURSOR;
   BEGIN
       -- 커서를 오픈한다
       OPEN c_temp_curvar FOR 
             SELECT emp_name
               FROM employees
             WHERE department_id = 90;
        -- (ⅲ) 오픈한 커서를 IN OUT 매개변수에 다시 할당한다. 
        p_curvar := c_temp_curvar;
   END;

BEGIN
   -- 프로시저를 호출한다. 
   test_cursor_argu (emp_dep_curvar);
   -- (ⅳ) 전달해서 받은 매개변수를 LOOP문을 사용해 결과를 출력한다. 
   LOOP
     -- 커서변수를 사용해 결과집합을  vs_emp_name 변수에 할당 
     FETCH emp_dep_curvar INTO vs_emp_name;
	  -- 더 이상 패치된 참조로우가 없는 경우 LOOP 탈출(커서변수를 이용한 커서속성 참조)
	  EXIT WHEN emp_dep_curvar%NOTFOUND;
	  -- 사원명을 출력
	  DBMS_OUTPUT.PUT_LINE(vs_emp_name);
  END LOOP;
END;

--8
------------------------------------------------------------------------------------------------------
CREATE  PROCEDURE test_cursor_argu ( p_curvar IN OUT SYS_REFCURSOR)
   IS
       c_temp_curvar SYS_REFCURSOR;
   BEGIN
       -- 커서를 오픈한다
       OPEN c_temp_curvar FOR 
             SELECT emp_name
               FROM employees
             WHERE department_id = 90;
        -- (ⅲ) 오픈한 커서를 IN OUT 매개변수에 다시 할당한다. 
        p_curvar := c_temp_curvar;
   END;

-- 위에 프로시져를 아래와 같이 사용가능 -------------------------------------------------
DECLARE
    -- (ⅰ) SYS_REFCURSOR 타입의 커서변수 선언
   emp_dep_curvar SYS_REFCURSOR;
    -- 사원명을 받아오기 위한 변수 선언
   vs_emp_name employees.emp_name%TYPE;
   -- (ⅱ) 커서변수를 매개변수르 받는 프로시저, 매개변수는 SYS_REFCURSOR 타입의 IN OUT형
BEGIN
   -- 프로시저를 호출한다. 
   test_cursor_argu (emp_dep_curvar);
   -- (ⅳ) 전달해서 받은 매개변수를 LOOP문을 사용해 결과를 출력한다. 
   LOOP
     -- 커서변수를 사용해 결과집합을  vs_emp_name 변수에 할당 
     FETCH emp_dep_curvar INTO vs_emp_name;
	  -- 더 이상 패치된 참조로우가 없는 경우 LOOP 탈출(커서변수를 이용한 커서속성 참조)
	  EXIT WHEN emp_dep_curvar%NOTFOUND;
	  -- 사원명을 출력
	  DBMS_OUTPUT.PUT_LINE(vs_emp_name);
  END LOOP;
END;

-- 커서 표현식 ----------------------------------------------------------------------------------------------
SELECT ( SELECT department_name
             FROM departments d
            WHERE e.department_id = d.department_id) AS dep_name,  
       e.emp_name         
  FROM employees e
 WHERE e.department_id = 90;
 
-------- 단일 행 하위 질의에 2개 이상의 행이 리턴되었습니다.
  SELECT d.department_name,      
        ( SELECT e.emp_name
             FROM employees e
            WHERE e.department_id = d.department_id) AS emp_name        
  FROM departments d
 WHERE d.department_id = 90;
----------------------------------------------------------
 
SELECT d.department_name,      
         CURSOR ( SELECT e.emp_name
                  FROM employees e
                  WHERE e.department_id = d.department_id) AS emp_name        
 FROM departments d
WHERE d.department_id = 90;

DECLARE
    -- 커서표현식을 사용한 명시적 커서 선언
    CURSOR mytest_cursor IS
         SELECT d.department_name,      
                  CURSOR ( SELECT e.emp_name
                                 FROM employees e
                                WHERE e.department_id = d.department_id) AS emp_name        
          FROM departments d
        WHERE d.department_id = 90;
    -- 부서명을 받아오기 위한 변수
    vs_department_name departments.department_name%TYPE;
    --커서표현식 결과를 받기 위한 커서타입변수
    c_emp_name SYS_REFCURSOR;
    -- 사원명을 받는 변수
    vs_emp_name employees.emp_name%TYPE;
BEGIN
    -- 커서오픈
    OPEN mytest_cursor;
    -- 명시적 커서를 받아오는 첫 번째 LOOP
    LOOP
       -- 부서명은 변수, 사원명 결과집합은 커서변수에 패치
       FETCH mytest_cursor INTO vs_department_name, c_emp_name;
       EXIT WHEN mytest_cursor%NOTFOUND;
       DBMS_OUTPUT.PUT_LINE ('부서명 : ' || vs_department_name);
       -- 사원명을 출력하기 위한 두 번째 LOOP 
       LOOP
          -- 사원명 패치
          FETCH c_emp_name INTO vs_emp_name;
          EXIT WHEN c_emp_name%NOTFOUND;
          DBMS_OUTPUT.PUT_LINE('   사원명 : ' || vs_emp_name);
       END LOOP; -- 두 번째 LOOP 종료    
    END LOOP; -- 첫 번째 LOOP 종료
    CLOSE mytest_cursor;
END;



/**
 PL/SQL 에서 제공하는 데이터 타입 중 하나로, 문자형, 숫자형 같은 기본 타입과 달리 복합형 구조이다
 일반 변수는 한 번에 하나의 값만 가질 수 있지만 
 레코드는 여러 개의 값을 가질 수 있다. 
 
 테이블과 흡사하며, 여러 개의 컬럼을 각기 다른 테이터 타입으로 선언해서 사용할 수 있다 (하지만 로우는 1개) 1개이상을 쓰려면 컬렉션사용. 
*/
DECLARE
  -- 부서레코드 타입선언
   TYPE depart_rect IS RECORD (
         department_id     NUMBER(6),
         department_name   VARCHAR2(80),
         parent_id         NUMBER(6),
         manager_id        NUMBER(6)   
   );
   
  -- 위에서 선언된 타입으로 레코드 변수 선언  
   vr_dep depart_rect;

BEGIN
 ...
END;


DECLARE
  -- 부서레코드 타입선언
   TYPE depart_rect IS RECORD (
         department_id     departments.department_id%TYPE,
         department_name  departments.department_name%TYPE, 
         parent_id          departments.parent_id%TYPE,
         manager_id        departments.manager_id%TYPE
   );
   
  -- 위에서 선언된 타입으로 레코드 변수 선언  
   vr_dep depart_rect;
BEGIN
-- …
END;


--1
----------------------------------------------------------------------------------------------------------------
DECLARE
  -- 부서레코드 타입선언
   TYPE depart_rect IS RECORD (
         department_id     departments.department_id%TYPE,
         department_name  departments.department_name%TYPE, 
         parent_id          departments.parent_id%TYPE,
         manager_id        departments.manager_id%TYPE
   );
   
  -- 위에서 선언된 타입으로 레코드 변수 선언  
   vr_dep depart_rect;
  -- 두 번째 변수 선언 
   vr_dep2 depart_rect;
BEGIN

   vr_dep.department_id := 999;
   vr_dep.department_name := '테스트부서';
   vr_dep.parent_id := 100;
   vr_dep.manager_id := NULL;
   
   -- 두 번째 변수에 첫 번째 레코드변수 대입
   vr_dep2 := vr_dep;
   
   DBMS_OUTPUT.PUT_LINE( 'vr_dep2.department_id :' || vr_dep2.department_id);
   DBMS_OUTPUT.PUT_LINE( 'vr_dep2.department_name :' ||  vr_dep2.department_name);
   DBMS_OUTPUT.PUT_LINE( 'vr_dep2.parent_id :' ||  vr_dep2.parent_id);
   DBMS_OUTPUT.PUT_LINE( 'vr_dep2.manager_id :' ||  vr_dep2.manager_id);
END;

--2
----------------------------------------------------------------------------------------------------------------
DECLARE
  -- 부서레코드 타입선언
   TYPE depart_rect IS RECORD (
         department_id     departments.department_id%TYPE,
         department_name  departments.department_name%TYPE, 
         parent_id          departments.parent_id%TYPE,
         manager_id        departments.manager_id%TYPE
   );
  -- 위에서 선언된 타입으로 레코드 변수 선언  
   vr_dep depart_rect;
  -- 두 번째 변수 선언 
   vr_dep2 depart_rect;
BEGIN
   vr_dep.department_id := 999;
   vr_dep.department_name := '테스트부서';
   vr_dep.parent_id := 100;
   vr_dep.manager_id := NULL;
   -- 두 번째 변수의 department_name에만 할당 
   vr_dep2.department_name := vr_dep.department_name;
   
   DBMS_OUTPUT.PUT_LINE( 'vr_dep2.department_id :' || vr_dep2.department_id);
   DBMS_OUTPUT.PUT_LINE( 'vr_dep2.department_name :' ||  vr_dep2.department_name);
   DBMS_OUTPUT.PUT_LINE( 'vr_dep2.parent_id :' ||  vr_dep2.parent_id);
   DBMS_OUTPUT.PUT_LINE( 'vr_dep2.manager_id :' ||  vr_dep2.manager_id);
END;

--3
----------------------------------------------------------------------------------------------------------------
CREATE TABLE ch11_dep AS
SELECT department_id, department_name, parent_id, manager_id
  FROM DEPARTMENTS ;
  
TRUNCATE TABLE   ch11_dep;
  
 DECLARE
  -- 부서레코드 타입선언
   TYPE depart_rect IS RECORD (
         department_id     departments.department_id%TYPE,
         department_name  departments.department_name%TYPE, 
         parent_id          departments.parent_id%TYPE,
         manager_id        departments.manager_id%TYPE
   );
   
  -- 위에서 선언된 타입으로 레코드 변수 선언  
   vr_dep depart_rect;

BEGIN

   vr_dep.department_id := 999;
   vr_dep.department_name := '테스트부서';
   vr_dep.parent_id := 100;
   vr_dep.manager_id := NULL;
   
   -- 레코드 필드를 명시해서 INSERT
   INSERT INTO ch11_dep VALUES ( vr_dep.department_id, vr_dep.department_name, vr_dep.parent_id, vr_dep.manager_id);
   
   -- 레코드 필드 순서와 개수, 타입이 같다면 레코드변수명으로만 INSERT 가능
   INSERT INTO ch11_dep VALUES vr_dep;
   COMMIT;
END;
--4
----------------------------------------------------------------------------------------------------------------
CREATE TABLE ch11_dep2 AS
SELECT *
  FROM DEPARTMENTS;

TRUNCATE TABLE   ch11_dep2;



-- 테이블형 레코드 
DECLARE
  -- 테이블형 레코드 변수 선언
  -- ROWTYPE TYPE 입력만으로 테이블 타입을 모조리 끌어온다.
   vr_dep departments%ROWTYPE;

BEGIN
   -- 부서 테이블의 모든 정보를 레코드 변수에 넣는다. 
   SELECT *
     INTO vr_dep
     FROM departments
    WHERE department_id = 20;
   -- 레코드 변수를 이용해 ch11_dep2 테이블에 데이터를 넣는다. 
   INSERT INTO ch11_dep2 VALUES vr_dep;
   COMMIT;
END;

--5
----------------------------------------------------------------------------------------------------------------
-- 커서형 레코드 
DECLARE
  -- 커서 선언
   CURSOR c1 IS
       SELECT department_id, department_name, parent_id, manager_id
         FROM departments;       
   -- 커서형 레코드변수 선언  
   vr_dep c1%ROWTYPE;
BEGIN
   -- 데이터 삭제 
   DELETE ch11_dep;
   -- 커서 오픈 
   OPEN c1;
   -- 루프를 돌며 vr_dep 레코드 변수에 값을 넣고, 다시 ch11_dep에 INSERT
   LOOP
     FETCH c1 INTO vr_dep;
     EXIT WHEN c1%NOTFOUND;
     -- 레코드 변수를 이용해 ch11_dep2 테이블에 데이터를 넣는다. 
     INSERT INTO ch11_dep VALUES vr_dep;
   END LOOP;
   COMMIT;
END;

--6
----------------------------------------------------------------------------------------------------------------
DECLARE
   -- 레코드 변수 선언 
   vr_dep ch11_dep%ROWTYPE;

BEGIN
 
   vr_dep.department_id := 20;
   vr_dep.department_name := '테스트';
   vr_dep.parent_id := 10;
   vr_dep.manager_id := 200;
     
   -- ROW를 사용하면 해당 로우 전체가 갱신됨
     UPDATE ch11_dep
          SET ROW = vr_dep
      WHERE department_id = vr_dep.department_id; 
   
   COMMIT;
END;


-- 중첩 레코드
--7
----------------------------------------------------------------------------------------------------------------
DECLARE
  -- 부서번호, 부서명을 필드로 가진 dep_rec 레코드 타입 선언 
  TYPE dep_rec IS RECORD (
        dep_id      departments.department_id%TYPE,
        dep_name departments.department_name%TYPE );
        
  --사번, 사원명 그리고 dep_rec(부서번호, 부서명) 타입의 레코드 선언 
  TYPE emp_rec IS RECORD (
        emp_id      employees.employee_id%TYPE,
        emp_name employees.emp_name%TYPE,
        dep          dep_rec                          );
        
   --  emp_rec 타입의 레코드 변수 선언 
   vr_emp_rec emp_rec;
BEGIN
   -- 100번 사원의 사번, 사원명, 부서번호, 부서명을 가져온다. 
   SELECT a.employee_id, a.emp_name, a.department_id, b.department_name
     INTO vr_emp_rec.emp_id, vr_emp_rec.emp_name, vr_emp_rec.dep.dep_id, vr_emp_rec.dep.dep_name
     FROM employees a, 
             departments b
    WHERE a.employee_id = 100
       AND a.department_id = b.department_id;
       
    -- 레코드 변수 값 출력    
    DBMS_OUTPUT.PUT_LINE('emp_id : ' ||  vr_emp_rec.emp_id);
    DBMS_OUTPUT.PUT_LINE('emp_name : ' ||  vr_emp_rec.emp_name);
    DBMS_OUTPUT.PUT_LINE('dep_id : ' ||  vr_emp_rec.dep.dep_id);
    DBMS_OUTPUT.PUT_LINE('dep_name : ' ||  vr_emp_rec.dep.dep_name);
END;
--------------------------------------------------------------------------------------------------------------------------------------------------------------------- 레코드 끝
