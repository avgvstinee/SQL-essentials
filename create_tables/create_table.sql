CREATE TABLE IF NOT EXISTS inventories (
  name VARCHAR(255),
  brand VARCHAR(50),
  quantity INT,
  price DECIMAL(19,2)
  
);

INSERT INTO 
    inventories(name,brand,quantity,price)
VALUES
     ('Galaxy S23 Ultra', 'Samsung', 15, 1199.99),
     ('Pixel 7 Pro', 'Google', 8, 899.99),
	 ('Xperia 1 IV', 'Sony', 7, 1299.99)
RETURNING
*;
