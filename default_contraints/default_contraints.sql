-- create a table with deafult tax field
CREATE TABLE items (
  item_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  quantity INT NOT NULL,
  price DEC(11, 2) NOT NULL,
  tax DEC(11, 2) DEFAULT 0.05
);

--- insert into the TABLE
INSERT INTO
  items (name, quantity, price)
VALUES
  ('iPhone 15 Pro', 1, 1299.99) RETURNING *;

--- insert into the table with default value
INSERT INTO
  items (name, quantity, price, tax)
VALUES
  ('iPhone 16 Pro', 1, 1399.99, DEFAULT) 
RETURNING *;

--- insert into the table with just tax new value 
INSERT INTO
  items (name, quantity, price, tax)
VALUES
  ('iPhone 17 Pro', 1, 1499.99, 0.08) 
RETURNING *;


---- query the table
SELECT * FROM items

-- create a table with timestamp  field
CREATE TABLE orders (
  order_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  customer VARCHAR(100) NOT NULL,
  ship_to VARCHAR(255) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- insert into the table 
INSERT INTO
  orders (customer, ship_to)
VALUES
  (
    'John Doe',
    '9000 N 1st Street, San Jose, CA 95134'
  ) 
RETURNING *;

SELECT * FROM orders