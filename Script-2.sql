-- Создаём схему
CREATE SCHEMA netology;

-- Создаём таблицу.
CREATE TABLE netology.CUSTOMERS (
    id           BIGSERIAL    PRIMARY KEY NOT NULL,
    name         VARCHAR(50)  NOT NULL,
    surname      VARCHAR(100) NOT NULL,
    age          INT          CHECK (age > 0 AND age < 150),
    phone_number VARCHAR(20)  NOT NULL);

-- Заполняем таблицу.
INSERT INTO netology.CUSTOMERS (name, surname, age, phone_number)
VALUES ('Ivan', 'Ivanov', 25, '+7 (900) 111-1111'),
       ('Aleksey', 'Alekseev', 27, '+7 (901) 222-2222'),
       ('Sergey', 'Smirnov', 30, '+7 (900) 333-3333'),
       ('Anna', 'Petrova', 20, '+7 (903) 444-4444'),
       ('Andrey', 'Smirnov', 33, '+7 (904) 555-5555'),
       ('Svetlana', 'Korneva', 28, '+7 (900) 667-6677'),
       ('Dmitriy', 'Sidorov', 22, '+7 (905) 777-7777'),
       ('Sergey', 'Aleksandrov', 38, '+7 (906) 888-8888'),
       ('Olga', 'Fedorova', 26, '+7 (907) 999-9999');

SELECT * FROM netology.CUSTOMERS;

-- Создаём таблицу.
CREATE TABLE netology.ORDERS (
    id           BIGSERIAL    PRIMARY KEY,
    date         DATE         NOT NULL,
    customer_id  INT          NOT NULL,
    product_name VARCHAR(128) NOT NULL,
    amount       INT          CHECK (amount > 0) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES netology.CUSTOMERS (id));

-- Заполняем таблицу.
INSERT INTO netology.ORDERS (date, customer_id, product_name, amount)
VALUES ('2023-12-01', 2, 'Samsung Galaxy A55', 40000),
       ('2024-01-18', 5, 'Honor X8b', 17000),
       ('2023-08-31', 3, 'POCO M6 Pro', 23000),
       ('2024-10-11', 1, 'Realme GT 6T', 58000),
       ('2023-02-12', 5, 'Honor 200', 38000),
       ('2024-05-20', 6, 'Samsung Galaxy S24', 66000),
       ('2023-07-30', 3, 'Huawei nova 11', 21000),
       ('2024-04-09', 9, 'Xiaomi 14T', 51000),
       ('2024-03-10', 7, 'iPhone 13', 61000);

SELECT * FROM netology.ORDERS;

-- Вернуть из таблиц поля product_name для пользователей с именем alexey независимо от регистра имени.
SELECT product_name FROM netology.ORDERS
WHERE customer_id IN (
    SELECT id FROM netology.CUSTOMERS
    WHERE LOWER(name) = 'aleksey');

-- или второй вариант
SELECT product_name, a.name, a.surname FROM netology.ORDERS b
INNER JOIN netology.CUSTOMERS a ON a.id = b.customer_id
WHERE LOWER(name) LIKE 'aleksey';