-- Названия альбомов, в которых присутствуют исполнители более чем одного жанра
SELECT DISTINCT a.title AS album_title
FROM Album a
JOIN Artist_Album aa ON a.id = aa.album_id
JOIN Artist_Genre ag ON aa.artist_id = ag.artist_id
GROUP BY a.id
HAVING COUNT(DISTINCT ag.genre_id) > 1;

-- Наименования треков, которые не входят в сборники
SELECT t.title AS track_title
FROM Track t
LEFT JOIN Track_Compilation tc ON t.id = tc.track_id
WHERE tc.compilation_id IS NULL;

-- Исполнитель или исполнители, написавшие самый короткий по продолжительности трек
SELECT ar.name AS artist_name
FROM Artist ar
JOIN Artist_Album aa ON ar.id = aa.artist_id
JOIN Album al ON aa.album_id = al.id
JOIN Track t ON al.id = t.album_id
WHERE t.duration = (
    SELECT MIN(duration) 
    FROM Track
);

-- Названия альбомов, содержащих наименьшее количество треков
SELECT a.title AS album_title
FROM Album a
JOIN Track t ON a.id = t.album_id
GROUP BY a.id
HAVING COUNT(t.id) = (
    SELECT MIN(track_count)
    FROM (
        SELECT COUNT(t.id) AS track_count
        FROM Album a
        JOIN Track t ON a.id = t.album_id
        GROUP BY a.id
    ) AS subquery
);
