CREATE TABLE Genre (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE Artist (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE Album (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    year INT NOT NULL
);

CREATE TABLE Track (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    duration INT NOT NULL,
    album_id INT REFERENCES Album(id)
);

CREATE TABLE Compilation (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    year INT NOT NULL
);

CREATE TABLE Artist_Genre (
    artist_id INT REFERENCES Artist(id),
    genre_id INT REFERENCES Genre(id),
    PRIMARY KEY (artist_id, genre_id)
);

CREATE TABLE Artist_Album (
    artist_id INT REFERENCES Artist(id),
    album_id INT REFERENCES Album(id),
    PRIMARY KEY (artist_id, album_id)
);

CREATE TABLE Track_Compilation (
    track_id INT REFERENCES Track(id),
    compilation_id INT REFERENCES Compilation(id),
    PRIMARY KEY (track_id, compilation_id)
);
