INSERT INTO artist
VALUES (1, '50 cent');
INSERT INTO artist
VALUES (2, '45 cent');
INSERT INTO artist
VALUES (3, '40 cent');
INSERT INTO artist
VALUES (4, '35 cent');
INSERT INTO artist
VALUES (5, '30 cent');
INSERT INTO artist
VALUES (6, '25 cent');
INSERT INTO artist
VALUES (7, '20 cent');
INSERT INTO artist
VALUES (8, 'Сent');

INSERT INTO genre (name_genre)
VALUES ('Rap');
INSERT INTO genre (name_genre)
VALUES ('Rock');
INSERT INTO genre (name_genre)
VALUES ('Jazz');
INSERT INTO genre (name_genre)
VALUES ('Soul');
INSERT INTO genre (name_genre)
VALUES ('Pop');

INSERT INTO genres_artists (genre_id, artist_id)
VALUES (1, 1);
INSERT INTO genres_artists (genre_id, artist_id)
VALUES (2, 2);
INSERT INTO genres_artists (genre_id, artist_id)
VALUES (3, 3);
INSERT INTO genres_artists (genre_id, artist_id)
VALUES (4, 4);
INSERT INTO genres_artists (genre_id, artist_id)
VALUES (5, 5);
INSERT INTO genres_artists (genre_id, artist_id)
VALUES (1, 6);
INSERT INTO genres_artists (genre_id, artist_id)
VALUES (2, 7);
INSERT INTO genres_artists (genre_id, artist_id)
VALUES (3, 8);


INSERT INTO album (name_album, year_album)
VALUES ('Homies go to church', '2018-01-08');
INSERT INTO album (name_album, year_album)
VALUES ('Homies go to shop', '2017-01-08');
INSERT INTO album (name_album, year_album)
VALUES ('Homies go to school', '2002-01-08');
INSERT INTO album (name_album, year_album)
VALUES ('Homies go to barbershop', '2022-01-08');
INSERT INTO album (name_album, year_album)
VALUES ('Homies go to gym', '2018-01-08');
INSERT INTO album (name_album, year_album)
VALUES ('Homies go to disco', '2018-01-08');
INSERT INTO album (name_album, year_album)
VALUES ('Homies go to prison', '2019-01-08');
INSERT INTO album (name_album, year_album)
VALUES ('Homies go to bank', '2000-01-08');


ALTER TABLE track ALTER COLUMN duration TYPE numeric;


INSERT INTO track (name_track, duration, album_id)
VALUES ('My dog', 3.30, 1);
INSERT INTO track (name_track, duration, album_id)
VALUES ('My cat', 2.30, 2)
INSERT INTO track (name_track, duration, album_id)
VALUES ('My lemon', 4.55, 3)
INSERT INTO track (name_track, duration, album_id)
VALUES ('My buddy', 1.10, 4)
INSERT INTO track (name_track, duration, album_id)
VALUES ('My mom', 5.11, 5)
INSERT INTO track (name_track, duration, album_id)
VALUES ('Gimmy your hat', 2.22, 6)
INSERT INTO track (name_track, duration, album_id)
VALUES ('Gimmy your house', 3.45, 7)
INSERT INTO track (name_track, duration, album_id)
VALUES ('Gimmy your money', 2.55, 8)
INSERT INTO track (name_track, duration, album_id)
VALUES ('Gimmy your gun', 21.10, 1)
INSERT INTO track (name_track, duration, album_id)
VALUES ('Gimmy your girl', 2.15, 2)
INSERT INTO track (name_track, duration, album_id)
VALUES ('Gimmy your bike', 1.45, 3)
INSERT INTO track (name_track, duration, album_id)
VALUES ('Gimmy your moto', 2.33, 4)
INSERT INTO track (name_track, duration, album_id)
VALUES ('Intro', 0.30, 5)
INSERT INTO track (name_track, duration, album_id)
VALUES ('Outro', 0.15, 6)
INSERT INTO track (name_track, duration, album_id)
VALUES ('My name is', 3.15, 7)


