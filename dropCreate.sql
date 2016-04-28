DROP TABLE IF EXISTS Person;
DROP TABLE IF EXISTS Forum;
DROP TABLE IF EXISTS Topic;
DROP TABLE IF EXISTS Post;

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
   CONSTRAINT forumid_fk FOREIGN KEY (forumid) REFERENCES Forum (id)
);

INSERT INTO Topic (forumid, title) VALUES (1, 'Database design');
INSERT INTO Topic (forumid, title) VALUES (1, 'Algorithms');
INSERT INTO Topic (forumid, title) VALUES (2, 'The EU');
INSERT INTO Topic (forumid, title) VALUES (2, 'The US elections');
INSERT INTO Topic (forumid, title) VALUES (3, 'What is your favourite book?');
INSERT INTO Topic (forumid, title) VALUES (3, 'The greatest novel of the 20th Century?');

CREATE TABLE Topic_Likers (
   topicid INTEGER NOT NULL,
   personid INTEGER NOT NULL,
   PRIMARY KEY(topicid, personid),
   CONSTRAINT topic_fk FOREIGN KEY (topicid) REFERENCES Topic (id),
   CONSTRAINT person_fk FOREIGN KEY(personid) REFERENCES Person (id)
);

CREATE TABLE Post (
   id INTEGER PRIMARY KEY,
   authorid INTEGER NOT NULL,
   topicid INTEGER NOT NULL,
   text TEXT,
   date INTEGER NOT NULL,
   CONSTRAINT topic_fk FOREIGN KEY (topicid) REFERENCES Topic (id),
   CONSTRAINT author_fk FOREIGN KEY (authorid) REFERENCES Person (id)
);

INSERT INTO Post (authorid, topicid, text, date) VALUES (1, 1, '1st NF is...', 124510);
INSERT INTO Post (authorid, topicid, text, date) VALUES (1, 1, '2nd NF is...', 125412);

.header on
.mode column

SELECT * FROM Person LIMIT 6;
SELECT * FROM Forum LIMIT 6;
SELECT * FROM Topic LIMIT 6;
SELECT * FROM Post LIMIT 6;
