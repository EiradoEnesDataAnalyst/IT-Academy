-- NIVEL 2
USE transferanalytics;

-- Crea una nova taula que reflecteixi l'estat de les targetes de crèdit basat en si les tres últimes transaccions han estat declinades aleshores és inactiu,
-- si almenys una no és rebutjada aleshores és actiu. Partint d’aquesta taula respon:
DROP TABLE IF EXISTS analysis_cards;

CREATE TABLE analysis_cards AS
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
-- Exercici 1
-- Quantes targetes estan actives?

SELECT count(card_id) AS count_active_cards
FROM analysis_cards
WHERE status_cards = 'ACTIVE'

