 문제 1 
 
 전체 상품의 총 판매량과 총 매출액, 전용 상품의 판매량과 매출액을 출력하시오 
 
 reservation, order_info 테이블을 활용하여 
 온라인 전용상품의 총매출을 구하시오 
 예약이 취소건은 제외 
 ------------------------------------------------
 총판매량  총매출    전용상품판매량  전용상품매출
     391   24957000	 59	             5808000
 ------------------------------------------------

문제 2

 전체 상품별 '상품아이디', '상품이름', '상품매출' 을 내림차순으로 구하시오 
 예약이 취소건은 제외 
------------------------------------------------
       상품아이디 상품이름       상품매출
        M0005	  STEAK	        9380000
        M0001	  SPECIAL_SET	5808000
        M0006	  SALAD_BAR	    2075000
        M0002	  PASTA	        1968000
        M0003	  PIZZA	        1666000
        M0004	  SEA_FOOD	    1625000
        M0009	  WINE	        856000
        M0008	  SANDWICH	    610000
        M0007	  SALAD	        525000
        M0010	  JUICE	        444000
------------------------------------------------
문제 3

 모든상품의 월별 매출액을 구하시오 
 매출월, SPECIAL_SET, PASTA, PIZZA, SEA_FOOD, STEAK, SALAD_BAR, SALAD, SANDWICH, WINE, JUICE
------------------------------------------------------------------------------------------
매출월  SPECIAL_SET PASTA   PIZZA   SEA_FOOD STEAK      SALAD_BAR SALAD     SANDWICH WINE   JUICE
201706	144000	    24000	0	    0	     385000	    0	      30000	    10000	 8000	12000
201707	408000	    228000	102000	175000	 525000	    200000	  0	        70000	 0	    36000
201708	336000	    108000	136000	225000	 455000	    175000	  15000	    90000	 40000	42000
201709	264000	    120000	238000	300000	 280000	    200000	  90000	    30000	 16000	48000
201710	552000	    336000	391000	200000	 1120000	425000	  135000	40000	 32000	102000
201711	888000	    492000	544000	425000	 1715000	400000	  105000	150000	 304000	174000
201712	3216000	    660000	255000	300000	 4900000	675000	  150000	220000	 456000	30000
------------------------------------------------------------------------------------------


-- 1
SELECT
        SUM(DECODE(o.item_id, 'M0001', 0, o.quantity)),
        SUM(DECODE(o.item_id, 'M0001', 0, o.sales)),
        SUM(DECODE(o.item_id, 'M0001', o.quantity, 0)),
        SUM(DECODE(o.item_id, 'M0001', o.sales, 0))
FROM
        order_info o,
        reservation r
WHERE
        o.reserv_no = r.reserv_no AND 
        r.cancel ='N'
;

-- 2
SELECT
        i.item_id AS "상품아이디",
        i.product_name AS "상품이름",
        SUM(o.sales) AS "상품매출"
FROM
        reservation r,
        item i,
        order_info o
WHERE
        r.reserv_no = o.reserv_no AND
        i.item_id = o.item_id AND
        r.cancel = 'N'
GROUP BY i.item_id, i.product_name
ORDER BY SUM(o.sales) DESC
;

-- 3
SELECT
       TO_CHAR(TO_DATE(r.reserv_date), 'YYYYMM'),
       SUM(DECODE(i.product_name, 'SPECIAL_SET', o.sales, 0 )) AS "SPECIAL_SET",
       SUM(DECODE(i.product_name, 'PASTA', o.sales, 0 )) AS "PASTA",
       SUM(DECODE(i.product_name, 'PIZZA', o.sales, 0 )) AS "PIZZA",
       SUM(DECODE(i.product_name, 'SEA_FOOD', o.sales, 0 )) AS "SEA_FOOD",
       SUM(DECODE(i.product_name, 'STEAK', o.sales, 0 )) AS "STEAK",
       SUM(DECODE(i.product_name, 'SALAD_BAR', o.sales, 0 )) AS "SALAD_BAR",
       SUM(DECODE(i.product_name, 'SALAD', o.sales, 0 )) AS "SALAD",
       SUM(DECODE(i.product_name, 'SANDWICH', o.sales, 0 )) AS "SANDWICH",
       SUM(DECODE(i.product_name, 'WINE', o.sales, 0 )) AS "WINE",
       SUM(DECODE(i.product_name, 'JUICE', o.sales, 0 )) AS "JUICE"
FROM
        item i,
        order_info o,
        reservation r
WHERE
        i.item_id = o.item_id AND
        o.reserv_no = r.reserv_no AND
        r.cancel ='N'
GROUP BY TO_CHAR(TO_DATE(r.reserv_date), 'YYYYMM')
ORDER BY TO_CHAR(TO_DATE(r.reserv_date), 'YYYYMM') ASC;