INSERT INTO albums_artists (album_id, artist_id)
VALUES (1, 1);
INSERT INTO albums_artists (album_id, artist_id)
VALUES (2, 2);
INSERT INTO albums_artists (album_id, artist_id)
VALUES (3, 3);
INSERT INTO albums_artists (album_id, artist_id)
VALUES (4, 4);
INSERT INTO albums_artists (album_id, artist_id)
VALUES (5, 5);
INSERT INTO albums_artists (album_id, artist_id)
VALUES (6, 6);
INSERT INTO albums_artists (album_id, artist_id)
VALUES (7, 7);
INSERT INTO albums_artists (album_id, artist_id)
VALUES (8, 8);

INSERT INTO mixtape (name_mixtape, year_mixtape)
VALUES ('My First Mixtape', '2019-02-08' );
INSERT INTO mixtape (name_mixtape, year_mixtape)
VALUES ('My Second Mixtape', '2020-02-08' );
INSERT INTO mixtape (name_mixtape, year_mixtape)
VALUES ('My Third Mixtape', '2021-02-08' );
INSERT INTO mixtape (name_mixtape, year_mixtape)
VALUES ('My Forth Mixtape', '2022-02-08' );
INSERT INTO mixtape (name_mixtape, year_mixtape)
VALUES ('My Fifth Mixtape', '2019-03-08' );
INSERT INTO mixtape (name_mixtape, year_mixtape)
VALUES ('My Sixth Mixtape', '2020-04-08' );
INSERT INTO mixtape (name_mixtape, year_mixtape)
VALUES ('My Seventh Mixtape', '2021-05-08' );
INSERT INTO mixtape (name_mixtape, year_mixtape)
VALUES ('My Eighth Mixtape', '2022-06-08' );


INSERT INTO tracks_mixtapes (track_id, mixtape_id)
VALUES (1, 1);
INSERT INTO tracks_mixtapes (track_id, mixtape_id)
VALUES (1, 2);
INSERT INTO tracks_mixtapes (track_id, mixtape_id)
VALUES (1, 3);
INSERT INTO tracks_mixtapes (track_id, mixtape_id)
VALUES (1, 4);
INSERT INTO tracks_mixtapes (track_id, mixtape_id)
VALUES (1, 5);
INSERT INTO tracks_mixtapes (track_id, mixtape_id)
VALUES (1, 6);
INSERT INTO tracks_mixtapes (track_id, mixtape_id)
VALUES (1, 7);
INSERT INTO tracks_mixtapes (track_id, mixtape_id)
VALUES (1, 8);


--SELECT--

SELECT name_album, year_album FROM album
WHERE year_album >= '2018-01-01';

SELECT name_track, duration FROM track
WHERE duration >= (SELECT MAX(duration) from track);

SELECT name_track FROM track
WHERE duration >= 3.30;

SELECT name_mixtape, year_mixtape FROM mixtape
WHERE year_mixtape BETWEEN '2018-01-01' AND '2020-12-31';

SELECT name_artist FROM artist
WHERE name_artist NOT LIKE '% %';

SELECT name_track FROM track
WHERE LOWER(name_track) SIMILAR TO '(my %|% my %)';



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

SELECT name_artist from artist a
JOIN albums_artists aa ON a.id = aa.artist_id
JOIN album al ON aa.album_id = al.id
WHERE name_artist NOT IN (SELECT name_artist from artist WHERE year_album BETWEEN '2020-01-01' AND '2020-12-31');


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

SELECT COUNT(name_track) from album a 
JOIN track t ON a.id = t.album_id
GROUP BY name_album
ORDER BY COUNT(name_track)
LIMIT 1;


-- Доработки -- 
-- Запрос 4 --

SELECT name_artist from artist a
JOIN albums_artists aa ON a.id = aa.artist_id
JOIN album al ON aa.album_id = al.id
WHERE name_artist NOT IN (SELECT name_artist from artist WHERE year_album BETWEEN '2020-01-01' AND '2020-12-31');

-- Запрос 9 --

SELECT name_album from album a 
JOIN track t ON a.id = t.album_id
GROUP BY name_album
HAVING COUNT(name_track) = (

SELECT COUNT(name_track) from album a 
JOIN track t ON a.id = t.album_id 
GROUP BY name_album 
ORDER BY COUNT(name_track) 
LIMIT 1

);
















