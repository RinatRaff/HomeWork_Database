SELECT g.name , COUNT(*) FROM executorgenre e 
JOIN genre g ON e.genre_id = g.id 
GROUP BY g.name
ORDER BY COUNT(*) desc, g.name;

SELECT count(t.id) FROM track t 
JOIN album a ON t.album_id  = a.id
WHERE a.year BETWEEN 2019 AND 2020;

SELECT a.name, avg(t.duration) FROM track t 
join album a ON t.album_id = a.id
GROUP  BY a.name
ORDER BY avg(t.duration), a.name;

SELECT e.name FROM albumexecutor a  
JOIN album a2 ON a2.id = a.album_id 
JOIN executor e ON e.id = a.executor_id 
WHERE a2.year != 2020
ORDER BY e.name;

SELECT c.name FROM collection c  
JOIN collectiontrack c2 ON c2.collection_id = c.id 
JOIN track t ON t.id = c2.track_id
JOIN album a ON a.id = t.album_id  
JOIN albumexecutor a2 ON a2.album_id = a.id 
JOIN executor e ON e.id = a2.executor_id 
WHERE e.name = 'Limp Bizkit'
ORDER BY c.name;

SELECT a.name, COUNT(DISTINCT g.id) FROM album a 
JOIN albumexecutor a2 ON a2.album_id = a.id 
JOIN executor e ON e.id = a2.executor_id 
JOIN executorgenre e2 ON e2.executor_id = e.id 
JOIN genre g ON g.id = e2.genre_id
GROUP BY a.name
ORDER BY COUNT(DISTINCt g.id), a.name;

SELECT t.name FROM track t 
LEFT JOIN collectiontrack c ON c.track_id = t.id 
LEFT JOIN collection c2 ON c2.id = c.collection_id
WHERE c2.name IS NULL
ORDER BY t."name";

SELECT e.name FROM executor e 
JOIN albumexecutor a ON a.executor_id = e.id 
JOIN album a2 ON a2.id = a.album_id 
JOIN track t ON t.album_id = a2.id
WHERE t.duration = (SELECT min(duration) FROM track t2)
ORDER BY e.name;

select name from album a 
where id in 
(select album_id from track t2
group by album_id
having count(*) in
(select count(*) from track t 
group by album_id 
order by count
limit 1));







