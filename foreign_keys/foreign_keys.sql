
--- create a brands table 
CREATE TABLE brands (
    brand_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

--- create a products table 
CREATE TABLE products (
   product_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
   name VARCHAR(100) NOT NULL,
   price DECIMAL(10, 2) NOT NULL,
   brand_id INT NOT NULL,
   FOREIGN KEY (brand_id) REFERENCES brands (brand_id)
   ON DELETE SET NULL
);

--- insert into the brands table
INSERT INTO brands(name)
VALUES ('Apple'), ('Samsung'), ('Google')
RETURNING *;

--- insert into the products table
INSERT INTO products(name, price, brand_id)
VALUES('iPhone 14 Pro', 999.99, 1)
RETURNING *;

--- insert into the products table
INSERT INTO products(name, price, brand_id)
VALUES('iPhone 15 Pro', 1299.99, 11)
RETURNING *;

--- drop the table
DROP TABLE brands;

--- drop the table with cascade
DROP TABLE brands CASCADE;
--- drop the products table 
DROP TABLE products;
--- deletion action
ON DELETE delete_action;
