SELECT
    c.customer_name,
    DECODE(c.sex_code, 'M', '남자', DECODE(c.sex_code, 'F', '여자', null)) AS SEX_NM,
    a.address_detail AS zip_nm
FROM
    CUSTOMER c,
    ADDRESS a
WHERE
    c.zip_code = a.zip_code(+)
ORDER BY TO_NUMBER(SUBSTR(customer_name, 3)) ASC;