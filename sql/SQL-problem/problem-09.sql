SELECT
    SUBSTR(mem_add1, 0, INSTR(mem_add1, ' ', 1, 1)),
    SUBSTR(mem_add1, INSTR(mem_add1, ' ', 1, 1), INSTR(mem_add1, ' ', 1,2)-INSTR(mem_add1, ' ', 1,1)),
    SUBSTR(mem_add1, INSTR(mem_add1, ' ', 1, 2))
FROM
    member;