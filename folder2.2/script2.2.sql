-- Название и продолжительность самого длительного трека
SELECT title, duration FROM Track ORDER BY duration DESC LIMIT 1;

-- Название треков, продолжительность которых не менее 3.5 минут
SELECT title FROM Track WHERE duration >= '00:03:30';

-- Названия сборников, вышедших в период с 2018 по 2020 год включительно
SELECT title FROM Compilation WHERE release_year BETWEEN 2018 AND 2020;

-- Исполнители, чьё имя состоит из одного слова
SELECT name FROM Artist WHERE name NOT LIKE '% %';

-- Название треков, которые содержат слово «мой» или «my»
SELECT title FROM Track WHERE title ILIKE '%мой%' OR title ILIKE '%my%';
-- Количество исполнителей в каждом жанре
SELECT g.name AS genre_name, COUNT(DISTINCT ag.artist_id) AS artist_count
FROM Genre g
LEFT JOIN Artist_Genre ag ON g.id = ag.genre_id
GROUP BY g.id;

-- Количество треков, вошедших в альбомы 2019–2020 годов
SELECT COUNT(t.id) AS track_count
FROM Track t
JOIN Album a ON t.album_id = a.id
WHERE a.release_year BETWEEN 2019 AND 2020;

-- Средняя продолжительность треков по каждому альбому
SELECT a.title AS album_title, AVG(EXTRACT(EPOCH FROM t.duration)) / 60 AS avg_duration_minutes
FROM Album a
JOIN Track t ON a.id = t.album_id
GROUP BY a.id;

-- Все исполнители, которые не выпустили альбомы в 2020 году
SELECT DISTINCT ar.name 
FROM Artist ar 
WHERE ar.id NOT IN (
    SELECT DISTINCT aa.artist_id 
    FROM Artist_Album aa 
    JOIN Album al ON aa.album_id = al.id 
    WHERE al.release_year = 2020
);

-- Названия сборников, в которых присутствует конкретный исполнитель (например, Исполнитель 1)
SELECT DISTINCT c.title 
FROM Compilation c 
JOIN Track t ON c.id = t.compilation_id 
JOIN Artist_Album aa ON t.album_id = aa.album_id 
WHERE aa.artist_id = (SELECT id FROM Artist WHERE name = 'Исполнитель 1');
