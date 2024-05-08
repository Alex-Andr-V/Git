-- Удаляем таблицу users, если она существует
DROP TABLE IF EXISTS users;

-- Создаем таблицу users с полями id и label
CREATE TABLE users (
    id SERIAL PRIMARY KEY,  -- Автоматическое создание уникальных идентификаторов
    label VARCHAR(100)      -- Поле для текстовых данных (можете изменить размер, если нужно)
);

-- Добавляем несколько записей
INSERT INTO users (label) VALUES ('User1');  -- Добавление записи с текстовым значением
INSERT INTO users (label) VALUES ('User2');  -- Еще одна запись
INSERT INTO users (label) VALUES ('User3');  -- И еще одна