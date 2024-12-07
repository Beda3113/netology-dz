-- Вставка жанров
INSERT INTO Genre (name) VALUES 
('Поп'),
('Рок'),
('Хип-хоп');

-- Вставка исполнителей
INSERT INTO Artist (name) VALUES 
('Исполнитель 1'),
('Исполнитель 2'),
('Исполнитель 3'),
('Исполнитель 4');

-- Вставка альбомов
INSERT INTO Album (title, release_year) VALUES 
('Альбом 1', 2020),
('Альбом 2', 2021),
('Альбом 3', 2022);

-- Вставка треков
INSERT INTO Track (title, duration, album_id) VALUES 
('Трек 1', '00:03:30', 1),
('Трек 2', '00:04:00', 1),
('Трек 3', '00:02:45', 2),
('Трек 4', '00:03:15', 2),
('Трек 5', '00:04:20', 3),
('Трек 6', '00:03:50', 3);

-- Вставка сборников
INSERT INTO Compilation (title, release_year) VALUES 
('Сборник 1', 2020),
('Сборник 2', 2021),
('Сборник 3', 2022),
('Сборник 4', 2023);

-- Связываем исполнителей с жанрами
INSERT INTO Artist_Genre (artist_id, genre_id) VALUES 
(1, 1), -- Исполнитель 1 - Поп
(1, 2), -- Исполнитель 1 - Рок
(2, 2), -- Исполнитель 2 - Рок
(2, 3), -- Исполнитель 2 - Хип-хоп
(3, 1), -- Исполнитель 3 - Поп
(4, 3); -- Исполнитель 4 - Хип-хоп

-- Связываем исполнителей с альбомами
INSERT INTO Artist_Album (artist_id, album_id) VALUES 
(1, 1), -- Исполнитель 1 - Альбом 1
(1, 2), -- Исполнитель 1 - Альбом 2
(2, 2), -- Исполнитель 2 - Альбом 2
(3, 3); -- Исполнитель 3 - Альбом 3

-- Связываем треки со сборниками
INSERT INTO Track_Compilation (track_id, compilation_id) VALUES 
(1, 1), -- Трек 1 - Сборник 1
(2, 1), -- Трек 2 - Сборник 1
(3, 2), -- Трек 3 - Сборник 2
(4, 2), -- Трек 4 - Сборник 2
(5, 3), -- Трек 5 - Сборник 3
(6, 4); -- Трек 6 - Сборник 4
