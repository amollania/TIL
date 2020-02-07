--369게임
DECLARE
    vn_num VARCHAR(80) := '';
    vn_num2 VARCHAR(80) := '';

BEGIN
    FOR i IN 1..100 LOOP
            IF i LIKE '%3' OR i LIKE '%6' OR i LIKE '%9' THEN
                vn_num:= '짝';

            END IF;
            IF i LIKE '3%' OR i LIKE '6%' OR i LIKE '9%' THEN
                vn_num2 := '짝';

            END IF;
            DBMS_OUTPUT.PUT_LINE(i || ':' || vn_num || vn_num2);
            vn_num:='';
            vn_num2:='';
    END LOOP;
END;