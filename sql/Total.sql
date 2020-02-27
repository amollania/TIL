----------  계정 생성 

CREATE USER 생성유저명 IDENTIFIED BY 비밀번호 ;


----------  계정 권한

◆ DBA의 시스템 권한

 CREATE USER	 사용자를 생성할 수 있는 권한
 DROP USER	 사용자를 삭제할 수 있는 권한
 DROP ANY TABLE	 모든 테이블을 삭제할 수 있는 권한
 QUERY REWRITE	 함수기반인덱스를 생성하기 위한 권한
 BACKUP ANY TABLE	 Export 유틸리티를 사용해서 임의의 테이블을 백업할 수 있는 권한



◆ 일반 사용자의 시스템 권한

 CREATE SESSION	 데이터베이스에 접속할 수 있는 권한
 CREATE TABLE	 테이블을 생성할 수 있는 권한
 CREATE SEQUENCE	 시퀀스를 생성할 수 있는 권한
 CREATE VIEW	 뷰를 생성할 수 있는 권한
 CREATE PROCEDURE	 프로시저, 함수, 패키지를 생성할 수 있는 권한



◆ 롤(Roll)

다수 사용자와 다양한 권한을 효과적으로 관리하기 위하여 서로 관련된 권한을 그룹화한 개념이다. 
즉, 사용자별로 일일이 권한을 주기보다는 그룹에 권한을 주는 것이 훨씬 효과적이기 때문에 권한을 그룹화해서 관리하는 것이다.
롤은 쉽게 생각해서 권한들을 다발로 묶어놓은 것으로 생각하면 된다. 필요시 얼마든지 다양한 롤을 정의할 수 있다.

● CONNECT 롤
사용자가 데이터베이스에 접속하여 세션을 생성하거나 테이블 또는 뷰와 같은 객체를 생성할 수 있는 권한을 그룹화한 롤.

● RESOURCE 롤
사용자에게 자신의 테이블, 시퀀스, 프로시저, 트리거와 같은 객체를 생성할 수 있는 권한을 부여한 롤.

● DBA 롤
시스템 자원의 무제한적인 사용이나 시스템 관리에 필요한 모든 권한 그리고 DBA권한을 다른 사용자에게 부여할 수 있는 강력한 권한을 보유한 롤이다. 
또한 모든 사용자의 CONNECT, RESOURCE, DBA권한을 포함한 어떠한 권한을 부여하거나 철회할 수 있다.

CONNECT - ALTER SESSION, CREATE SESSION, CREATE DATABASE LINK, CREATE SEQUENCE, CREATE SESSION, CREATE SYNONYM, CREATE SESSION, CREATE VIEW
RESOURCE - CREATE CLUSTER/INDEXTYPE/OPERATOR/PROCEDURE/SEQUENCE/TABLE/

◆ 권한 할당
grant 권한 to 계정명;

◆ 권한 해제
revoke 권한 from 계정명;

---------- DBA 권한 빼고 모든권한주기 

GRANT CONNECT, RESOURCE TO 계정명 ; 


----------------------------------- 데이터베이스 객체 
테이블(table)   : 데이터를 담고 있는 객체 
                 DBMS 상에서 가장 기본적인 객체로 로우(행)컬럼(열)으로 구성된 2 차원 형태 (표)의 객체.
          
뷰(view)       : 하나 이상의 테이블을 연결해 마치 테이블인 것처럼 사용하는 객체
                 하나 이상의 테이블이나 다른 뷰의 데이터를 볼 수 있게 하는 데이터베이스 객체
                 실제 데이터는 뷰를 구성하는 테이블에 담겨 있지만 마치 테이블 처럼 사용 할 수 있다.
                 테이블 뿐만 아니라 다른 뷰를 참조해 새로운 뷰를 만들어 사용할 수 있다.
생성            : CREATE OR REPLACE 뷰이름 AS
                 SELECT 컬럼명2, 컬럼명3
                 FROM 테이블 ;

                 
인덱스(index)   : 테이블에 있는 데이터를 빨리 찾기 위한 용도의 데이터베이스 객체.

시노님(synonim)   : 데이터베이스 객체에 대한 별칭을 부여한 객체
          '동의어' 란 뜻으로 데이터베이스 객체는 각자 고유한 이름이 있는데 , 이 객체들에 대한 동의어를 만드는 것
          PUBLIC 과 PRIVATE 시노님이 있다.
          
