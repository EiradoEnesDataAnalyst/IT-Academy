### importar tablas : LOAD DATA INFILE ###

-- hay un problema con el campo fecha , hay una coma adentro! PONER OPTIONALLY... --
LOAD DATA
INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\american_users.csv'
INTO TABLE american_users
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"'
IGNORE 1 ROWS;

SELECT * FROM american_users;
-- -----------------------------------------------------------------------------
LOAD DATA
INFILE "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\companies.csv"  
INTO TABLE companies
FIELDS TERMINATED BY ','
IGNORE 1 ROWS;

SELECT * FROM companies;
-- -------------------------------------------------------------------------------
LOAD DATA
INFILE "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\credit_cards.csv" 
INTO TABLE credit_cards
FIELDS TERMINATED BY ','
IGNORE 1 ROWS;

SELECT * FROM credit_cards;
-- -----------------------------------------------------------------------------
-- mismo problema de arriba tabla american_user PONER OPTIONALLY...
LOAD DATA
INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\european_users.csv'
INTO TABLE european_users
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
IGNORE 1 ROWS;

SELECT * FROM european_users;
-- ----------------------------------------------------------------------------
## Aqui tengo problema $ adentro campo price, SOLUCIONO CON SET ##
LOAD DATA
INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\products.csv'
INTO TABLE products
FIELDS TERMINATED BY ','
IGNORE 1 ROWS
(@id, @product_name, @price, @colour, @weight, @warehouse_id)
SET
id = @id,
product_name = @product_name,
price = CAST(REPLACE(@price,'$','') AS DECIMAL(10,2)),
colour = @colour,
weight = @weight,
warehouse_id = @warehouse_id;

SELECT * FROM products;
-- --------------------------------------------------------------------------------
## Aqui tengo ; como separador de columnas ##
LOAD DATA
INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\transactions.csv' 
INTO TABLE transactions
FIELDS TERMINATED BY ';'
IGNORE 1 ROWS;
