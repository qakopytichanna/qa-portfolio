
# Портфолио начинающего тестировщика

 Привет! Я Аня, начинающий тестировщик ПО. 
Это моё портфолио с тестовой документацией, баг-репортами и примерами работ.

---

## Инструменты и технологии
- Тест-дизайн: чек-листы, тест-кейсы
- Баг-трекинг: GitHub Issues
- API-тестирование: Postman
- Базы данных: SQL (базовые запросы)
- Документация: Markdown, Google Sheets, Excel

---

## Проекты

### 1. Тестирование SauceDemo (интернет-магазин)

**Ссылка на сайт:** https://www.saucedemo.com/

| Артефакт | Описание | Ссылка |
|----------|----------|--------|
| **Чек-лист** | 32 проверки (логин, каталог, корзина, оформление) | [Смотреть](https://github.com/qakopytichanna/qa-portfolio/blob/main/portfolio/checklist/_Чек-листы%20для%20SauceDemo.xlsx) |
| **Тест-кейсы** | 19 тест-кейсов с шагами и ожидаемым результатом | [Смотреть](https://github.com/qakopytichanna/qa-portfolio/blob/main/portfolio/test-cases/Тест-кейсы%20для%20SauceDemo.xlsx) |
| **Тест-ран** | Результаты прогона тестов (Pass/Fail) | [Смотреть](https://github.com/qakopytichanna/qa-portfolio/blob/main/portfolio/test-run/Тест-ран%20для%20SauceDemo.xlsx) |
| **Баг-репорты** | 3 бага, оформленных в Issues | [Смотреть](https://github.com/issues/created) |

**Найденные баги:**
- [Баг №2](https://github.com/qakopytichanna/qakopytichanna/issues/2) — Неверное сообщение для заблокированного пользователя
- [Баг №3](https://github.com/qakopytichanna/qakopytichanna/issues/3) — Отсутствует изображение товара
- [Баг №4](https://github.com/qakopytichanna/qakopytichanna/issues/4) — Кнопка «Назад» после логаута возвращает в каталог

---

### 2. API-тестирование (Postman)

| Название | Что тестирует | Файл |
|----------|---------------|------|
| JSONPlaceholder API | Базовые CRUD-операции (GET, POST, PUT, DELETE) | [Скачать коллекцию](https://github.com/qakopytichanna/qa-portfolio/blob/main/portfolio/postman/JSONPlaceholder%20API%20Portfolio.postman_collection.json) |
| Petstore API | API Key авторизация, поиск по статусу, CRUD | [Скачать коллекцию](https://github.com/qakopytichanna/qa-portfolio/blob/main/portfolio/postman/Petstore%20API%20Portfolio.postman_collection.json) |

---

### 3. SQL-запросы

В файле [`queries.sql`](sql/queries.sql) собраны примеры запросов для гипотетической БД интернет-магазина.

**Что включено:**
- SELECT, WHERE, ORDER BY, LIMIT
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

## 📫 Контакты

- **Telegram:** @kkk_aesx
- **Email:** annakop17@gmail.com
- **GitHub:** [github.com/qakopytichanna](https://github.com/qakopytichanna)
