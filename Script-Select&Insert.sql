--SELECT AGR--

SELECT name_genre, COUNT(artist_id) from genre g
LEFT JOIN genres_artists ga ON g.id = ga.genre_id
GROUP BY g.name_genre;

SELECT COUNT(t.id) from album a
JOIN track t ON a.id = t.album_id
WHERE year_album BETWEEN '2019-01-01' AND '2020-12-31';

SELECT name_album, AVG(duration) from album a
JOIN track t ON a.id = t.album_id
GROUP BY name_album;

SELECT name_artist from artist a
JOIN albums_artists aa ON a.id = aa.artist_id
JOIN album al ON aa.album_id = al.id
WHERE year_album NOT BETWEEN '2020-01-01' AND '2020-12-31';


-- INSERT NEW MIXTAPES --

INSERT INTO mixtape (name_mixtape, year_mixtape)
VALUES 
	('25 cent diary,', '2020-02-02'),
	('45 cent mission', '2018-04-08');

UPDATE mixtape 
SET name_mixtape = '25 Cent Diary'
WHERE id = 9;

UPDATE mixtape 
SET name_mixtape = '45 Cent Mission'
WHERE id = 10;

INSERT INTO tracks_mixtapes (track_id, mixtape_id)
VALUES 
	(1, 9),
	(1, 10);


-- SELECT AGR (continue) --

SELECT name_mixtape, name_artist from mixtape m 
JOIN tracks_mixtapes tm ON m.id = tm.mixtape_id 
JOIN track t ON tm.track_id = t.id 
JOIN album a ON t.album_id = a.id 
JOIN albums_artists aa ON a.id = aa.artist_id 
JOIN artist ar ON aa.artist_id = ar.id
WHERE name_artist = '50 cent';


-- INSERT NEW GENRES_ARTISTS --
INSERT INTO genres_artists (genre_id, artist_id)
VALUES 
	(2, 1),
	(3, 1);

-- SELECT AGR (continue) --

SELECT name_album from album a 
JOIN albums_artists aa ON a.id = aa.album_id 
JOIN artist ar ON aa.artist_id = ar.id 
JOIN genres_artists ga ON ar.id = ga.artist_id
GROUP BY name_album
HAVING COUNT (genre_id) > 1;

SELECT name_track from track t 
LEFT JOIN tracks_mixtapes tm ON t.id = tm.track_id 
GROUP BY name_track
HAVING COUNT (mixtape_id) = 0;

SELECT name_artist from artist a 
JOIN albums_artists aa ON a.id = aa.artist_id 
JOIN album al ON aa.album_id = al.id 
JOIN track t ON al.id = t.album_id
WHERE duration = (SELECT MAX (duration) from track);

-- Не могу понять, как вывести максимальные и минимальные значения агрегатных функций, например ТОЛЬКО альбомы с мин кол треков--

SELECT name_album, COUNT(name_track) from album a 
JOIN track t ON a.id = t.album_id
GROUP BY name_album
ORDER BY COUNT(name_track);