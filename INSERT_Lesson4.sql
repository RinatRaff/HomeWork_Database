INSERT INTO genre(name) 
VALUES
('Ню-метал'),
('Поп'),
('Рэп'),
('Ска-панк'),
('Поп-панк')
;
UPDATE genre
SET name = 'Рэп-рок'
WHERE id = 1;
INSERT INTO executor (name) 
VALUES
('Limp Bizkit'),
('Slipknot'),
('Green day'),
('Гудтаймс'),
('Anacondaz'),
('Attila'),
('Sati Akura'),
('Noize MC'),
('Ляпис Трубецкой');
INSERT INTO executorgenre (executor_id, genre_id) 
VALUES
(1, 1),
(1, 2),
(2, 2),
(3, 6),
(4, 5),
(5, 1),
(5, 4),
(6, 2),
(7, 3),
(8, 4),
(9, 3),
(3, 5);
INSERT INTO album(name, year) 
VALUES
('Walking in the Darkness', 2019),
('STILL SUCKS', 2021),
('American Idiot', 2004),
('Просто сложно понять', 2018),
('About That Life', 2013),
('Iowa',2001),
('Мои дети не будут скучать', 2019),
('No Comments', 2018),
('Весёлые картинки', 2011);
INSERT INTO albumexecutor (album_id, executor_id) 
VALUES
(1, 7),
(2, 1),
(3, 3),
(4, 4),
(5, 6),
(6, 2),
(7, 5),
(7, 8),
(8, 8),
(9, 9);
INSERT INTO track (name, duration, album_id) 
VALUES
('Smackin Killa', 239, 1),
('Walking in the Darkness', 172, 1),
('Out Of Style', 202, 2),
('Dad Vibes', 132, 2),
('American Idiot', 174, 3),
('Wake Me up When September Ends', 285, 3),
('Твои глаза', 231, 4),
('Раз и навсегда', 204, 4),
('Middle Fingers Up', 157, 5),
('Thug Life', 167, 5),
('People = Shit', 215, 6),
('The Heretic Anthem', 253, 6),
('Пусть они умрут', 385, 7),
('Бойня номер шесть', 236, 7),
('В темноте', 206, 8),
('Детка, послушай', 218, 8),
('Космонавты', 198, 9),
('Африка', 236, 9);

TRUNCATE TABLE collection, collectiontrack RESTART IDENTITY;

INSERT INTO collection (name, year) 
VALUES
('Понедельник', 2019),
('Вторник', 2021),
('Среда', 2004),
('Четверг', 2018),
('Пятница', 2013),
('Суббота',2001),
('Воскресенье', 2019),
('Выходной', 2018);
INSERT INTO collectiontrack  (collection_id, track_id) 
VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 4),
(2, 5),
(2, 6),
(3, 7),
(3, 8),
(3, 9),
(4, 10),
(4, 11),
(4, 12),
(5, 13),
(5, 14),
(5, 15),
(6, 16),
(6, 17),
(6, 18),
(7, 1),
(7, 2),
(7, 3),
(8, 4),
(8, 5),
(8, 6);
UPDATE track 
SET name = 'My Plague'
where id = 12;

INSERT INTO track (name, duration, album_id) 
values ('Turn It Up, Bitch', 140, 2);

INSERT INTO track (name, duration, album_id) 
values ('Left Behind', 140, 6);

UPDATE track 
SET duration  = 132
where id = 20;




