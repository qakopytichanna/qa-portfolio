# Портфолио начинающего тестировщика

 Привет! Я Аня, начинающий тестировщик ПО. 
Это моё портфолио с тестовой документацией и примерами работ.

---

## Что входит в портфолио

| Артефакт | Описание | Ссылка |
|----------|----------|--------|
| **Чек-лист** | 32 проверки для SauceDemo (логин, каталог, корзина, оформление) | [Смотреть](https://github.com/qakopytichanna/qa-portfolio/blob/main/portfolio/checklist/_Чек-листы%20для%20SauceDemo.xlsx) |
| **Тест-кейсы** | 19 тест-кейсов с шагами и ожидаемым результатом | [Смотреть](test-cases/saucedemo_testcases.xlsx) |
| **Тест-ран** | Результаты прогона тестов (Pass/Fail) | [Смотреть](test-run/saucedemo_testrun.xlsx) |
| **Баг-репорты** | 3 бага, оформленных в Issues | [Смотреть](../../issues) |
| **SQL-запросы** | Примеры запросов для БД интернет-магазина | [Смотреть](sql/queries.sql) |

---

## Найденные баги (в Issues)

| № | Описание бага | Ссылка |
|---|---------------|--------|
| #1 | Заблокированный пользователь получает неверное сообщение об ошибке | [Открыть](https://github.com/ваш-логин/ваш-репозиторий/issues/1) |
| #2 | Отсутствует изображение товара для problem_user | [Открыть](https://github.com/ваш-логин/ваш-репозиторий/issues/2) |
| #3 | Кнопка «Назад» после логаута возвращает в каталог | [Открыть](https://github.com/ваш-логин/ваш-репозиторий/issues/3) |

---

## SQL-запросы

В файле [`queries.sql`](sql/queries.sql) собраны примеры запросов:

- SELECT, WHERE, ORDER BY
- Агрегатные функции (COUNT, SUM, AVG)
- GROUP BY, HAVING
- INNER JOIN, LEFT JOIN
- Подзапросы

**Пример запроса:**
```sql
SELECT users.username, SUM(orders.total) AS total_spent
FROM users
INNER JOIN orders ON users.id = orders.user_id
GROUP BY users.id
HAVING SUM(orders.total) > (SELECT AVG(total) FROM orders);
