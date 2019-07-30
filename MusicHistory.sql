-- Query all of the entries in the Genre table
SELECT * FROM Genre;

-- Using the INSERT statement, add one of your favorite artists to the Artist table.
SELECT * FROM Artist
INSERT INTO Artist (ArtistName, YearEstablished)
VALUES ('Emily Loggins', 1969);

-- Using the INSERT statement, add one, or more, albums by your artist to the Album table.
SELECT * FROM Album
INSERT INTO Album (Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId)
VALUES ('Praise to the Kraken', '07/29/2019', 7654, 'Kraken Inc', 28, 10);

-- Using the INSERT statement, add some songs that are on that album to the Song table.
SELECT * FROM Song
INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId)
VALUES ('Drown Me', 765, '06/29/2019', 10, 28, 23);

INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId)
VALUES ('Crisp Seawater', 465, '06/13/2019', 10, 28, 23);

-- Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in. 
-- Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added.
SELECT alb.Title AS AlbumTitle, s.Title AS SongTitle, art.ArtistName
FROM Album alb 
LEFT JOIN Song s ON s.AlbumId = alb.Id
LEFT JOIN Artist art ON art.Id = alb.ArtistId
WHERE alb.Title = 'Praise to the Kraken';

-- Write a SELECT statement to display how many songs exist for each album. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT COUNT(s.Title) AS NumberOfSongs, a.Title AS AlbumName 
FROM Album a
LEFT JOIN Song s ON s.AlbumId = a.id
GROUP BY a.Title

-- Write a SELECT statement to display how many songs exist for each artist. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT COUNT(s.Title) AS NumberOfSongs, a.ArtistName AS ArtistName 
FROM Artist a
LEFT JOIN Song s ON s.ArtistId = a.id
GROUP BY a.ArtistName

-- Write a SELECT statement to display how many songs exist for each genre. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT COUNT(s.Title) AS NumberOfSongs, g.Label AS GenreName 
FROM Artist a
LEFT JOIN Song s ON s.ArtistId = a.id
JOIN Genre g ON g.Id = s.GenreId
GROUP BY g.Label

-- Using MAX() function, write a select statement to find the album with the longest duration. The result should display the album title and the duration.
SELECT a.AlbumLength, a.Title
FROM Album a
WHERE 
    a.AlbumLength = (SELECT Max(AlbumLength) FROM Album);

-- Using MAX() function, write a select statement to find the song with the longest duration. The result should display the song title and the duration.
SELECT s.SongLength, s.Title
FROM Song s
WHERE s.SongLength = (SELECT Max(SongLength) FROM Song);

-- Modify the previous query to also display the title of the album.
SELECT s.SongLength AS SongLength, s.Title, a.Title
FROM Song s
JOIN Album a
    ON a.Id = s.AlbumId
WHERE s.SongLength = (SELECT Max(SongLength) FROM Song);