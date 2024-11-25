-- Вставка жанров
INSERT INTO Genre (name) VALUES
('Rock'),
('Pop'),
('Jazz');

-- Вставка исполнителей
INSERT INTO Artist (name) VALUES
('The Beatles'),
('Adele'),
('Miles Davis'),
('Queen');

-- Вставка альбомов
INSERT INTO Album (name, year) VALUES
('Abbey Road', 1969),
('25', 2015),
('A Night at the Opera', 1975);

-- Вставка треков
INSERT INTO Track (name, duration, album_id) VALUES
('Come Together', 259, 1),
('Someone Like You', 285, 2),
('So What', 548, 3),
('Bohemian Rhapsody', 354, 3),
('Let It Be', 243, 1),
('Rolling in the Deep', 228, 2);

-- Вставка сборников
INSERT INTO Compilation (name, year) VALUES
('Greatest Hits Volume 1', 1990),
('The Best of Adele', 2016),
('Jazz Classics', 2000),
('Rock Anthems', 2018);

-- Связь исполнителей и жанров
INSERT INTO Artist_Genre (artist_id, genre_id) VALUES
(1, 1), -- The Beatles - Rock
(2, 2), -- Adele - Pop
(3, 3), -- Miles Davis - Jazz
(4, 1), -- Queen - Rock
(4, 2); -- Queen - Pop

-- Связь исполнителей и альбомов
INSERT INTO Artist_Album (artist_id, album_id) VALUES
(1, 1), -- The Beatles - Abbey Road
(2, 2), -- Adele - 25
(3, 3), -- Miles Davis - So What
(4, 3), -- Queen - A Night at the Opera
(4, 1); -- Queen - Abbey Road

-- Связь треков и сборников
INSERT INTO Track_Compilation (track_id, compilation_id) VALUES
(1, 1), -- Come Together в Greatest Hits Volume 1
(2, 2), -- Someone Like You в The Best of Adele
(3, 3), -- So What в Jazz Classics
(4, 4), -- Bohemian Rhapsody в Rock Anthems
(5, 1), -- Let It Be в Greatest Hits Volume 1
(6, 2); -- Rolling in the Deep в The Best of Adele
