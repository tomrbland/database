DROP TABLE IF EXISTS Person;
DROP TABLE IF EXISTS Forum;
DROP TABLE IF EXISTS Topic;
DROP TABLE IF EXISTS Topic_Likers;
DROP TABLE IF EXISTS Post;
DROP TABLE IF EXISTS Post_Likers;

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
   title VARCHAR(250) UNIQUE
);

INSERT INTO Forum (title) VALUES ('Computer Science');
INSERT INTO Forum (title) VALUES ('Politics');
INSERT INTO Forum (title) VALUES ('Literature');

CREATE TABLE Topic (
   id INTEGER PRIMARY KEY,
   forumid INTEGER NOT NULL,
   title VARCHAR(250) NOT NULL,
   CONSTRAINT forumid_fk FOREIGN KEY (forumid) REFERENCES Forum (id)
);

INSERT INTO Topic (forumid, title) VALUES (1, 'Database design'); /* Computer Science forum */
INSERT INTO Topic (forumid, title) VALUES (1, 'Algorithms'); /* Computer Science forum */
INSERT INTO Topic (forumid, title) VALUES (2, 'The EU'); /* Politics forum */
INSERT INTO Topic (forumid, title) VALUES (2, 'The US elections'); /* Politics forum */
INSERT INTO Topic (forumid, title) VALUES (3, 'What is your favourite book?'); /* Literature forum */
INSERT INTO Topic (forumid, title) VALUES (3, 'The greatest novel of the 20th Century?'); /* Literature forum */

CREATE TABLE Topic_Likers (
   topicid INTEGER NOT NULL,
   personid INTEGER NOT NULL,
   PRIMARY KEY(topicid, personid),
   CONSTRAINT topic_fk FOREIGN KEY (topicid) REFERENCES Topic (id),
   CONSTRAINT person_fk FOREIGN KEY(personid) REFERENCES Person (id)
);

INSERT INTO Topic_Likers (topicid, personid) VALUES (1, 1); /* Alex likes Topic 1 - Database design */
INSERT INTO Topic_Likers (topicid, personid) VALUES (1, 2); /* Alex likes Topic 2 - The EU */
INSERT INTO Topic_Likers (topicid, personid) VALUES (2, 3); /* Joseph likes Topic 3 - The EU */
INSERT INTO Topic_Likers (topicid, personid) VALUES (2, 4); /* Joseph likes Topic 4 - The US elections */
INSERT INTO Topic_Likers (topicid, personid) VALUES (3, 5); /* Tom likes Topic 5 - What is your favourite book? */
INSERT INTO Topic_Likers (topicid, personid) VALUES (3, 6); /* Tom likes Topic 6 - The greatest novel of the 20th Century? */


CREATE TABLE Post (
   id INTEGER PRIMARY KEY,
   authorid INTEGER NOT NULL,
   topicid INTEGER NOT NULL,
   text TEXT,
   date INTEGER NOT NULL,
   CONSTRAINT topic_fk FOREIGN KEY (topicid) REFERENCES Topic (id),
   CONSTRAINT author_fk FOREIGN KEY (authorid) REFERENCES Person (id)
);

INSERT INTO Post (authorid, topicid, text, date) VALUES (2, 2, 'Quicksort is amazing!', 100000); /* Joseph has written a post about algorithms */
INSERT INTO Post (authorid, topicid, text, date) VALUES (1, 1, '1st NF is...', 100001); /* Alex has written a post about DBs */
INSERT INTO Post (authorid, topicid, text, date) VALUES (1, 1, '2nd NF is...', 100002); /* Alex has written a post about DBs */
INSERT INTO Post (authorid, topicid, text, date) VALUES (1, 1, '3rd NF is...', 100003); /* Alex has written a post about DBs */
INSERT INTO Post (authorid, topicid, text, date) VALUES (3, 3, 'Pros and cons of staying in the EU?', 100005); /* Tom has written a post about the EU */
INSERT INTO Post (authorid, topicid, text, date) VALUES (3, 4, 'Do people think Clinton will win?', 100004); /* Tom has written a post about the US elections */
INSERT INTO Post (authorid, topicid, text, date) VALUES (1, 5, 'Using SQLite by Jay A. Kreibich?', 100006); /* Alex has written a post about favourite books */
INSERT INTO Post (authorid, topicid, text, date) VALUES (1, 6, 'Blood Meridian by Cormac McCarthy', 100007); /* Alex has written a post about favourite books */
INSERT INTO Post (authorid, topicid, text, date) VALUES (1, 1, 'CWK3 answers?', 100008); /* Alex has written a post about DBs */


CREATE TABLE Post_Likers (
   postid INTEGER NOT NULL,
   personid INTEGER NOT NULL,
   PRIMARY KEY(postid, personid),
   CONSTRAINT post_fk FOREIGN KEY (postid) REFERENCES Post (id),
   CONSTRAINT person_fk FOREIGN KEY(personid) REFERENCES Person (id)
);

INSERT INTO Post_Likers (postid, personid) VALUES (1, 1); /* Alex likes Post 1 - 1st NF... */
INSERT INTO Post_Likers (postid, personid) VALUES (2, 2); /* Joseph likes Post 2 - 2nd NF... */
INSERT INTO Post_Likers (postid, personid) VALUES (3, 3); /* Tom likes Post 3 - 3rd NF... */

.header on
.mode column

SELECT * FROM Person LIMIT 6;
SELECT * FROM Forum LIMIT 6;
SELECT * FROM Topic LIMIT 6;
SELECT * FROM Topic_Likers LIMIT 6;
SELECT * FROM Post/* LIMIT 8 */;
SELECT * FROM Post_Likers LIMIT 6;
