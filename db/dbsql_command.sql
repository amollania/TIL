-- SQL COMMAND
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