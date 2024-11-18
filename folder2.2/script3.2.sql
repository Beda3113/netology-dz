-- Запрос 1: Количество исполнителей в каждом жанре с дополнительной группировкой по ID исполнителей.
SELECT g.genre_name, COUNT(DISTINCT a.artist_id) AS artist_count
FROM Genres g
JOIN ArtistGenres ag ON g.genre_id = ag.genre_id
JOIN Artists a ON ag.artist_id = a.artist_id
GROUP BY g.genre_name;

-- Запрос 2: Количество треков, вошедших в альбомы 2019–2020 годов.
SELECT COUNT(t.track_id) AS track_count
FROM Tracks t
JOIN Albums a ON t.album_id = a.album_id
WHERE a.release_year BETWEEN 2019 AND 2020;

-- Запрос 3: Средняя продолжительность треков по каждому альбому с учетом исполнителей.
SELECT a.title AS album_title, AVG(t.duration) AS average_duration
FROM Albums a
JOIN Tracks t ON a.album_id = t.album_id
GROUP BY a.title;

-- Запрос 4: Все исполнители, которые не выпустили альбомы в 2020 году.
SELECT DISTINCT a.name
FROM Artists a
WHERE a.artist_id NOT IN (
    SELECT DISTINCT artist_id
    FROM Albums
    WHERE release_year = 2020
);

-- Запрос 5: Названия сборников, в которых присутствует конкретный исполнитель с учетом его жанров.
SELECT DISTINCT al.title AS album_title
FROM Albums al
JOIN Tracks t ON al.album_id = t.album_id
JOIN Artists a ON t.artist_id = a.artist_id
WHERE a.name = 'ArtistName';  -- Замените 'ArtistName' на имя исполнителя.
