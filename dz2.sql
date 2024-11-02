-- Таблица жанров
CREATE TABLE IF NOT EXISTS Genre (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- Таблица исполнителей
CREATE TABLE IF NOT EXISTS Artist (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- Таблица альбомов
CREATE TABLE IF NOT EXISTS Album (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    release_year INT NOT NULL
);

-- Таблица треков
CREATE TABLE IF NOT EXISTS Track (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    duration INTERVAL NOT NULL,
    album_id INT REFERENCES Album(id) ON DELETE CASCADE
);

-- Таблица сборников
CREATE TABLE IF NOT EXISTS Compilation (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    release_year INT NOT NULL
);

-- Таблица для связи между исполнителями и жанрами (многие ко многим)
CREATE TABLE IF NOT EXISTS Artist_Genre (
    artist_id INT REFERENCES Artist(id) ON DELETE CASCADE,
    genre_id INT REFERENCES Genre(id) ON DELETE CASCADE,
    PRIMARY KEY (artist_id, genre_id)
);

-- Таблица для связи между исполнителями и альбомами (многие ко многим)
CREATE TABLE IF NOT EXISTS Artist_Album (
    artist_id INT REFERENCES Artist(id) ON DELETE CASCADE,
    album_id INT REFERENCES Album(id) ON DELETE CASCADE,
    PRIMARY KEY (artist_id, album_id)
);

-- Таблица для связи между треками и сборниками (многие ко многим)
CREATE TABLE IF NOT EXISTS Track_Compilation (
    track_id INT REFERENCES Track(id) ON DELETE CASCADE,
    compilation_id INT REFERENCES Compilation(id) ON DELETE CASCADE,
    PRIMARY KEY (track_id, compilation_id)
);
