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
