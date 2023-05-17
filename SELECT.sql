SELECT name, year FROM album
WHERE year = 2018;

SELECT name, duration  FROM track
WHERE duration = (SELECT MAX(duration) FROM track);

SELECT name  FROM track
WHERE duration > 210;

SELECT name  FROM collection c 
WHERE year between 2018 and 2020;

SELECT name FROM executor
WHERE name  not LIKE  '% %';

SELECT name FROM track
WHERE name like '%My%' or name like '%Мой%' or name like '%my%' or name like '%мой%';

