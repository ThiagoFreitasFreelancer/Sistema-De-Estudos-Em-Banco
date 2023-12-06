Consulta com ORDER BY e LIMIT:

SELECT * FROM public."Account"
ORDER BY start_date DESC
LIMIT 5;

Consulta com GROUP BY, SUM() e HAVING:

SELECT "Account", COUNT(id) AS total_clients
FROM public."Account"
GROUP BY "tipeAccount"
HAVING COUNT(id) > 1;

Consulta com JOIN LEFT:

SELECT a.name AS client_name, e.email
FROM public."Account" a
LEFT JOIN public."Email" e ON a.id = e.account_id;

Consulta com JOIN RIGHT:

SELECT e.email, a.name AS client_name
FROM public."Email" e
RIGHT JOIN public."Account" a ON e.account_id = a.id;

Consulta com ROLLUP:

SELECT "tipeAccount", COUNT(id) AS total_accounts
FROM public."Account"
GROUP BY ROLLUP("tipeAccount");

Consulta com SUM(), COUNT(), MIN() e MAX():

SELECT "TypeAccount".type, COUNT("Account".id) AS total_accounts, 
       SUM("Purchase".amount_product) AS total_products_purchased,
       MIN("Purchase".value_product) AS min_purchase_value,
       MAX("Purchase".value_product) AS max_purchase_value
FROM public."Account"
JOIN public."TypeAccount" ON "Account"."id_TypeAccount" = "TypeAccount".id
LEFT JOIN public."Purchase" ON "Account".id = "Purchase".id_account
GROUP BY "TypeAccount".type;