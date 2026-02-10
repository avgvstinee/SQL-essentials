-- create a unique table 
CREATE TABLE brands (
  brand_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name VARCHAR(255) NOT NULL UNIQUE
);
-- insert into the table 
INSERT INTO
  brands (name)
VALUES
  ('Apple') 
RETURNING *;
--ERROR: duplicate key value violates unique constraint "brands_name_key”
INSERT INTO
  brands (name)
VALUES
  ('Apple') 
RETURNING *;
--Defining a UNIQUE constraint that includes multiple columns
CREATE TABLE product_loans (
  loan_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  product_id INT NOT NULL,
  user_id INT NOT NULL,
  loan_date DATE NOT NULL,
  return_date DATE,
  UNIQUE (product_id, user_id)
);
-- insert into the table
INSERT INTO
  product_loans (product_id, user_id, loan_date)
VALUES
  (1, 1, '2024-11-23'),
  (1, 2, '2024-11-23') 
RETURNING *;
--duplicate key value violates unique constraint "product_loans_product_id_user_id_key”
INSERT INTO
  product_loans (product_id, user_id, loan_date)
VALUES
  (1, 1, '2024-11-24');
--Handling NULL with UNIQUE constraint 
CREATE TABLE profiles (
  user_id INT PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  phone VARCHAR(25) UNIQUE
);
--insert into the table
INSERT INTO
  profiles (user_id, first_name, last_name, phone)
VALUES
  (1, 'John', 'Doe', NULL) 
RETURNING *;

INSERT INTO
  profiles (user_id, first_name, last_name, phone)
VALUES
  (2, 'Jane', 'Doe', NULL) 
RETURNING *;

-- query 
SELECT * FROM profiles;