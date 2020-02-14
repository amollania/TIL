INSERT INTO item (item_id, product_name, product_desc, category_id, price)
SELECT
    'M' || LPAD(COUNT(*)+1, 4, '0'),
    'SOUP',
    '짜장',
    'FOOD',
    8000
FROM item;