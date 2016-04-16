DROP TABLE IF EXISTS Person;

CREATE TABLE Person (
id INTEGER PRIMARY KEY,
name VARCHAR(100) NOT NULL,
username VARCHAR(10) NOT NULL UNIQUE,
stuId VARCHAR(10) NULL
);

INSERT INTO Person (name, username, stuId) VALUES ('Alex', 'ak15308', '123450');
INSERT INTO Person (name, username, stuId) VALUES ('Joseph', 'jl15351', '123451');
INSERT INTO Person (name, username, stuId) VALUES ('Tom', 'tb15269', '123452');

CREATE TABLE Forum (
   id INTEGER PRIMARY KEY,
   name VARCHAR(250) UNIQUE
);

INSERT INTO Forum (name) VALUES ('Computer Science');
INSERT INTO Forum (name) VALUES ('Politics');
INSERT INTO Forum (name) VALUES ('Literature');

CREATE TABLE Topic (
   id INTEGER PRIMARY KEY,
   forumid INTEGER NOT NULL,
   title VARCHAR(250) NOT NULL,
   CONSTRAINT forumid FOREIGN KEY (forumid) REFERENCES Forum (id)
);

INSERT INTO Topic (forumid, title) VALUES (1, 'Database design');
INSERT INTO Topic (forumid, title) VALUES (1, 'Algorithms');
INSERT INTO Topic (forumid, title) VALUES (2, 'The pros and cons of EU membership');
INSERT INTO Topic (forumid, title) VALUES (2, 'The US elections');
INSERT INTO Topic (forumid, title) VALUES (3, 'What is your favourite book?');
INSERT INTO Topic (forumid, title) VALUES (3, 'The greatest novel of the 20th Century?');

.header on
.mode column

SELECT * FROM Person LIMIT 5;
SELECT * FROM Forum LIMIT 5;
SELECT * FROM Topic LIMIT 6;
