-- Запрос 1: Название и продолжительность самого длительного трека
SELECT name, duration
FROM Track
ORDER BY duration DESC
LIMIT 1;

-- Запрос 2: Название треков, продолжительность которых не менее 3,5 минут
SELECT name
FROM Track
WHERE duration >= 210; -- 3,5 минуты = 210 секунд

-- Запрос 3: Названия сборников, вышедших в период с 2018 по 2020 год включительно
SELECT name
FROM Compilation
WHERE year BETWEEN 2018 AND 2020;

-- Запрос 4: Исполнители, чьё имя состоит из одного слова
SELECT name
FROM Artist
WHERE name NOT LIKE '% %'; -- Имя не должно содержать пробелов

-- Запрос 5: Название треков, которые содержат слово «мой» или «my»
SELECT name
FROM Tracks
WHERE lower(string_to_array(title, ' ')) && ARRAY['мой', 'my'];

