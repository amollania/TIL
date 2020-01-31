-- 처음 학번을 받고 제시하는 쿼리
SELECT
        s.학번,
        s.이름,
        TO_CHAR(s.생년월일, 'YYYYMMDD') as 생년월일,
        s.주소,
        s.전공,
        s.부전공,
        NVL(SUM(t.학점), 0) as "전체학점",
        ROUND(s.평점, 2) as "평점평균",
        COUNT(h.학번) as "수강건수"
FROM
        학생 s,
        수강내역 h,
        과목 t
WHERE
        s.학번 = h.학번(+) AND
        h.과목번호 = t.과목번호(+)
GROUP BY
        s.학번,
        s.이름,
        TO_CHAR(s.생년월일, 'YYYYMMDD'),
        s.주소,
        s.전공,
        s.부전공,
        ROUND(s.평점, 2)
;

-- 더블 클릭 후에 제시하는 상세 정보
SELECT
        xzy.학기,
        xzy.평점,
        xzy.과목이름,
        xzy.학점,
        xzy.강의실,
        xzy.교수이름,
        xzy.교시,
        xzy.취득학점,
        xzy.년월 as 년월일
FROM    (
                SELECT
                s.학번,
                s.평점,
                s.학기,
                h.과목번호,
                t.과목이름,
                t.학점,
                g.강의실,
                m.교수이름,
                h.교시,
                h.취득학점,
                h.년월
        FROM
                학생 s,
                수강내역 h,
                과목 t,
                강의내역 g,
                교수 m
        WHERE
                s.학번 = h.학번 AND
                h.과목번호 = t.과목번호 AND
                t.과목번호 = g.과목번호 AND
                g.교수번호 = m.교수번호
                ) xzy
WHERE
         xzy.학번 = '1999232102';


/*
ANSI구문을 사용하지 않고, 또 사용했을 때 표현 가능한 조인 방법
*/
-- 일반 구문
SELECT xyz.mem_name, xyz.lprod_gu, xyz.prod_name, xyz.cart_qty
FROM
           (
            SELECT m.mem_id, m.mem_name, l.lprod_gu, p.prod_name, c.cart_qty
            FROM
                    member m, cart c, prod p, lprod l
            WHERE
                    m.mem_id = c.cart_member AND
                    c.cart_prod = p.prod_id AND
                    p.prod_lgu = l.lprod_gu
             ) xyz
WHERE
        xyz.mem_id = 'g001';


-- ANSI 구문
SELECT
        m.mem_name,
        l.lprod_gu,
        p.prod_name,
        c.cart_qty
FROM
        member m
        INNER JOIN cart c ON(m.mem_id = c.cart_member)
        INNER JOIN prod p ON(c.cart_prod = p.prod_id)
        INNER JOIN lprod l ON(p.prod_lgu = l.lprod_gu)
        WHERE
m.mem_id ='g001';

           
