-- 12. Создать базу данных shop и заполнить её, используя скрипт.
CREATE DATABASE shop;
USE shop;
SHOW TABLES;

-- 13. Вывести всех продавцов, чьи имена начинаются на букву 'L'.
SELECT * 
FROM sellers
WHERE SNAME LIKE 'L%';

-- 14. Вывести всех клиентов из города Тула с рейтингом больше 100.
SELECT * 
FROM customers
WHERE CITY = 'Тула' AND RATING > 100;

-- 15. Вывести всех продавцов, чьи комиссии между 0.10 и 0.15 (включительно).
SELECT * 
FROM sellers
WHERE COMM BETWEEN 0.10 AND 0.15;

-- 16. Вывести заказы, сумма которых меньше 1000 и дата которых после 1 апреля 2022 года.
SELECT * FROM orders
WHERE AMT < 1000 AND ODATE > '2022-04-01';

-- 17. Вывести список всех продавцов из Москвы, отсортированный по убыванию их идентификаторов.
SELECT * FROM sellers
WHERE CITY = 'Москва'
ORDER BY SELL_ID DESC;

-- 18. Вывести все заказы, сделанные клиентом с ID 304, и отсортировать по сумме заказа (AMT) в порядке убывания.
SELECT * FROM orders
WHERE CUST_ID = 304
ORDER BY AMT DESC;

-- 19. Вывести пары покупателей и обслуживших их продавцов из одного города.
SELECT c.CNAME AS CustomerName, s.SNAME AS SellerName
FROM customers c
JOIN orders o ON c.CUST_ID = o.CUST_ID
JOIN sellers s ON o.SELL_ID = s.SELL_ID
WHERE c.CITY = s.CITY;

-- 20. Вывести все заказы, сделанные в марте.
SELECT * FROM orders
WHERE MONTH(ODATE) = 3;

-- 21. Вывести имена клиентов, которые сделали заказ в апреле 2022 года, и соответствующие суммы их заказов.
SELECT c.CNAME, o.AMT
FROM customers c
JOIN orders o ON c.CUST_ID = o.CUST_ID
WHERE MONTH(o.ODATE) = 4 AND YEAR(o.ODATE) = 2022;

-- 22. Вывести имена всех продавцов и соответствующих клиентов, которые сделали заказ у этих продавцов.
SELECT s.SNAME AS SellerName, c.CNAME AS CustomerName
FROM sellers s
JOIN orders o ON s.SELL_ID = o.SELL_ID
JOIN customers c ON c.CUST_ID = o.CUST_ID;

-- 23. Вывести имена продавцов и города их клиентов, сделавших заказ.
SELECT s.SNAME AS SellerName, c.CITY AS CustomerCity
FROM sellers s
JOIN orders o ON s.SELL_ID = o.SELL_ID
JOIN customers c ON c.CUST_ID = o.CUST_ID;

-- 24. Вывести имена клиентов и их соответствующих продавцов, если клиент сделал заказ.
SELECT c.CNAME AS CustomerName, s.SNAME AS SellerName
FROM customers c
JOIN orders o ON c.CUST_ID = o.CUST_ID
JOIN sellers s ON s.SELL_ID = o.SELL_ID;

-- 25. Вывести имена продавцов, у которых нет заказов.
SELECT s.SNAME
FROM sellers s
LEFT JOIN orders o ON s.SELL_ID = o.SELL_ID
WHERE o.ORDER_ID IS NULL;

-- 26. Вывести всех клиентов, у которых есть заказы, и суммы этих заказов.
SELECT c.CNAME AS CustomerName, o.AMT AS OrderAmount
FROM customers c
JOIN orders o ON c.CUST_ID = o.CUST_ID;

-- 27. Вывести всех клиентов и их продавцов, включая тех, у кого нет заказов.
SELECT c.CNAME AS CustomerName, s.SNAME AS SellerName
FROM customers c
LEFT JOIN orders o ON c.CUST_ID = o.CUST_ID
LEFT JOIN sellers s ON o.SELL_ID = s.SELL_ID;

-- 28. Вывести имена всех продавцов, которые продают товары клиентам из Тулы.
SELECT DISTINCT s.SNAME
FROM sellers s
JOIN orders o ON s.SELL_ID = o.SELL_ID
JOIN customers c ON c.CUST_ID = o.CUST_ID
WHERE c.CITY = 'Тула';

-- 29. Вывести все заказы и соответствующих клиентов, для которых сумма заказа превышает 5000.
SELECT o.*, c.CNAME AS CustomerName
FROM orders o
JOIN customers c ON o.CUST_ID = c.CUST_ID
WHERE o.AMT > 5000;

-- 30. Вывести имена всех клиентов и продавцов, которые сделали заказ в июне 2022 года.
SELECT c.CNAME AS CustomerName, s.SNAME AS SellerName
FROM customers c
JOIN orders o ON c.CUST_ID = o.CUST_ID
JOIN sellers s ON o.SELL_ID = s.SELL_ID
WHERE MONTH(o.ODATE) = 6 AND YEAR(o.ODATE) = 2022;
