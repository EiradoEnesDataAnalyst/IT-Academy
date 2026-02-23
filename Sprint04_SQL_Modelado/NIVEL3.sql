-- Crea una taula amb la qual puguem unir les dades del nou arxiu products.csv amb la base de dades creada, 
-- tenint en compte que des de transaction tens product_ids. Genera la següent consulta:

-- ----- CREAR UNA TABLA PARA CONECTAR TRANSACTION TO PRODUCTOS ----

### uso FIND_IN_SET para desnormalizar product_ids y convertir en filas individuales###
### he tenido que quitar los epscios en blancos con REPLACE  ###

DROP TABLE IF EXISTS detalles_transactions;

CREATE TABLE detalles_transactions(
                                  product_id varchar(10),
								  transaction_id VARCHAR(50),
                                  PRIMARY KEY (transaction_id,product_id),
                                  FOREIGN KEY (transaction_id) REFERENCES transactions(id),
                                  FOREIGN KEY (product_id) REFERENCES products(id));

								
INSERT INTO detalles_transactions(transaction_id , product_id)
SELECT t.id AS transaction_id, 
       p.id AS product_id
FROM transactions AS t
JOIN products AS p
ON FIND_IN_SET(p.id,REPLACE(t.product_ids," ","")) > 0;

SELECT * FROM detalles_transactions;

### PASAJE FINAL BORRO CAMPO PRODUCT_IDS PARA LIMPIAR ##
ALTER TABLE transactions DROP COLUMN product_ids;

-- Exercici 1
-- Necessitem conèixer el nombre de vegades que s'ha venut cada producte.

SELECT d.product_id,p.product_name,count(d.product_id) AS count_sales_product
FROM detalles_transactions AS d
JOIN products AS p
ON d.product_id = p.id
GROUP BY d.product_id,p.product_name
ORDER BY count_sales_product DESC;

## PASO FINAL PARA MODELLO  ##
DROP TABLE IF EXISTS analysis_cards;
DROP VIEW IF EXISTS analysis_cards;

CREATE VIEW analysis_cards AS
            SELECT t.card_id,
                   CASE
				       WHEN SUM(t.declined) = 3
                       THEN "INACTIVE"
                       ELSE "ACTIVE"
					END AS status_cards
             FROM (
                   SELECT card_id, 
                          id, 
						  declined, 
                          timestamp, 
                          ROW_NUMBER()OVER(PARTITION BY card_id ORDER BY timestamp DESC) AS orden_transactions
				   FROM transactions) AS t
             WHERE t.orden_transactions BETWEEN 1 AND 3
             GROUP BY t.card_id;

SELECT * FROM analysis_cards;