시퀀스(sequence)   : 일련번호 채번을 할 때 사용되는 객체
                    sequence(시퀀스) 는 테이블과 독립적이므로 여러 곳에서 사용가능
                    pk를 설정할 후보키가 없거나, 특별히 의미 있게 만들지 않아도 되는 경우 또는 
                    자동으로 순서적인 번호가 필요한 경우 사용
          
함수(function)     :  특정연산을 하고 값을 반환하는 객체로 
                     프로시저와 동일하게 절차형 SQL을 활용
                     일련의 연산 처리 결과를 단일값으로 반환
                     DBMS에서 내장함수처럼 사용자 정의함수의 호출을 통해 실행
                     종료 시 단일값을 반환한다는 것과 클라이언트에서 실행되는 것이 프로시저와 가장 큰 차이점.
                     

프로시저(procedure) : 업무적으로 복잡한 구문을 별도의 구문을 작성하여 DB에 저장하고 실행가능
                     고유한 기능을 수행하는 함수와 유사하지만 함수와 다르게 리턴값이 없게 할 수 있으며 
                     서버에서 실행된다.
                     반환값이 없을 수 있기 때문에 SELECT 절에서 사용 할 수 없다.
            
패키지(pakage)     : 용도에맞게 함수나 프로시저를 하나로 묶어 놓은 객체

--------------------------------------------------------------------------------------------

트리거(TRIGGER) 의 개념 : 특정 테이블에 삽입, 수정, 삭제 등의 데이터 변경 이벤트가 발생하면
                        DBMS에서 자동적으로 실행되도록 구현된 프로그램을 트리거라고 한다. 
                        - 전체 행/ 개별 행으로 구분하여 작업 할 수 있다. 


** DML은 ( Data Manipulation Language ) 데이터 조작어

INSERT/UPDATE/DELETE/SELECT 

* DDL은 ( Data Definition Language ) 데이터 정의어

CREATE/ALTER/DROP/RENAME/TRUNCATE

DCL은 ( Data Control Languae ) 데이터 제의어

GRANT/REVOKE/




--------------  SQL 

-- DDL 

-- CREATE 
CREATE TABLE EX_M (
    MEM_ID     VARCHAR2(20)
   ,MEM_NAME   VARCHAR2(100)
   ,MEM_JOB    VARCHAR2(100)   
   ,MEM_MILEAGE   NUMBER
);

-- DROP
DROP TABLE EX_M ;
DROP TABLE EX_M CASCADE CONSTRAINTS;

-- ALTER 
ALTER TABLE EX_M RENAME COLUMN MEM_ID TO MEM_IDD; 
ALTER TABLE EX_M MODIFY MEM_IDD VARCHAR2(30); 
ALTER TABLE EX_M ADD MEM_IDD2 NUMBER; 
ALTER TABLE EX_M DROP COLUMN MEM_IDD2 ; 

-- TRUNCATE 
TRUNCATE TABLE EX_M;



-- DML -------------
-- SELECT

SELECT *
FROM CART;

SELECT *
FROM CART
WHERE CART_QTY  = 5;

SELECT *
FROM CART
ORDER BY CART_QTY DESC;


-- INSERT 

INSERT INTO EX_M VALUES ('leeapgil001','이앞길' ,'SW개발자', 1000000 );
INSERT INTO EX_M (MEM_ID, MEM_MILEAGE)VALUES ('leeapgil002', 1000000 );

-- UPDATE 

UPDATE EX_M 
SET MEM_MILEAGE = 500000000
WHERE MEM_ID = 'leeapgil001';

-- DELETE 

DELETE EX_M
WHERE MEM_ID = 'leeapgil002';

DELETE EX_M;

------ 그룹바이 

SELECT CART.CART_MEMBER
     , AVG(PROD.PROD_PRICE)
FROM CART, PROD
WHERE CART.CART_PROD = PROD.PROD_ID 
GROUP BY CART_MEMBER;


------ 분석함수 

SELECT CART_MEMBER
     , CART_PROD
     , ROW_NUMBER() OVER (PARTITION BY CART_MEMBER ORDER BY CART_PROD )  AS cart_rows        -- 그불별로 로우에 대한 순번반환(단순순번)
FROM CART;
