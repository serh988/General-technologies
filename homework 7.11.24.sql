-- Создание базы данных homeworks
CREATE DATABASE homeworks;
USE homeworks;

-- Создание таблицы employees
CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    firstname VARCHAR(128) NOT NULL,
    lastname VARCHAR(128) NOT NULL,
    job VARCHAR(64),
    age INT CHECK (age >= 20 AND age <= 100),
    hascar CHAR(1) DEFAULT 'N',
    username VARCHAR(128) NOT NULL UNIQUE
);

-- Добавление 5 строк в таблицу employees
INSERT INTO employees (firstname, lastname, job, age, hascar, username)
VALUES 
    ('Alice', 'Smith', 'Engineer', 25, 'N', 'asmith'),
    ('Bob', 'Johnson', 'Manager', 30, 'Y', 'bjohnson'),
    ('Carol', 'Williams', 'HR', 35, 'N', 'cwilliams'),
    ('David', 'Brown', 'Developer', 40, 'Y', 'dbrown'),
    ('Emily', 'Davis', 'Designer', 29, 'N', 'edavis');

-- Удаление таблицы employees
DROP TABLE employees;

-- Удаление базы данных homeworks
DROP DATABASE homeworks;

-- Базы данных tasks и таблицы Staff
CREATE DATABASE tasks;
USE tasks;

-- Скрипт создания таблицы Staff из указанного репозитория.
CREATE TABLE Staff (
    id INT AUTO_INCREMENT PRIMARY KEY,
    firstname VARCHAR(128) NOT NULL,
    lastname VARCHAR(128) NOT NULL,
    age INT CHECK (age >= 20 AND age <= 100),
    username VARCHAR(128) NOT NULL UNIQUE
);

-- Данные в таблице Staff для тестирования
INSERT INTO Staff (firstname, lastname, age, username)
VALUES
    ('Alice', 'Anderson', 28, 'AAnderson'),
    ('Bob', 'Barnes', 35, 'BBarnes'),
    ('Chris', 'Carter', 42, 'CCarter'),
    ('David', 'Davis', 39, 'DDavis'),
    ('Emma', 'Evans', 30, 'EEvans');

-- Работники которым больше 20 и меньше 40
SELECT * FROM Staff 
WHERE age > 20 AND age < 40;

-- Только имена сотрудников, у которых username начинается на букву 'A' и им больше 20
SELECT firstname FROM Staff 
WHERE username LIKE 'A%' AND age > 20;

-- Имена, фамилии и возраст тех сотрудников, у которых id либо 3, либо 7, либо 10
SELECT firstname, lastname, age FROM Staff 
WHERE id IN (3, 7, 10);

-- Сотрудники у которых имя начинается на букву 'A', а фамилия заканчивается на букву 'S'
SELECT * FROM Staff 
WHERE firstname LIKE 'A%' AND lastname LIKE '%S';
