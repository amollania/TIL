SELECT ADD_MONTHS(TO_DATE('201812', 'YYYYMM'), LEVEL) AS "DT"
FROM DUAL CONNECT BY LEVEL <= 12;



SELECT
        DT,
        NVL(SPECIAL_SET, 0),
        NVL(PASTA, 0),
        NVL(PIZZA, 0),
        NVL(SEA_FOOD, 0),
        NVL(STEAK, 0),
        NVL(SALAD_BAR, 0),
        NVL(SANDWICH, 0),
        NVL(WINE, 0),
        NVL(JUICE, 0)
FROM (  
    SELECT TO_CHAR(ADD_MONTHS(TO_DATE('201612', 'YYYYMM'), LEVEL), 'YYYYMM') AS "DT"
    FROM DUAL CONNECT BY LEVEL <= 12) T1
    , (
        SELECT
                SUBSTR(A.reserv_date,1,6) 매출월, 
                SUM(DECODE(B.item_id,'M0001',B.sales,0)) SPECIAL_SET,
                SUM(DECODE(B.item_id,'M0002',B.sales,0)) PASTA,
                SUM(DECODE(B.item_id,'M0003',B.sales,0)) PIZZA,
                SUM(DECODE(B.item_id,'M0004',B.sales,0)) SEA_FOOD,
                SUM(DECODE(B.item_id,'M0005',B.sales,0)) STEAK,
                SUM(DECODE(B.item_id,'M0006',B.sales,0)) SALAD_BAR,
                SUM(DECODE(B.item_id,'M0007',B.sales,0)) SALAD,
                SUM(DECODE(B.item_id,'M0008',B.sales,0)) SANDWICH,
                SUM(DECODE(B.item_id,'M0009',B.sales,0)) WINE,
                SUM(DECODE(B.item_id,'M0010',B.sales,0)) JUICE
        FROM reservation A, order_info B
        WHERE A.reserv_no = B.reserv_no
        AND   A.cancel    = 'N'
        GROUP BY SUBSTR(A.reserv_date,1,6)
        ORDER BY SUBSTR(A.reserv_date,1,6)
        ) T2
WHERE T1.DT =NVL(T2.매출월(+), 0)
ORDER BY DT ASC;