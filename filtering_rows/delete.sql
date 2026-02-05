--Deleting one row from a table
DELETE FROM inventories
WHERE name = 'iPhone 14 Pro';

--Deleting all rows from a table 
DELETE FROM inventories;

--Returning deleted rows 
INSERT INTO inventories (name, brand, quantity, price)
VALUES ('iPhone 15 Pro', 'Apple', 5, 1299.99);


DELETE FROM inventories
WHERE name = 'iPhone 15 Pro'
RETURNING *;
