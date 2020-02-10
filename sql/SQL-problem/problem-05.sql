-- 369게임 : 직접 입력받기
CREATE OR REPLACE FUNCTION fn_369(vs_number NUMBER)
    RETURN VARCHAR2
IS
    vn_base_num VARCHAR2(10);
    vn_base_cnt_3 NUMBER := 0;
    vn_base_cnt_6 NUMBER := 0;
    vn_base_cnt_9 NUMBER := 0;
    vn_all_cnt NUMBER := 0;
    vn_star VARCHAR2(100):='짝';
    vn_output VARCHAR2(100);
BEGIN
          vn_base_num := TO_CHAR(vs_number) ;
          vn_base_cnt_3 :=LENGTH(vn_base_num) - NVL(LENGTH(REPLACE(vn_base_num,'3','')),0);
          vn_base_cnt_6 :=LENGTH(vn_base_num) - NVL(LENGTH(REPLACE(vn_base_num,'6','')),0);
          vn_base_cnt_9 :=LENGTH(vn_base_num) - NVL(LENGTH(REPLACE(vn_base_num,'9','')),0);
          vn_all_cnt := vn_base_cnt_3 + vn_base_cnt_6 + vn_base_cnt_9;
          vn_star := '';
          
          IF vn_all_cnt = 0 THEN
            vn_output := vn_base_num;
          ELSE
          FOR x IN 1..vn_all_cnt 
                LOOP
                    vn_star := vn_star || '짝';
                END LOOP;
                vn_output := vn_star;
          END IF;
    RETURN vn_output;
END;

-- 출력하기
SELECT fn_369(923)
FROM DUAL;