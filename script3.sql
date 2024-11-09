CREATE TABLE Artist (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE Genre (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE Album (
    id INT PRIMARY KEY,
    title VARCHAR(255) NOT NULL
);

CREATE TABLE Track (
    id INT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    duration INT NOT NULL,
    album_id INT,
    FOREIGN KEY (album_id) REFERENCES Album(id)
);

CREATE TABLE Artist_Album (
    artist_id INT,
    album_id INT,
    FOREIGN KEY (artist_id) REFERENCES Artist(id),
    FOREIGN KEY (album_id) REFERENCES Album(id),
    PRIMARY KEY (artist_id, album_id)
);

CREATE TABLE Artist_Genre (
    artist_id INT,
    genre_id INT,
    FOREIGN KEY (artist_id) REFERENCES Artist(id),
    FOREIGN KEY (genre_id) REFERENCES Genre(id),
    PRIMARY KEY (artist_id, genre_id)
);

CREATE TABLE Compilation (
    id INT PRIMARY KEY,
    title VARCHAR(255) NOT NULL
);

CREATE TABLE Track_Compilation (
    track_id INT,
    compilation_id INT,
    FOREIGN KEY (track_id) REFERENCES Track(id),
    FOREIGN KEY (compilation_id) REFERENCES Compilation(id),
    PRIMARY KEY (track_id, compilation_id)
);
