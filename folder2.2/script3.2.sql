WITH ArtistGenreCount AS (
    SELECT 
        aa.album_id,
        aa.artist_id,
        COUNT(DISTINCT ag.genre_id) AS genre_count
    FROM 
        Artist_Album aa
    JOIN 
        Artist_Genre ag ON aa.artist_id = ag.artist_id
    GROUP BY 
        aa.album_id, aa.artist_id
)

SELECT 
    a.title AS album_title
FROM 
    Album a
JOIN 
    ArtistGenreCount agc ON a.id = agc.album_id
GROUP BY 
    a.id, a.title
HAVING 
    COUNT(DISTINCT agc.genre_count) > 1;
