SELECT * FROM celebs;


CREATE TABLE table_name (
    column_1 data_type,
    column_2 data_type,
    column_3 data_type
  );


CREATE TABLE celebs (
  id INTEGER,
  name TEXT,
  age INTEGER
);


INSERT INTO celebs (id, name, age) VALUES (1, 'Justin Bieber', 21);

INSERT INTO celebs (id, name, age) VALUES (2, 'Beyonce Knowles', 33);

INSERT INTO celebs (id, name, age) VALUES (3, 'Jeremy Lin', 26);

INSERT INTO celebs (id, name, age) VALUES (4, 'Taylor Swift', 26);

SELECT name FROM celebs;


UPDATE celebs
SET age = 22
WHERE id = 1;

SELECT * FROM celebs;


ALTER TABLE celebs ADD COLUMN twitter_handle TEXT;

SELECT * FROM celebs;


UPDATE celebs
SET twitter_handle = '@taylorswift13'
WHERE id = 4;

SELECT * FROM celebs;


UPDATE celebs
SET twitter_handle = '@taylorswift13'
WHERE id = 4;

DELETE FROM celebs WHERE twitter_handle IS NULL;

SELECT * FROM celebs;


CREATE TABLE awards (
  id INTEGER PRIMARY KEY,
  recipient TEXT NOT NULL,
  award_name TEXT DEFAULT "Grammy");


-- SELECT
SELECT column1, column2
FROM table_name;

SELECT name, genre
FROM movies;


-- AS keyword allows you to rename a column or table using an alias
SELECT name AS 'Movies'
FROM movies;


-- DISTINCT
SELECT DISTINCT tools
FROM inventory;

SELECT DISTINCT genre
FROM movies;

SELECT DISTINCT year
FROM movies;


-- operators
SELECT *
FROM movies
WHERE imdb_rating > 8;

SELECT *
FROM movies
WHERE imdb_rating < 5;

SELECT *
FROM movies
WHERE year > 2014;


-- LIKE
SELECT *
FROM movies
WHERE name LIKE 'Se_en';

-- LIKE: % operator used after the 'A' to find all words that being with 'A'
SELECT *
FROM movies
WHERE name LIKE 'A%';

-- LIKE: % operator used after before and after 'man' to determine words
-- containing 'man'
SELECT *
FROM movies
WHERE name LIKE '%man%';


-- IS NULL  --> missing/unknown values are indicated by NULL
SELECT name
FROM movies
WHERE imdb_rating IS NULL;

-- IS NOT NULL  -->  filter for all movies with an IMDb rating
SELECT name
FROM movies
WHERE imdb_rating IS NOT NULL;


-- BETWEEN  -->  filter result set with a certain range
SELECT *
FROM movies
WHERE name BETWEEN 'A' AND 'J';

SELECT *
FROM movies
WHERE year BETWEEN 1990 AND 1999;


-- AND  -->  combine multiple conditions in a WHERE clause
SELECT *
FROM movies
WHERE year BETWEEN 1990 AND 1999
   AND genre = 'romance';

SELECT *
FROM movies
WHERE year BETWEEN 1970 AND 1979
   AND imdb_rating > 8;

SELECT *
FROM movies
WHERE year < 1985
   AND genre = 'horror';


-- OR
SELECT *
FROM movies
WHERE year > 2014
   OR genre = 'action';

SELECT *
FROM movies
WHERE genre = 'romance'
   OR genre = 'comedy';


-- ORDER BY
-- ORDER BY name  -->  sorts everythingg alphabetically
SELECT *
FROM movies
ORDER BY name;

-- ASC  -->  sort in ascending order
SELECT *
FROM movies
WHERE imdb_rating > 8
ORDER BY year ASC;

-- DESC  -->  sort in descending order
SELECT *
FROM movies
WHERE imdb_rating > 8
ORDER BY year DESC;

SELECT name, year
FROM movies
ORDER BY name;

SELECT name, year, imdb_rating
FROM movies
ORDER BY imdb_rating DESC;


-- LIMIT
SELECT *
FROM movies
LIMIT 5;

SELECT *
FROM movies
ORDER BY imdb_rating DESC
LIMIT 3;


-- CASE
SELECT name,
 CASE
  WHEN imdb_rating > 7 THEN 'Good'
  WHEN imdb_rating > 5 THEN 'Okay'
 END
FROM movies;

SELECT name,
	CASE
  	WHEN genre = 'romance' THEN 'fun'
    WHEN genre = 'comedy' THEN 'fun'
    ELSE 'serious'
  END AS 'mood'
FROM movies;


-- AGGREGATE FUNCTIONS

-- COUNT
SELECT COUNT(*)
FROM fake_apps
WHERE price = 0;


-- SUM
SELECT SUM(downloads)
FROM fake_apps;


