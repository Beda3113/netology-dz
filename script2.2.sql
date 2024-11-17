-- Создание таблицы исполнителей
CREATE TABLE исполнители (
    id SERIAL PRIMARY KEY,
    имя VARCHAR(100) NOT NULL
);

-- Создание таблицы жанров
CREATE TABLE жанры (
    id SERIAL PRIMARY KEY,
    название VARCHAR(100) NOT NULL
);

-- Создание таблицы альбомов
CREATE TABLE альбомы (
    id SERIAL PRIMARY KEY,
    название VARCHAR(100) NOT NULL,
    год_выпуска INT NOT NULL CHECK (год_выпуска > 1900)
);

-- Создание таблицы треков с продолжительностью в секундах
CREATE TABLE треки (
    id SERIAL PRIMARY KEY,
    название VARCHAR(100) NOT NULL,
    продолжительность INT NOT NULL, -- продолжительность в секундах
    альбом_id INT REFERENCES альбомы(id)
);

-- Создание таблицы сборников
CREATE TABLE сборники (
    id SERIAL PRIMARY KEY,
    название VARCHAR(100) NOT NULL,
    год_выпуска INT NOT NULL CHECK (год_выпуска > 1900)
);

-- Таблица для связи исполнителей с жанрами
CREATE TABLE исполнитель_жанр (
    исполнитель_id INT REFERENCES исполнители(id),
    жанр_id INT REFERENCES жанры(id),
    PRIMARY KEY (исполнитель_id, жанр_id)
);

-- Таблица для связи исполнителей с альбомами
CREATE TABLE исполнитель_альбом (
    исполнитель_id INT REFERENCES исполнители(id),
    альбом_id INT REFERENCES альбомы(id),
    PRIMARY KEY (исполнитель_id, альбом_id)
);

-- Таблица для связи сборников с треками
CREATE TABLE сборник_трек (
    сборник_id INT REFERENCES сборники(id),
    трек_id INT REFERENCES треки(id),
    PRIMARY KEY (сборник_id, трек_id)
);
