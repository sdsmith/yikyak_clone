-- YikYak Clone Schema
-- built for Postgres database
DROP TABLE active_api_session_keys CASCADE;
DROP TABLE appuser CASCADE;
DROP TABLE appuser_passwords CASCADE;
DROP TABLE notes CASCADE;
DROP TABLE notes_reports CASCADE;
DROP TABLE notes_votes CASCADE;



CREATE TABLE active_api_session_keys (
	-- Active API session keys representing authenticated api users
	session_key		VARCHAR(25),
	user_id			BIGINT		NOT NULL,
	PRIMARY KEY(session_key)
);

CREATE TABLE appuser_passwords (
	-- User passwords
	user_id 		BIGINT,
	password 		VARCHAR(100) 	NOT NULL,
	PRIMARY KEY (user_id)
);

CREATE TABLE appuser (
	-- User data
	id 			BIGSERIAL,
	admin			BOOLEAN		NOT NULL,
	email 			VARCHAR(50) 	NOT NULL UNIQUE, 
	phone_number		VARCHAR(15)	UNIQUE,
	join_date 		TIMESTAMP 	NOT NULL,
	validated 		BOOLEAN 	NOT NULL,
	last_login 		TIMESTAMP 	NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE notes (
	-- Yak information
	id			BIGSERIAL,
	user_id			BIGINT		NOT NULL,	--Posted by
	time			TIMESTAMP	NOT NULL,	--Time posted
	location_latitude	REAL		NOT NULL,
	location_longitude	REAL		NOT NULL,
	votes			INTEGER		NOT NULL,	--Note 'rating'
	message			TEXT		NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE notes_reports (
	-- User reported notes
	id			BIGSERIAL,
	note_id			BIGINT		NOT NULL,
	reporter_id		BIGINT		NOT NULL,	--is a user_id
	time			TIMESTAMP	NOT NULL,	--Time reported
	reason			TEXT		NOT NULL,	--Report reason
	PRIMARY KEY (id)
);

CREATE TABLE notes_votes (
	-- Tracks users votes on notes
	id			BIGSERIAL,
	note_id			BIGINT		NOT NULL,
	user_id			BIGINT		NOT NULL,
	upvote			BOOLEAN		NOT NULL,	--1 up, 0 down
	PRIMARY KEY (id)
);
