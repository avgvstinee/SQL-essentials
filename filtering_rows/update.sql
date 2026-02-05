--The following example uses the UPDATE statement to change the quantity of the product with the name "iPhone 14 Pro" to 30:
UPDATE inventories
SET
  quantity = 30
WHERE
  name = 'iPhone 14 Pro';

  

SELECT
  name,
  quantity
FROM
  inventories
WHERE
  name = 'iPhone 14 Pro';

--The following example uses the UPDATE statement to reduce the price of all products by 10% by multiplying the price with 0.9 (90%):
UPDATE inventories
SET
  price = price * 0.9;


SELECT
  name,
  price
FROM
  inventories;

--The following example uses the UPDATE statement to update the price of the Pixel 7 Pro product to 750 and return the updated row:

UPDATE inventories
SET
  price = 750
WHERE 
  name = 'iPhone 14 Pro'
RETURNING *;
 