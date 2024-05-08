-- Вставляем данные в таблицу "account_statuses"
INSERT INTO account_statuses(id, label)
VALUES 
  (1, 'Активный'),
  (2, 'Неактивный'),
  (3, 'Закрыт');

-- Вставляем данные в таблицу "clients"
INSERT INTO clients(id, label)
VALUES 
  (1, 'John Doe'),
  (2, 'Jane Smith'),
  (3, 'Acme Corp.'),
  (4, 'XYZ Inc.'),
  (5, 'Beta LLC');

-- Вставляем данные в таблицу "accounts", добавляя "id_status" и "creation_date"
INSERT INTO accounts(id, balance, id_client, id_status, creation_date)
VALUES 
  (1, 1000.0, 1, 1, '2022-01-01'),
  (2, 2000.0, 1, 1, '2022-01-02'),
  (3, 3000.0, 2, 1, '2022-01-03'),
  (4, 4000.0, 2, 1, '2022-01-04'),
  (5, 5000.0, 3, 2, '2022-01-05'),
  (6, 6000.0, 3, 2, '2022-01-06'),
  (7, 7000.0, 4, 1, '2022-01-07'),
  (8, 8000.0, 5, 3, '2022-01-08'),
  (9, 9000.0, 5, 3, '2022-01-09'),
  (10, 10000.0, 5, 3, '2022-01-10');

-- Вставляем данные в таблицу "payments", учитывая новые ограничения
INSERT INTO payments(dt, amount, id_account_from, id_account_to)
VALUES 
  ('2022-09-01', 100.0, 1, 2),
  ('2022-09-02', 200.0, 3, 2),
  ('2022-09-03', 150.0, 3, 4),
  ('2022-09-03', 150.0, 4, 5),
  ('2022-09-04', 300.0, 2, 5),
  ('2022-09-05', 100.0, 1, 3),
  ('2022-09-06', 200.0, 2, 6),
  ('2022-09-07', 150.0, 5, 7),
  ('2022-09-08', 300.0, 6, 8),
  ('2022-09-09', 250.0, 3, 9),
  ('2022-09-10', 150.0, 4, 10),
  ('2022-09-11', 500.0, 1, 10),
  ('2022-09-12', 250.0, 7, 9),
  ('2022-09-13', 150.0, 3, 10),
  ('2022-09-14', 300.0, 2, 8),
  ('2022-09-15', 200.0, 6, 9),
  ('2022-09-16', 150.0, 1, 7),
  ('2022-09-17', 100.0, 2, 4),
  ('2022-09-18', 400.0, 4, 1),
  ('2022-09-19', 300.0, 3, 2);