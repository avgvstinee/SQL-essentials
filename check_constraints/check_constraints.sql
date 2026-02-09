-- create a table
CREATE TABLE products (
  product_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  price DEC(11, 2) NOT NULL CONSTRAINT positive_price CHECK (price >= 0),
  discounted_price DEC(11, 2) NOT NULL DEFAULT 0
);

-- insert into the table
INSERT INTO
  products (name, price)
VALUES
  ('iPhone Pro 15', -1299.99);
  
-- new row for relation "products" violates check constraint "positive_price"
-- fix the error
 INSERT INTO
  products (name, price)
VALUES
  ('iPhone Pro 15', 1299.99) RETURNING *;


-- update 
UPDATE products
SET
  price = -899.99
WHERE
  product_id = 2;

-- new row for relation "products" violates check constraint "positive_price"
  
UPDATE products
SET
  price = 999.99
WHERE
  product_id = 2 
RETURNING *;

--Adding CHECK constraints to tables 
--check constraint "discounted_price_check" of relation "products" is violated by some row
ALTER TABLE products
ADD CONSTRAINT discounted_price_check
CHECK (discounted_price < price AND discounted_price > 0);

-- To fix this , you can update the discounted price of the existing rows to make it valid for the new CHECK constraint:
UPDATE products
SET discounted_price = price * 0.9
RETURNING *;

--If you attempt to insert a row with the discounted price higher or equal to the price, PostgreSQL will issue a check violation. For example:
--ERROR: new row for relation "products" violates check constraint "discounted_price_check”
INSERT INTO products(name, price, discounted_price)
VALUES('iPhone Pro 15', 1299.99, 1399.99);

--Removing CHECK constraints from tables 
ALTER TABLE products
DROP CONSTRAINT IF EXISTS discounted_price_check;
  