# qa-portfolio
Моё портфолио тестировщика: чек-листы, тест-кейсы, баг-репорты, постман-коллекции.
## 🗄️ SQL-запросы

В файле [`queries.sql`](sql/queries.sql) собраны примеры SQL-запросов для гипотетической БД интернет-магазина.

Что включено:
- ✅ SELECT, WHERE, ORDER BY, LIMIT
- ✅ Агрегатные функции (COUNT, SUM, AVG)
- ✅ GROUP BY, HAVING
- ✅ INNER JOIN, LEFT JOIN
- ✅ Подзапросы (IN, NOT IN)
- ✅ Работа с датами

Пример запроса:
```sql
-- Найти пользователей, у которых сумма заказов превышает средний чек
SELECT users.username, SUM(orders.total) AS total_spent
FROM users
INNER JOIN orders ON users.id = orders.user_id
GROUP BY users.id
HAVING SUM(orders.total) > (SELECT AVG(total) FROM orders);
