-- Количество исполнителей в каждом жанре.
SELECT g.name , COUNT(*) FROM executorgenre e 
RIGHT JOIN genre g ON e.genre_id = g.id 
GROUP BY g.name
ORDER BY COUNT(*) desc, g.name;

--Количество треков, вошедших в альбомы 2019–2020 годов
SELECT count(t.id) FROM track t 
JOIN album a ON t.album_id  = a.id
WHERE a.year BETWEEN 2019 AND 2020;

--Средняя продолжительность треков по каждому альбому.
SELECT a.name, avg(t.duration) FROM track t 
join album a ON t.album_id = a.id
GROUP  BY a.name
ORDER BY avg(t.duration), a.name;

--Все исполнители, которые не выпустили альбомы в 2020 году.
SELECT e.name FROM executor e  
WHERE e.name not in (
	SELECT e2.name FROM executor e2
	JOIN albumexecutor a ON a.executor_id = e2.id
	JOIN album a2 ON a2.id = a.album_id
	WHERE YEAR = 2020);

--Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами)
SELECT c.name FROM collection c  
JOIN collectiontrack c2 ON c2.collection_id = c.id 
JOIN track t ON t.id = c2.track_id
JOIN album a ON a.id = t.album_id  
JOIN albumexecutor a2 ON a2.album_id = a.id 
JOIN executor e ON e.id = a2.executor_id 
WHERE e.name = 'Limp Bizkit'
ORDER BY c.name;

--Названия альбомов, в которых присутствуют исполнители более чем одного жанра.
SELECT DISTINCT a.name FROM album a 
JOIN albumexecutor a2 ON a2.album_id = a.id 
JOIN executor e ON e.id = a2.executor_id 
JOIN executorgenre e2 ON e2.executor_id = e.id 
GROUP BY a.name, e2.executor_id 
HAVING count(*) > 1;

--Наименования треков, которые не входят в сборники.
SELECT t.name FROM track t 
LEFT JOIN collectiontrack c  ON c.track_id = t.id 
WHERE c.collection_id  IS NULL
ORDER BY t.name;

--Исполнитель или исполнители, написавшие самый короткий по продолжительности трек,
-- теоретически таких треков может быть несколько.
SELECT e.name FROM executor e 
JOIN albumexecutor a ON a.executor_id = e.id 
JOIN album a2 ON a2.id = a.album_id 
JOIN track t ON t.album_id = a2.id
WHERE t.duration = (SELECT min(duration) FROM track t2)
ORDER BY e.name;

--Названия альбомов, содержащих наименьшее количество треков.
SELECT a.name FROM album a 
JOIN track t ON t.album_id = a.id 
GROUP BY a.id 
HAVING count(*) = (
	SELECT count(*)  FROM track t2 
	GROUP BY album_id 
	ORDER BY count
	LIMIT 1);







