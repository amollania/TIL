 DECLARE
       --상수------------------------------
       cn_max_num   CONSTANT NUMBER := 9;        /*1년 수강하가능 학점*/
       cn_grade_num CONSTANT NUMBER := 36;       /*졸업가능 학점*/ 
       --반복건수-------------------------
       vn_sum_cnt            NUMBER;             /*전체 학생 수*/ 
       vn_cnt                NUMBER := 1;        /*while 증가 변수 */
       --기존자료---------------------------
       vn_hak_no             NUMBER := 0;        /*학번*/ 
       vn_name               VARCHAR2 (20);      /*이름*/ 
       vn_before_hak_gi      NUMBER := 0;        /*이수학기*/ 
       vn_before_hak_jum     NUMBER := 0;        /*이수학점*/ 
       --필요자료---------------------------
       vn_after_hak_gi       NUMBER := 0;        /*필요학점*/ 
       vn_after_hak_jum      NUMBER := 0;        /*필수학기*/ 

       --추가자료---------------------------
       vn_count      NUMBER := 0;        /*필수학기*/ 
       vn_class_title VARCHAR2(50);

    BEGIN
       SELECT COUNT(DISTINCT 학번) AS CNT
       INTO vn_sum_cnt
       FROM 학생;

       
       WHILE  vn_cnt <= vn_sum_cnt -- vn_cnt가 9보다 작거나 같을 경우에만 반복처리 
       LOOP
            SELECT B.hak_no
                 , B.name
                 , NVL(B.max_hak_gi,0) as max_hak_gi
                 , NVL(B.sum_hak_jum,0) as sum_hak_jum
            INTO vn_hak_no, vn_name, vn_before_hak_gi, vn_before_hak_jum    
            FROM (
                    SELECT A.*
                          , rownum  as rnum
                    FROM (
                            SELECT 학생.학번            AS hak_no
                                  ,학생.이름            AS name
                                  ,MAX(학생.학기)       AS max_hak_gi
                                --,count(수강내역.수강내역번호) AS max_hak_gi
                                  ,SUM(과목.학점)       AS sum_hak_jum
                            FROM 학생, 수강내역, 과목
                            WHERE 학생.학번 = 수강내역.학번 (+)
                            AND   수강내역.과목번호 = 과목.과목번호(+)
                            GROUP BY 학생.학번
                                   , 학생.이름
                         ) A
                )B
            WHERE B.rnum = vn_cnt;
            
            vn_after_hak_jum := cn_grade_num - vn_before_hak_jum;
            vn_after_hak_gi  := CEIL(vn_after_hak_jum / cn_max_num);

            DBMS_OUTPUT.PUT_LINE ('----------------------------------------------------------') ;
            DBMS_OUTPUT.PUT_LINE ('[기존 자료]학번:'|| vn_hak_no || ' 이름:' || vn_name || ' 수강 학기:' || vn_before_hak_gi || ' 취득 학점:'||vn_before_hak_jum );


            -- 수강 내역 개수 구하기
            SELECT COUNT(*)
            INTO vn_count
            FROM 학생, 수강내역, 과목
            WHERE
                  학생.학번 = 수강내역.학번 (+)
                  AND 수강내역.과목번호 = 과목.과목번호(+)
                  AND 학생.학번 LIKE vn_hak_no;
            -- 수강 내역 개수 출력
            DBMS_OUTPUT.PUT_LINE (' 과목 수 :'|| vn_count );

            -- 과목 타이틀
            DBMS_OUTPUT.PUT_LINE ('타이틀:');

            -- 과목에 대한 FOR문 시작
            FOR i in 1..vn_count LOOP
                SELECT D.title
                INTO vn_class_title
                FROM (
                    SELECT rownum as main_num, class_num.*
                    FROM
                    (
                        SELECT 과목.과목이름 AS title
                        FROM 학생, 수강내역, 과목
                        WHERE 학생.학번 = 수강내역.학번 (+)
                            AND 수강내역.과목번호 = 과목.과목번호(+)
                            AND 학생.학번 LIKE vn_hak_no) class_num
                    ) D
                WHERE D.main_num =i;
                -- 과목에 대한 결과 값 출력
                DBMS_OUTPUT.PUT_LINE ( vn_class_title ); 
            END LOOP;

            DBMS_OUTPUT.PUT_LINE ('[산출 자료]학번:'|| vn_hak_no || ' 이름:' || vn_name || ' 최소 학기:' || vn_after_hak_gi || ' 필요 학점:'||vn_after_hak_jum ); 
            DBMS_OUTPUT.PUT_LINE ('----------------------------------------------------------') ;
       
    --      EXIT WHEN vn_after_hak_jum = 36; -- 5가되면 루프 종료
          vn_cnt := vn_cnt + 1; -- vn_cnt 값을 1씩 증가
       END LOOP;    
    END;
    
