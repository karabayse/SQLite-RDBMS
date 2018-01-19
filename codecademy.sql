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
