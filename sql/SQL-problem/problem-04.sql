--369게임
DECLARE
    vn_num NUMBER := 0;

BEGIN
    FOR i IN 1..100 LOOP
        
            IF i LIKE '%3' OR i LIKE '6' OR i LIKE '9' THEN
                DBMS_OUTPUT.PUT_LINE(i || ':' || '짝1');
            ELSIF i LIKE '3%' OR i LIKE '6%' OR i LIKE '9%' THEN
                    IF i LIKE '%3' OR i LIKE '%6' OR i LIKE '%9' THEN
                       DBMS_OUTPUT.PUT_LINE(i || ':' || '짝짝');
                       CONTINUE;
                    END IF;
                DBMS_OUTPUT.PUT_LINE(i || ':' || '짝');
            ELSE
                DBMS_OUTPUT.PUT_LINE(i);
            END IF;
    END LOOP;
END;