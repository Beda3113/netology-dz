CREATE TABLE Artist (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE Genre (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE Album (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    release_year INT NOT NULL CHECK (release_year >= 1900 AND release_year <= EXTRACT(YEAR FROM CURRENT_DATE))
);

CREATE TABLE Track (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    duration INTERVAL NOT NULL,
    album_id INT REFERENCES Album(id)
);

CREATE TABLE Compilation (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL
);

CREATE TABLE Artist_Album (
    artist_id INT REFERENCES Artist(id),
    album_id INT REFERENCES Album(id),
    PRIMARY KEY (artist_id, album_id)
);

CREATE TABLE Artist_Genre (
    artist_id INT REFERENCES Artist(id),
    genre_id INT REFERENCES Genre(id),
    PRIMARY KEY (artist_id, genre_id)
);
