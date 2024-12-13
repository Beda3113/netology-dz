-- 1. Количество исполнителей в каждом жанре:
SELECT g.name AS genre, COUNT(ag.artist_id) AS artist_count
FROM Genre g
LEFT JOIN Artist_Genre ag ON g.id = ag.genre_id
GROUP BY g.name;


-- 2. Количество треков в альбомах 2019-2020 годов:
SELECT COUNT(*) AS track_count
FROM Track t
JOIN Album a ON t.album_id = a.id
WHERE a.year BETWEEN 2019 AND 2020;

-- 3. Средняя продолжительность треков по альбомам:
SELECT a.name AS album_name, AVG(t.duration) AS avg_duration
FROM Album a
JOIN Track t ON a.id = t.album_id
GROUP BY a.name;


-- 4. Исполнители без альбомов в 2020 году:
SELECT DISTINCT art.name
FROM Artist art
WHERE art.id NOT IN (
    SELECT aa.artist_id
    FROM Artist_Album aa
    JOIN Album alb ON aa.album_id = alb.id
    WHERE alb.year = 2020
);


-- 5. Сборники с конкретным исполнителем:
SELECT DISTINCT c.name
FROM Compilation c
JOIN Track_Compilation ct ON c.id = ct.compilation_id
JOIN Track t ON ct.track_id = t.id
JOIN Artist_Album aa ON t.album_id = aa.album_id
JOIN Artist a ON aa.artist_id = a.id
WHERE a.name = 'The Beatles';
