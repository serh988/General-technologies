-- Уровень 1 сложности: Создать базу данных oe
CREATE DATABASE oe;
USE oe;

-- 1. Вывести имя, фамилию покупателей и даты их заказов (ORDER_DATE)
SELECT 
    CUST_FIRST_NAME, 
    CUST_LAST_NAME, 
    ORDER_DATE
FROM customers
JOIN orders ON customers.CUSTOMER_ID = orders.CUSTOMER_ID;

-- 2. Вывести даты заказов продуктов и описание этих продуктов (PRODUCT_DESCRIPTION)
SELECT 
    orders.ORDER_DATE, 
    product_information.PRODUCT_DESCRIPTION
FROM orders
JOIN order_items ON orders.ORDER_ID = order_items.ORDER_ID
JOIN product_information ON order_items.PRODUCT_ID = product_information.PRODUCT_ID;

-- 3. Вывести имя, фамилию покупателей, даты заказов, описание продуктов и категории продуктов
SELECT 
    customers.CUST_FIRST_NAME,
    customers.CUST_LAST_NAME,
    orders.ORDER_DATE,
    product_information.PRODUCT_DESCRIPTION,
    categories_tab.CATEGORY_NAME
FROM customers
JOIN orders ON customers.CUSTOMER_ID = orders.CUSTOMER_ID
JOIN order_items ON orders.ORDER_ID = order_items.ORDER_ID
JOIN product_information ON order_items.PRODUCT_ID = product_information.PRODUCT_ID
JOIN categories_tab ON product_information.CATEGORY_ID = categories_tab.CATEGORY_ID;

-- 4. Вывести названия продуктов, описания категорий и минимальные цены > 300
SELECT 
    PRODUCT_NAME, 
    CATEGORY_DESCRIPTION, 
    MIN_PRICE
FROM product_information
JOIN categories_tab ON product_information.CATEGORY_ID = categories_tab.CATEGORY_ID
WHERE MIN_PRICE > 300;

-- 5. Вывести имя и фамилию всех женатых мужчин покупателей, которые купили продукты со стоимостью (LIST_PRICE) больше 550
SELECT 
    CUST_FIRST_NAME, 
    CUST_LAST_NAME
FROM customers
JOIN orders ON customers.CUSTOMER_ID = orders.CUSTOMER_ID
JOIN order_items ON orders.ORDER_ID = order_items.ORDER_ID
WHERE customers.MARITAL_STATUS = 'Married'
  AND customers.GENDER = 'M'
  AND order_items.UNIT_PRICE > 550;

-- 6. Вывести те продукты (PRODUCT_NAME), которых нет в заказанных (таблица ORDER_ITEMS)
SELECT 
    PRODUCT_NAME
FROM product_information
LEFT JOIN order_items ON product_information.PRODUCT_ID = order_items.PRODUCT_ID
WHERE order_items.PRODUCT_ID IS NULL;

-- 7. Вывести покупателей (CUST_FIRST_NAME, CUST_LAST_NAME), которые ничего не заказали (таблица ORDERS)
SELECT 
    CUST_FIRST_NAME, 
    CUST_LAST_NAME
FROM customers
LEFT JOIN orders ON customers.CUSTOMER_ID = orders.CUSTOMER_ID
WHERE orders.ORDER_ID IS NULL;
