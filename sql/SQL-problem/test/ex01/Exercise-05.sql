SELECT
    ib.product_name,
    SUM(os.sales)
FROM
    (
        SELECT *
        FROM
            (
            SELECT
                c.customer_id,
                c.customer_name,
                r.branch,
                COUNT(r.visitor_cnt) AS BRANCH_CNT,
                SUM(r.visitor_cnt) AS SUM_CNT
            FROM
                customer c,
                reservation r
            WHERE
                c.customer_id = r.customer_id(+) AND
                r.cancel = 'N'
            GROUP BY c.customer_id, c.customer_name, r.branch
            ORDER BY COUNT(r.visitor_cnt) DESC
            ) ls
        WHERE
            rownum <= 1
    ) bs,
    item ib,
    order_info os,
    reservation re
WHERE
    bs.customer_id  = re.customer_id(+) AND
    re.reserv_no = os.reserv_no(+) AND
    os.item_id = ib.item_id
GROUP BY ib.product_name
ORDER BY SUM(os.sales) DESC
;