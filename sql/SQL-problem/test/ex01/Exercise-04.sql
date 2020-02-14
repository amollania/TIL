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