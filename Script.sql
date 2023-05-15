CREATE TABLE IF NOT EXISTS Genre (
	id SERIAL PRIMARY KEY,
	name varchar(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS Executor (
	id SERIAL PRIMARY KEY,
	name varchar(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS ExecutorGenre (
	executor_id INTEGER REFERENCES Executor(id),
	genre_id INTEGER REFERENCES Genre(id),
	CONSTRAINT eg PRIMARY KEY (executor_id, genre_id)
);

CREATE TABLE IF NOT EXISTS Album(
	id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	year INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS AlbumExecutor (
	album_id INTEGER REFERENCEs Album(id),
	executor_id INTEGER REFERENCES Executor(id),
	CONSTRAINT ae PRIMARY KEY (album_id, executor_id)
);

CREATE TABLE IF NOT EXISTS Track (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	duration INTEGER NOT NULL,
	album_id INTEGER NOT NULL REFERENCES Album(id)
);

CREATE TABLE IF NOT EXISTS Collection (
	id SERIAL PRIMARY KEY,
	name varchar(100) NOT NULL
);


CREATE TABLE IF NOT EXISTS CollectionTrack (
	collection_id INTEGER REFERENCES Collection(id),
	track_id INTEGER REFERENCES Track(id),
	CONSTRAINT ct PRIMARY KEY (collection_id, track_id)
);


