-- 집합 연산자

CREATE TABLE exp_goods_asia (
       country VARCHAR2(10),
       seq     NUMBER,
       goods   VARCHAR2(80));

INSERT INTO exp_goods_asia VALUES ('한국', 1, '원유제외 석유류');
INSERT INTO exp_goods_asia VALUES ('한국', 2, '자동차');
INSERT INTO exp_goods_asia VALUES ('한국', 3, '전자집적회로');
INSERT INTO exp_goods_asia VALUES ('한국', 4, '선박');
INSERT INTO exp_goods_asia VALUES ('한국', 5, 'LCD');
INSERT INTO exp_goods_asia VALUES ('한국', 6, '자동차부품');
INSERT INTO exp_goods_asia VALUES ('한국', 7, '휴대전화');
INSERT INTO exp_goods_asia VALUES ('한국', 8, '환식탄화수소');
INSERT INTO exp_goods_asia VALUES ('한국', 9, '무선송신기 디스플레이 부속품');
INSERT INTO exp_goods_asia VALUES ('한국', 10,'철 또는 비합금강');

INSERT INTO exp_goods_asia VALUES ('일본', 1, '자동차');
INSERT INTO exp_goods_asia VALUES ('일본', 2, '자동차부품');
INSERT INTO exp_goods_asia VALUES ('일본', 3, '전자집적회로');
INSERT INTO exp_goods_asia VALUES ('일본', 4, '선박');
INSERT INTO exp_goods_asia VALUES ('일본', 5, '반도체웨이퍼');
INSERT INTO exp_goods_asia VALUES ('일본', 6, '화물차');
INSERT INTO exp_goods_asia VALUES ('일본', 7, '원유제외 석유류');
INSERT INTO exp_goods_asia VALUES ('일본', 8, '건설기계');
INSERT INTO exp_goods_asia VALUES ('일본', 9, '다이오드, 트랜지스터');
INSERT INTO exp_goods_asia VALUES ('일본', 10, '기계류');


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