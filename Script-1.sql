-- Создаём схему.
CREATE SCHEMA netology;

-- Создаём таблицу.
CREATE TABLE netology.PERSONS (
    name           VARCHAR(50)  NOT NUll,
    surname        VARCHAR(100) NOT NULL,
    age            INT          CHECK (age > 0 AND age < 150) NOT NULL,
    phone_number   VARCHAR(20),
    city_of_living VARCHAR(20)  NOT NULL,
    PRIMARY KEY    (name, surname, age));

-- Заполняем таблицу.
INSERT INTO netology.PERSONS (name, surname, age, phone_number, city_of_living)
VALUES ('Ivan', 'Ivanov', 25, '+7 (900) 111-1111', 'MOSCOW'),
       ('Aleksey', 'Alekseev', 27, '+7 (901) 222-2222', 'KAZAN'),
       ('Sergey', 'Smirnov', 30, '+7 (900) 333-3333', 'MOSCOW'),
       ('Anna', 'Petrova', 20, '+7 (903) 444-4444', 'SOCHI'),
       ('Andrey', 'Smirnov', 33, '+7 (904) 555-5555', 'PERM'),
       ('Svetlana', 'Korneva', 28, '+7 (900) 667-6677', 'MOSCOW'),
       ('Dmitriy', 'Sidorov', 22, '+7 (905) 777-7777', 'VORONEZH'),
       ('Sergey', 'Aleksandrov', 38, '+7 (906) 888-8888', 'KRASNODAR'),
       ('Olga', 'Fedorova', 26, '+7 (907) 999-9999', 'TVER');

SELECT * FROM netology.PERSONS;

-- Выбираем name и surname, которые проживают в MOSCOW.
SELECT name, surname FROM netology.PERSONS
WHERE city_of_living = 'MOSCOW';

-- Выбираем все поля, у которых age больше 27 и отсортируйте по убыванию.
SELECT * FROM netology.PERSONS
WHERE age > 27
ORDER BY age DESC;