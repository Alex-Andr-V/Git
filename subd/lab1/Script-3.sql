-- Добавляем поле "id_status" в таблицу "accounts" с внешним ключом к "account_statuses"
ALTER TABLE accounts
ADD COLUMN id_status INT,
ADD FOREIGN KEY (id_status) REFERENCES account_statuses (id);

-- Удаляем поле "is_system" из таблицы "accounts"
ALTER TABLE accounts
DROP COLUMN is_system;

-- Добавляем поле "creation_date" в таблицу "accounts" с значением по умолчанию
ALTER TABLE accounts
ADD COLUMN creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP;

-- Устанавливаем значение по умолчанию для поля "balance"
ALTER TABLE accounts
ALTER COLUMN balance SET DEFAULT 0;

-- Устанавливаем значение по умолчанию для поля "dt" в таблице "payments"
ALTER TABLE payments
ALTER COLUMN dt SET DEFAULT CURRENT_TIMESTAMP;

-- Устанавливаем свойство NOT NULL для полей "dt" и "amount" в таблице "payments"
ALTER TABLE payments
ALTER COLUMN dt SET NOT NULL,
ALTER COLUMN amount SET NOT NULL;