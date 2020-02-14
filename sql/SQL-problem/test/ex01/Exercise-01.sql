SELECT
    customer_name,
    phone_number,
    email,
    TO_CHAR(FIRST_REG_DATE, 'YYYYMMDD') AS REG_DATE,
    sex_code,
    birth,
     LPAD(zip_code, 3) || '-' || SUBSTR(zip_code, 4)
FROM
    CUSTOMER
ORDER BY FIRST_REG_DATE ASC;