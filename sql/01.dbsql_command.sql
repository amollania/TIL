-- SQL COMMAND
-- USER 만들기
CREATE USER [user_name]
IDENTIFIED BY [password] ;

-- USER에게 권한 주기
GRANT CONNECT TO [user_name] ;
GRANT DBA TO [user_name] ;
GRANT RESOURCE TO [user_name] ;

-- CHECK : 確認をして例外の場合エーラーがでる。
CREATE TABLE sample_table (
    num1    NUMBER
    CONSTRAINTS check1 CHECK (num1 BETWEEN 1 AND 9),
    gender VARCHAR2(10)
    CONSTRAINTS check2 CHECK (gender IN ('MALE', 'FEMALE'))
;
    
INSERT INTO ex2_9 VALUES (10, 'MAN');
INSERT INTO ex2_9 VALUES (5, 'FEMALE');

-- DEFAULT : もしカラームが'なし'の場合自動に入力
CREATE TABLE sample_table(
    Col1    VARCHAR2(10) NOT NULL,
    Col2    VARCHAR2(10) NULL,
    create_date DATE DEFAULT SYSDATE
);

-- DEFAULT データ挿入してみる
INSERT INTO sample_table (Col1, Col2, CREATE_DATE) VALUES ('AA', 'Ad', '20/01/21' );
-- DEFAULT 'CREATE_DATE'を何も書きなくて挿入してみる
INSERT INTO sample_table (Col1, Col2) VALUES ('AA', 'AB');
INSERT INTO sample_table (Col1, Col2) VALUES ('AA', 'AC');



-- データを修正(MODIFY)
ALTER TABLE sample_table RENAME COLUMN Col1 TO Col10;
DESC sample_table;

-- カラーム名挿入
ALTER TABLE sample_table ADD Col3 NUMBER;
DESC sample_table;

-- カラーム消し
ALTER TABLE sample_table DROP COLUMN Col3;
DESC sample_table;

-- データ消し
DROP TABLE sample_table;



-- またデータ作る練習
-- テーブル作る
CREATE TABLE INFO(
INFO_NO NUMBER CONSTRAINT pk PRIMARY KEY NOT NULL,
PC_NO VARCHAR2(10) UNIQUE NOT NULL,
NM VARCHAR2(10),
EMAIL VARCHAR2(50),
HOBBY VARCHAR(1000)
);

-- 作ったテーブルにコメントを追加
COMMENT ON COLUMN INFO.INFO_NO IS '番号';
COMMENT ON COLUMN INFO.PC_NO IS 'PC番号';
COMMENT ON COLUMN INFO.NM IS '名前';
COMMENT ON COLUMN INFO.EMAIL IS 'イーメル';
COMMENT ON COLUMN INFO.HOBBY IS '趣味';


-- またテーブル作る練習
-- テーブル制作
CREATE TABLE INFO2(
INFO_NO NUMBER CONSTRAINT pk PRIMARY KEY NOT NULL,
PC_NO VARCHAR2(10) UNIQUE NOT NULL,
NM VARCHAR2(10),
CAREER VARCHAR2(10),
HOBBY VARCHAR(1000)
);

INSERT INTO INFO2 (INFO_NO, PC_NO, NM, CAREER, HOBBY) VALUES(2106, 1004, '社員', 2, 'My hobby is Making computer');
INSERT INTO INFO2 (INFO_NO, PC_NO, NM, CAREER, HOBBY) VALUES(2110, 2001,'課長', 3, 'My hobby is Making collection');
INSERT INTO INFO2 (INFO_NO, PC_NO, NM, CAREER, HOBBY) VALUES(2101, 1005, '職人', 2, 'My hobby is swimming');
INSERT INTO INFO2 (INFO_NO, PC_NO, NM, CAREER, HOBBY) VALUES(2510, 1950, '部長', 3, 'My hobby is remake who is her goods');
INSERT INTO INFO2 (INFO_NO, PC_NO, NM, CAREER, HOBBY) VALUES(2104, 1521, '職人', 1, 'My hobby is swimming');



-- DATA選択
SELECT *
FROM INFO2;

SELECT
INFO_NO,
PC_NO,
CAREER
FROM INFO2;



-- DATA選択(+WHERE:条件)
SELECT *
FROM INFO2
WHERE PC_NO > 1500;
ORDER BY INFO_NO ASC;

SELECT *
FROM INFO2
WHERE PC_NO > 1500
AND NM = '職人';



-- UPDATE DATA SELECTED
UPDATE INFO
SET HOBBY = 'Work'
WHERE NM = '職人';



-- DELETE
DELETE INFO
WHERE NM = '職人';
-- ALL DELETE
DELETE INFO;
