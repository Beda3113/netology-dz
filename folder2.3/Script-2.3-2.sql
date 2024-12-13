
-- Запрос 1: Название и продолжительность самого длительного трека
SELECT name, duration
FROM Track
ORDER BY duration DESC
LIMIT 1;

-- Запрос 1: Название и продолжительность самого длительного трека
SELECT name
FROM Track
WHERE duration >= 210;

-- Запрос 3: Названия сборников, вышедших в период с 2018 по 2020 год
SELECT name
FROM Compilation
WHERE year BETWEEN 2018 AND 2020;

-- Запрос 4: Исполнители, чьё имя состоит из одного слова
SELECT name
FROM Artist
WHERE name NOT LIKE '% %';

-- Запрос 5: Название треков, которые содержат слово «мой» или «my»
select name
FROM track
WHERE string_to_array(lower(name), ' ') && ARRAY['мой', 'my'];
-- вариант для сравнения 
    SELECT name
FROM Track
WHERE LOWER(name) LIKE '%мой%' 
   OR LOWER(name) LIKE '%my%';
