CREATE TABLE accounts(
	"id" SERIAL PRIMARY KEY,
	username VARCHAR(30) NOT NULL UNIQUE,
	"password" VARCHAR(30) NOT NULL,
	email VARCHAR(50) NOT NULL,
	gender CHAR(1) NOT NULL CHECK (gender IN ('M', 'F')),
	age INTEGER NOT NULL,
	job_title VARCHAR(40) NOT NULL,
	ip VARCHAR(30) NOT NULL
);

CREATE TABLE addresses(
	id SERIAL PRIMARY KEY,
	street VARCHAR(30) NOT NULL,
	town VARCHAR(30) NOT NULL,
	country VARCHAR(30) NOT NULL,
	account_id INTEGER NOT NULL,
	CONSTRAINT fk_account_id_accounts
	FOREIGN KEY (account_id)
	REFERENCES accounts(id)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

CREATE TABLE photos(
	"id" SERIAL PRIMARY KEY,
	description TEXT,
	capture_date TIMESTAMP NOT NULL,
	"views" INTEGER DEFAULT 0 NOT NULL,
	CONSTRAINT ck_views
		CHECK (views >= 0)
);

CREATE TABLE comments(
	"id" SERIAL PRIMARY KEY,
	"content" VARCHAR(255) NOT NULL,
	published_on TIMESTAMP NOT NULL,
	photo_id INTEGER NOT NULL,
	CONSTRAINT fk_photo_id_photos
	FOREIGN KEY(photo_id)
	REFERENCES photos(id)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);


CREATE TABLE accounts_photos(
	account_id INTEGER NOT NULL,
	photo_id INTEGER NOT NULL,
	PRIMARY KEY(account_id, photo_id),
	FOREIGN KEY (account_id)
	REFERENCES accounts(id)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	
	FOREIGN KEY (photo_id)
	REFERENCES photos(id)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);


CREATE TABLE likes(
	"id" SERIAL PRIMARY KEY,
	photo_id INTEGER NOT NULL,
	account_id INTEGER NOT NULL,
	CONSTRAINT fk_photo_id_photos
	FOREIGN KEY (photo_id)
	REFERENCES photos(id)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	CONSTRAINT fk_account_id_accounts
	FOREIGN KEY (account_id)
	REFERENCES accounts(id)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);
