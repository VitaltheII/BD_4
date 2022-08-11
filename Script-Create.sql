create table if not exists artist (
	id SERIAL primary key,
	name_artist VARCHAR(60)
);

create table if not exists genre (
	id SERIAL primary key,
	name_genre VARCHAR(60)
);

create table if not exists genres_artists (
	id SERIAL primary key,
	genre_id INTEGER references genre(id),
	artist_id INTEGER references artist(id)
);

create table if not exists album (
	id SERIAL primary key,
	name_album VARCHAR(60),
	year_album date
);

create table if not exists albums_artists (
	id SERIAL primary key,
	album_id INTEGER references album(id),
	artist_id INTEGER references artist(id)
);

create table if not exists track (
	id SERIAL primary key,
	name_track VARCHAR(60),
	duration integer,
	album_id INTEGER references album(id)
);

create table if not exists mixtape (
	id SERIAL primary key,
	name_mixtape VARCHAR(60),
	year_mixtape date
);

create table if not exists tracks_mixtapes (
	id SERIAL primary key,
	track_id INTEGER references track(id),
	mixtape_id INTEGER references mixtape(id)
);

------

create table if not exists department (
	id SERIAL primary key,
	name_dep VARCHAR(60)
);

create table if not exists superior (
	id SERIAL primary key,
	name_superior VARCHAR(60)
);

create table if not exists employee (
	id SERIAL primary key,
	name_employee VARCHAR(60),
	department_id INTEGER references department(id),
	superior_id INTEGER references superior(id)
);














