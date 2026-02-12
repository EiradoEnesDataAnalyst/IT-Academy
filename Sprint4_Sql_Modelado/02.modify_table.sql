########## MODIFICAR TABLAS: LIMPIAR DATOS, FORMATO COLUMNAS, ANADIR CLAVES ###########

-- ----------- COMPANIES : nombre columna mas PRIMARY --------------------------
ALTER TABLE companies CHANGE company_id id VARCHAR(10);

ALTER TABLE companies
ADD CONSTRAINT pk_id_company PRIMARY KEY (id);

-- ----------- CREDIT_CARDS : PRIMARY y cambio formato columna expiring_date -------------------------------------
ALTER TABLE credit_cards
ADD CONSTRAINT pk_id_card PRIMARY KEY (id);

UPDATE credit_cards
SET expiring_date = STR_TO_DATE(expiring_date, '%m/%d/%y')
LIMIT 10000;

ALTER TABLE credit_cards MODIFY expiring_date DATE;

-- -------PRODUCTS : PRIMARY ,estraer simbolo $ , cambio nombre columna y formato price , formato weight --------

ALTER TABLE products
ADD CONSTRAINT pk_id_prod PRIMARY KEY (id);

UPDATE products
SET price = REPLACE(price, '$', '')
LIMIT 1000 ;

ALTER TABLE products CHANGE price price_$ DECIMAL(10,2);

ALTER TABLE products MODIFY weight FLOAT;

####### USERS, creo esta nueva tabla, hago UNION de las 2 tablas users ########
## He controlado que no hayan usuarios duplicados entre las 2 tablas(aunque fuera poco probable) ##

ALTER TABLE american_users ADD COLUMN user_region VARCHAR(20) DEFAULT "american";
ALTER TABLE european_users ADD COLUMN user_region VARCHAR(20) DEFAULT "european";

DROP TABLE IF EXISTS users;

CREATE TABLE users AS
                     SELECT * FROM american_users
                     UNION ALL
                     SELECT * FROM european_users;

-- ---- USERS, PRIMARY y formato columnas -----
ALTER TABLE users
ADD CONSTRAINT pk_user_id PRIMARY KEY (id);

UPDATE users
SET birth_date = STR_TO_DATE(birth_date,'%b %d, %Y')
LIMIT 10000;

ALTER TABLE users MODIFY birth_date DATE;
ALTER TABLE users MODIFY name VARCHAR(20);
ALTER TABLE users MODIFY name VARCHAR(30);
ALTER TABLE users MODIFY country VARCHAR(30);
ALTER TABLE users MODIFY city VARCHAR(20);
ALTER TABLE users MODIFY postal_code VARCHAR(20);
ALTER TABLE users MODIFY name VARCHAR(30);

-- ------ TRANSACTIONS : PRIMARY , Claves Foraneas y cambio nombre columna ----

-- pongo primary key --- 
ALTER TABLE transactions
ADD CONSTRAINT pk_id_transaction PRIMARY KEY (id);

-- cambio formatos columnas --
ALTER TABLE transactions CHANGE business_id company_id VARCHAR(10);
ALTER TABLE transactions MODIFY lat FLOAT;
ALTER TABLE transactions MODIFY longitude FLOAT;
ALTER TABLE transactions MODIFY amount DECIMAL(10,2);
ALTER TABLE transactions MODIFY declined BOOLEAN;
ALTER TABLE transactions MODIFY timestamp TIMESTAMP DEFAULT (CURRENT_TIMESTAMP);

-- pongo las claves foraneas --
ALTER TABLE transactions
ADD CONSTRAINT fk_companies FOREIGN KEY (company_id) REFERENCES companies(id);
ALTER TABLE transactions
ADD CONSTRAINT fk_credit_cards FOREIGN KEY (card_id) REFERENCES credit_cards(id); 
ALTER TABLE transactions
ADD CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES users(id);

-- pongo index para velocizr las consultas --
CREATE INDEX idx_user ON transactions(user_id);
CREATE INDEX idx_card ON transactions(card_id);
CREATE INDEX idx_company ON transactions(company_id);


###### CHECK TABLAS #####

SHOW COLUMNS FROM companies;
SHOW COLUMNS FROM users;
SHOW COLUMNS FROM credit_cards;
SHOW COLUMNS FROM products;
SHOW COLUMNS FROM transactions;

SELECT * FROM companies;
SELECT * FROM users;
SELECT * FROM credit_cards;
SELECT * FROM products;
SELECT * FROM transactions;
