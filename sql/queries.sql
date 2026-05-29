-- ============================================
-- SQL-запросы для портфолио тестировщика
-- База данных: интернет-магазин (аналог SauceDemo)
-- ============================================

-- 1. Простые запросы (SELECT, WHERE, ORDER BY)
-- ============================================

-- 1.1. Вывести всех пользователей
SELECT * FROM users;

-- 1.2. Вывести пользователя с id = 5
SELECT * FROM users WHERE id = 5;

-- 1.3. Вывести все товары дороже 50 долларов
SELECT * FROM products WHERE price > 50;

-- 1.4. Вывести все товары из категории 'electronics', отсортированные по цене (сначала дешёвые)
SELECT * FROM products 
WHERE category = 'electronics' 
ORDER BY price ASC;

-- 1.5. Вывести 5 самых дорогих товаров
SELECT * FROM products 
ORDER BY price DESC 
LIMIT 5;

-- 2. Запросы с агрегатными функциями (COUNT, SUM, AVG, MIN, MAX)
-- ============================================

-- 2.1. Посчитать общее количество пользователей
SELECT COUNT(*) AS total_users FROM users;

-- 2.2. Посчитать количество заказов со статусом 'completed'
SELECT COUNT(*) AS completed_orders 
FROM orders 
WHERE status = 'completed';

-- 2.3. Найти средний чек (сумму заказа) по всем выполненным заказам
SELECT AVG(total) AS avg_order_value 
FROM orders 
WHERE status = 'completed';

-- 2.4. Найти минимальную и максимальную цену товара в каждой категории
SELECT category, 
       MIN(price) AS min_price, 
       MAX(price) AS max_price 
FROM products 
GROUP BY category;

-- 2.5. Посчитать общую выручку магазина
SELECT SUM(total) AS total_revenue 
FROM orders 
WHERE status = 'completed';

-- 3. Запросы с группировкой (GROUP BY)
-- ============================================

-- 3.1. Посчитать количество заказов по каждому пользователю
SELECT user_id, COUNT(*) AS orders_count 
FROM orders 
GROUP BY user_id;

-- 3.2. Посчитать количество заказов по каждому статусу
SELECT status, COUNT(*) AS orders_count 
FROM orders 
GROUP BY status;

-- 3.3. Найти пользователей, у которых больше 3 заказов (HAVING)
SELECT user_id, COUNT(*) AS orders_count 
FROM orders 
GROUP BY user_id 
HAVING COUNT(*) > 3;

-- 4. Запросы с JOIN (объединение таблиц)
-- ============================================

-- 4.1. Вывести все заказы с именами пользователей (INNER JOIN)
SELECT orders.id, users.username, orders.order_date, orders.total 
FROM orders
INNER JOIN users ON orders.user_id = users.id;

-- 4.2. Вывести список пользователей и их заказы (включая пользователей без заказов)
SELECT users.username, orders.id AS order_id, orders.total 
FROM users
LEFT JOIN orders ON users.id = orders.user_id;

-- 4.3. Вывести все товары в заказе с деталями (связь через order_items)
SELECT orders.id AS order_id, 
       products.name AS product_name, 
       order_items.quantity, 
       order_items.price
FROM orders
INNER JOIN order_items ON orders.id = order_items.order_id
INNER JOIN products ON order_items.product_id = products.id
WHERE orders.id = 10;

-- 4.4. Найти пользователей, которые ничего не заказали
SELECT users.username, users.email
FROM users
LEFT JOIN orders ON users.id = orders.user_id
WHERE orders.id IS NULL;

-- 5. Подзапросы
-- ============================================

-- 5.1. Найти пользователей, у которых сумма заказов превышает средний чек
SELECT users.username, SUM(orders.total) AS total_spent
FROM users
INNER JOIN orders ON users.id = orders.user_id
GROUP BY users.id
HAVING SUM(orders.total) > (SELECT AVG(total) FROM orders);

-- 5.2. Найти товар, который ни разу не заказывали
SELECT products.name
FROM products
WHERE products.id NOT IN (
    SELECT DISTINCT product_id 
    FROM order_items
);

-- 6. Даты и форматирование
-- ============================================

-- 6.1. Найти заказы за последние 30 дней
SELECT * FROM orders 
WHERE order_date >= CURDATE() - INTERVAL 30 DAY;

-- 6.2. Посчитать количество заказов по месяцам
SELECT DATE_FORMAT(order_date, '%Y-%m') AS month, 
       COUNT(*) AS orders_count 
FROM orders 
GROUP BY month 
ORDER BY month DESC;
