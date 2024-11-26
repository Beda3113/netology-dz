-- 1. Количество исполнителей в каждом жанре
WITH artist_count AS (
    SELECT g.name AS genre, COUNT(DISTINCT a.id) AS artist_count
    FROM Genre g
    JOIN Artist a ON g.id = a.genre_id
    GROUP BY g.name
),

-- 2. Количество треков, вошедших в альбомы 2019–2020 годов
track_count AS (
    SELECT COUNT(t.id) AS track_count
    FROM Track t
    JOIN Album a ON t.album_id = a.id
    WHERE a.year BETWEEN 2019 AND 2020
),

-- 3. Средняя продолжительность треков по каждому альбому
average_duration AS (
    SELECT a.name AS album_name, AVG(t.duration) AS average_duration
    FROM Album a
    JOIN Track t ON a.id = t.album_id
    GROUP BY a.name
),

-- 4. Все исполнители, которые не выпустили альбомы в 2020 году
artists_no_albums_2020 AS (
    SELECT DISTINCT a.name
    FROM Artist a
    WHERE NOT EXISTS (
        SELECT 1
        FROM Album al
        WHERE al.artist_id = a.id AND al.year = 2020
    )
),

-- 5. Названия сборников, в которых присутствует конкретный исполнитель 
compilations_for_artist AS (
    SELECT c.name AS compilation_name
    FROM Compilation c
    JOIN Track t ON c.id = t.compilation_id
    JOIN Artist a ON t.artist_id = a.id
    WHERE a.name = 'The Beatles' 
)
