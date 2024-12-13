
CREATE TABLE IF NOT EXISTS Artist (
    id SERIAL PRIMARY KEY,
    name VARCHAR(40) NOT NULL
);

CREATE TABLE IF NOT EXISTS Genre (
    id SERIAL PRIMARY KEY,
    name VARCHAR(40) NOT NULL
);

CREATE TABLE IF NOT EXISTS Album (
    id SERIAL PRIMARY KEY,
    name VARCHAR(40) NOT NULL,
    year INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS Compilation (
    id SERIAL PRIMARY KEY,
    name VARCHAR(40) NOT NULL,
    year INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS Track (
    id SERIAL PRIMARY KEY,
    name VARCHAR(40) NOT NULL,
    duration INTEGER NOT NULL,
    album_id INTEGER REFERENCES Album(id)
);

CREATE TABLE IF NOT EXISTS Artist_Genre (
    artist_id INTEGER REFERENCES Artist(id),
    genre_id INTEGER REFERENCES Genre(id),
    CONSTRAINT pk_artist_genre PRIMARY KEY (artist_id, genre_id)
);

CREATE TABLE IF NOT EXISTS Artist_Album (
    artist_id INTEGER REFERENCES Artist(id),
    album_id INTEGER REFERENCES Album(id),
    CONSTRAINT pk_artist_album PRIMARY KEY (artist_id, album_id)
);

CREATE TABLE IF NOT EXISTS Track_Compilation (
    track_id INTEGER REFERENCES Track(id),
    compilation_id INTEGER REFERENCES Compilation(id),
    CONSTRAINT pk_track_compilation PRIMARY KEY (track_id, compilation_id)
);

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
('Rock Anthems', 2016);

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


-- Добавление новых треков проверка запроса № 1.5
INSERT INTO Track (name, duration, album_id) VALUES
('My Sweet Lord', 245, 1),
('My Heart Will Go On', 280, 2),
('My My My', 198, 2),
('My My Hey Hey', 214, 1),
('MyMy Revolution', 225, 3);


INSERT INTO Track_Compilation (track_id, compilation_id) VALUES
(7, 1),  -- My Sweet Lord в Greatest Hits Volume 1
(8, 2),  -- My Heart Will Go On в The Best of Adele
(9, 2),  -- My My My в The Best of Adele
(10, 4), -- My My Hey Hey в Rock Anthems
(11, 4); -- MyMy Revolution в Rock Anthems


INSERT INTO Track (name, duration, album_id) VALUES
('Myself', 195, 1),
('By Myself', 230, 2),
('Bemy Self', 210, 3),
('Myself By', 185, 1),
('By Myself By', 240, 2),
('Beemy', 175, 3),
('Premyne', 205, 1);


INSERT INTO Track_Compilation (track_id, compilation_id) VALUES
(12, 1), -- Myself в Greatest Hits Volume 1
(13, 2), -- By Myself в The Best of Adele
(14, 3), -- Bemy Self в Summer Hits
(15, 4), -- Myself By в Rock Anthems
(16, 1), -- By Myself By в Greatest Hits Volume 1
(17, 2), -- Beemy в The Best of Adele
(18, 3); -- Premyne в Summer Hits



-- Добавление новых треков в сборники проверка запроса №2.2
INSERT INTO Album (name, year) VALUES
    ('Album 2019-1', 2019),
    ('Album 2019-2', 2019),
    ('Album 2020-1', 2020),
    ('Album 2020-2', 2020);


INSERT INTO Track (name, duration, album_id)
VALUES 
    ('Track 2019-1', 180, (SELECT id FROM Album WHERE name = 'Album 2019-1')),
    ('Track 2019-2', 200, (SELECT id FROM Album WHERE name = 'Album 2019-1')),
    ('Track 2019-3', 195, (SELECT id FROM Album WHERE name = 'Album 2019-2')),
    ('Track 2020-1', 210, (SELECT id FROM Album WHERE name = 'Album 2020-1')),
    ('Track 2020-2', 225, (SELECT id FROM Album WHERE name = 'Album 2020-1')),
    ('Track 2020-3', 190, (SELECT id FROM Album WHERE name = 'Album 2020-2'));


INSERT INTO Album (name, year) VALUES
    ('Album 2018', 2018),
    ('Album 2021', 2021);

INSERT INTO Track (name, duration, album_id)
VALUES 
    ('Track 2018', 185, (SELECT id FROM Album WHERE name = 'Album 2018')),
    ('Track 2021', 195, (SELECT id FROM Album WHERE name = 'Album 2021'));