-- MAX / MIN
SELECT MAX(downloads)
FROM fake_apps;

SELECT MIN(downloads)
FROM fake_apps;


-- AVERAGE
SELECT AVG(downloads)
FROM fake_apps;

SELECT AVG(price)
FROM fake_apps;


-- ROUND
-- we pass the column 'price' and integer '0' as arguments
-- SQL rounds the values in the column to zero decimal places in the output
SELECT ROUND(price, 0)
FROM fake_apps;

-- return the 'name' column and a rounded 'price' column
SELECT name, ROUND(price, 0)
FROM fake_apps;

-- get the average price of an app and round to 2 decimal places
SELECT ROUND(AVG(price), 2)
FROM fake_apps;


-- GROUP BY
-- used below to determine the mean/average ratings for all movies each year
SELECT year,
   AVG(imdb_rating)
FROM movies
GROUP BY year
ORDER BY year;

-- used below to count the total number of apps for each price in the table
SELECT price, COUNT(*)
FROM fake_apps
GROUP BY price;

-- calculates the total number of downloads for each category
SELECT category,
	SUM(downloads)
FROM fake_apps
GROUP BY category;

-- the following queries are equivalent:
SELECT ROUND(imdb_rating),
   COUNT(name)
FROM movies
GROUP BY ROUND(imdb_rating)
ORDER BY ROUND(imdb_rating);

SELECT ROUND(imdb_rating),
    COUNT(name)
 FROM movies
 GROUP BY 1
 ORDER BY 1;

-- the following queries are equivalent:
SELECT category,
   price,
   AVG(downloads)
FROM fake_apps
GROUP BY category, price;

SELECT category,
   price,
   AVG(downloads)
FROM fake_apps
GROUP BY 1, 2;


-- HAVING
SELECT year,
  genre,
  COUNT(name)
FROM movies
GROUP BY 1, 2
HAVING COUNT(name) > 10

SELECT price,
   ROUND(AVG(downloads))
FROM fake_apps
GROUP BY price
HAVING COUNT(*) > 9;


-- JOIN
-- combine 'orders' and 'customers'
SELECT *
FROM orders
JOIN customers
    ON orders.customer_id = customers.customer_id;

-- select 'order_id' from 'orders' and 'customer_name' from 'customers'
SELECT orders.order_id,
       customers.customer_name
FROM orders
JOIN customers
    ON orders.customer_id = customers.customer_id;

-- join 'orders' and 'subscriptions' and select all columns
-- join on subscription_id
SELECT *
FROM orders
JOIN subscriptions
	ON orders.subscription_id = subscriptions.subscription_id;

-- selects rows from the join where 'description' = 'Fashion Magazine'
SELECT *
FROM orders
JOIN subscriptions
	ON orders.subscription_id = subscriptions.subscription_id
WHERE subscriptions.description = 'Fashion Magazine';


-- LEFT JOINs
SELECT *
FROM table1
LEFT JOIN table2
  ON table1.c2 = table2.c2

SELECT *
FROM newspaper
LEFT JOIN online
  ON newspaper.id = online.id;

SELECT *
FROM newspaper
LEFT JOIN online
  ON newspaper.id = online.id;


-- PRIMARY KEY versus FOREIGN KEY
SELECT *
FROM classes
JOIN students
	ON classes.id = students.class_id;


-- CREATE TABLE
CREATE TABLE friends (
	id INT,
  name VARCHAR,
  birthday VARCHAR
);

INSERT INTO friends
(name, birthday) VALUES ('Jane Doe', 'May 19th, 1993');

INSERT INTO friends
(name, name, name) VALUES ('John Doe', 'Jim Doe', 'June Doe');

UPDATE friends
SET name = 'Jane Smith'
WHERE id = 1;

ALTER TABLE friends ADD COLUMN email;

UPDATE friends
SET email = 'jdoe@example.com'
WHERE id = 1;

DELETE FROM friends
WHERE id = 1;


-- CROSS JOIN
SELECT shirts.shirt_color,
       pants.pant_color
FROM shirts
CROSS JOIN pants;

SELECT *
FROM newspaper
CROSS JOIN months
WHERE start_month < month
	AND end_month > month;

SELECT months.month,
  COUNT(*)
FROM newspaper
CROSS JOIN months
WHERE start_month < month
  AND end_month > month
GROUP BY months.month;


-- UNION
SELECT *
FROM table1
UNION
SELECT *
FROM table2;

SELECT *
FROM newspaper
UNION
SELECT *
FROM online;


-- WITH
WITH previous_query AS (
SELECT customer_id,
       COUNT(subscription_id) as subscriptions
FROM orders
GROUP BY customer_id)
SELECT customers.customer_name,
previous_query.subscriptions
FROM previous_query
JOIN customers
	ON customers.customer_id = previous_query.customer_id;
