drop table if exists payments;

drop table if exists payment_types;

drop table if exists order_items;

drop table if exists orders;

drop table if exists order_statuses;

drop table if exists clients;

drop table if exists users;

drop table if exists roles;

CREATE TABLE IF NOT EXISTS roles(
	id SERIAL PRIMARY KEY,
	code TEXT,
	label TEXT
);

INSERT INTO roles(code,label) VALUES('admin', 'Администратор'),('manager', 'Руководитель'),('employee', 'Сотрудник');

CREATE TABLE IF NOT EXISTS users(
	id SERIAL PRIMARY KEY,
	login TEXT,
	pass TEXT,
	fio TEXT,
	id_role INT REFERENCES roles (id),
	is_blocked INT default 0
);

INSERT INTO users(login, pass,fio,id_role,is_blocked) VALUES
('admin', '098f6bcd4621d373cade4e832627b4f6', 'Тестовый Администратор', 1, 0),
('manager', '098f6bcd4621d373cade4e832627b4f6', 'Тестовый Руководитель', 2, 0),
('employee', '098f6bcd4621d373cade4e832627b4f6', 'Тестовый Сотрудник', 3, 0);

CREATE TABLE IF NOT EXISTS clients(
	id SERIAL PRIMARY KEY,
	label TEXT
);

INSERT INTO clients(label) VALUES('Тестовый клиент');

CREATE TABLE IF NOT EXISTS order_statuses(
	id SERIAL PRIMARY KEY,
	label TEXT
);

INSERT INTO order_statuses(id,label) VALUES
(10, 'Проект'),
(20, 'В работе'),
(30, 'Завершён');

CREATE TABLE IF NOT EXISTS orders(
	id SERIAL PRIMARY KEY,
	label TEXT,
	id_status INT NOT NULL DEFAULT 10,
	id_client INT REFERENCES clients(id),
	amount NUMERIC(20,2)
);

CREATE TABLE IF NOT EXISTS order_items(
	id SERIAL PRIMARY KEY,
	label TEXT,
	id_order INT REFERENCES orders(id),
	amount NUMERIC(20,2)
);

CREATE TABLE IF NOT EXISTS payment_types(
	id SERIAL PRIMARY KEY,
	label TEXT
);

INSERT INTO payment_types(id, label) VALUES
(10, 'Аванс'),
(20, 'Основной');

CREATE TABLE IF NOT EXISTS payments(
	id SERIAL PRIMARY KEY,
	id_order INT,
	id_payment_type INT REFERENCES payment_types(id),
	amount NUMERIC(20,2)
);

-- Добавление данных в таблицу 'clients'
INSERT INTO clients(label) VALUES
('ООО "Ромашка"'),
('ЗАО "Василёк"'),
('ИП Иванов И.И.'),
('ОАО "Лютик"');

-- Добавление данных в таблицу 'order_statuses'
INSERT INTO order_statuses(label) VALUES
('Проект'),
('В работе'),
('Завершён');

-- Добавление данных в таблицу 'orders'
INSERT INTO orders(label, id_status, id_client, amount) VALUES
('Заказ на офисную мебель', 20, 1, 45000.00),
('Заказ на строительные материалы', 10, 2, 75000.00),
('Заказ на компьютеры', 30, 3, 125000.00),
('Заказ на офисную технику', 10, 4, 35000.00);

-- Добавление данных в таблицу 'order_items'
INSERT INTO order_items(label, id_order, amount) VALUES
('Стол офисный', 1, 15000.00),
('Стул офисный', 1, 10000.00),
('Диван офисный', 1, 20000.00),
('Цемент', 2, 30000.00),
('Кирпич', 2, 45000.00),
('Ноутбук', 3, 50000.00),
('Принтер', 4, 15000.00),
('Сканер', 4, 20000.00);

-- Добавление данных в таблицу 'payment_types'
INSERT INTO payment_types(label) VALUES
('Аванс'),
('Основной');

-- Добавление данных в таблицу 'payments'
INSERT INTO payments(id_order, id_payment_type, amount) VALUES
(1, 10, 10000.00), -- аванс по заказу 1
(2, 10, 15000.00), -- аванс по заказу 2
(3, 20, 50000.00), -- основной платёж по заказу 3
(4, 10, 5000.00);  -- аванс по заказу 4
