-- NIVEL1
USE transferanalytics;
-- Exercici 1
-- Realitza una subconsulta que mostri tots els usuaris amb més de 80 transaccions utilitzant almenys 2 taules.

SELECT user_id,
	   (SELECT CONCAT(name," ",surname) FROM users WHERE users.id = transactions.user_id) AS full_name,
       COUNT(id) AS count_transactions
FROM transactions
GROUP BY user_id,full_name
HAVING COUNT(id) > 80;

             
-- Exercici 2
-- Mostra la mitjana d'amount per IBAN de les targetes de crèdit a la companyia Donec Ltd, utilitza almenys 2 taules.

SELECT cc.iban,
	   round(avg(t.amount),2) AS avg_amount
FROM credit_cards AS cc
JOIN transactions AS t
ON cc.id = t.card_id
WHERE t.company_id IN (SELECT id
                       FROM companies
                       WHERE company_name = "Donec Ltd")
AND t.declined = 0
GROUP BY cc.iban
ORDER BY avg_amount DESC;


