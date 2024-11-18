-- Запрос 1: Название и продолжительность самого длительного трека.
SELECT title, duration
FROM Tracks
ORDER BY duration DESC
LIMIT 1;

-- Запрос 2: Название треков, продолжительность которых не менее 3,5 минут.
SELECT title
FROM Tracks
WHERE duration >= 3.5;

-- Запрос 3: Названия сборников, вышедших в период с 2018 по 2020 год включительно.
SELECT title
FROM Albums
WHERE release_year BETWEEN 2018 AND 2020;

-- Запрос 4: Исполнители, чьё имя состоит из одного слова.
SELECT name
FROM Artists
WHERE name NOT LIKE '% %';  -- Не содержит пробелов

-- Запрос 5: Название треков, которые содержат слово «мой» или «my».
SELECT title
FROM Tracks
WHERE title LIKE '%мой%' OR title LIKE '%my%';

-- Запрос 6: Количество уникальных жанров для каждого исполнителя.
SELECT a.artist_id, a.name, COUNT(DISTINCT g.genre_id) AS genre_count
FROM Artists a
JOIN ArtistGenres ag ON a.artist_id = ag.artist_id
JOIN Genres g ON ag.genre_id = g.genre_id
GROUP BY a.artist_id, a.name;
