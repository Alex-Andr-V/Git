-- Список клиентов, являющихся плательщиками хотя бы по одному платежу
SELECT 
    DISTINCT clients.label AS payers
FROM 
    payments
INNER JOIN 
    accounts ON accounts.id = payments.id_account_from 
INNER JOIN 
    clients ON clients.id = accounts.id_client;

-- Список клиентов, являющихся получателями хотя бы по одному платежу
SELECT 
    DISTINCT clients.label AS receivers
FROM 
    payments
INNER JOIN 
    accounts ON accounts.id = payments.id_account_to 
INNER JOIN 
    clients ON clients.id = accounts.id_client;

-- id платежа с самой большой суммой
SELECT 
    id
FROM 
    payments
ORDER BY 
    amount DESC
LIMIT 1;

-- id трех последних по дате платежей
SELECT 
    id
FROM 
    payments
ORDER BY 
    dt DESC
LIMIT 3;

-- Общая сумма всех проведенных платежей
SELECT 
    SUM(amount) AS total_payments
FROM 
    payments;

-- Количество исходящих платежей по каждому счету
SELECT 
    id_account_from AS account_id, 
    COUNT(*) AS outgoing_count
FROM 
    payments
GROUP BY 
    id_account_from;

-- Количество входящих платежей по каждому счету
SELECT 
    id_account_to AS account_id, 
    COUNT(*) AS incoming_count
FROM 
    payments
GROUP BY 
    id_account_to;

-- Все платежи с указанием даты, суммы, id счета получателя, названия клиента-получателя, 
-- id счета плательщика, названия клиента-плательщика, упорядоченные по убыванию даты
SELECT 
    payments.dt, 
    payments.amount, 
    payments.id_account_to, 
    clients_receiver.label AS receiver_client, 
    payments.id_account_from, 
    clients_payer.label AS payer_client
FROM 
    payments
INNER JOIN 
    accounts accounts_to ON accounts_to.id = payments.id_account_to
INNER JOIN 
    clients clients_receiver ON clients_receiver.id = accounts_to.id_client
INNER JOIN 
    accounts accounts_from ON accounts_from.id = payments.id_account_from
INNER JOIN 
    clients clients_payer ON clients_payer.id = accounts_from.id_client
ORDER BY 
    payments.dt DESC;