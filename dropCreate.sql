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
INSERT INTO Forum (title) VALUES ('Procrastination'); -- Left outer join test

CREATE TABLE Topic (
   id INTEGER PRIMARY KEY,
   forumid INTEGER NOT NULL,
   title VARCHAR(250) NOT NULL,
   CONSTRAINT forumid_fk FOREIGN KEY (forumid) REFERENCES Forum (id)
);

INSERT INTO Topic (forumid, title) VALUES (1, 'Database design'); -- Computer Science forum
INSERT INTO Topic (forumid, title) VALUES (1, 'Algorithms'); -- Computer Science forum
INSERT INTO Topic (forumid, title) VALUES (2, 'The EU'); -- Politics forum
INSERT INTO Topic (forumid, title) VALUES (2, 'The US elections'); -- Politics forum
INSERT INTO Topic (forumid, title) VALUES (3, 'What is your favourite book?'); -- Literature forum
INSERT INTO Topic (forumid, title) VALUES (3, 'The greatest novel of the 20th Century?'); -- Literature forum
INSERT INTO Topic (forumid, title) VALUES (2, 'THE EUSSR'); -- Left outer join test

CREATE TABLE Topic_Likers (
   topicid INTEGER NOT NULL,
   personid INTEGER NOT NULL,
   PRIMARY KEY(topicid, personid),
   CONSTRAINT topic_fk FOREIGN KEY (topicid) REFERENCES Topic (id),
   CONSTRAINT person_fk FOREIGN KEY(personid) REFERENCES Person (id)
);

INSERT INTO Topic_Likers (topicid, personid) VALUES (1, 1); -- Alex likes Topic 1 - Database design
INSERT INTO Topic_Likers (topicid, personid) VALUES (2, 1); -- Alex likes Topic 2 - The EU
INSERT INTO Topic_Likers (topicid, personid) VALUES (3, 2); -- Joseph likes Topic 3 - The EU
INSERT INTO Topic_Likers (topicid, personid) VALUES (4, 2); -- Joseph likes Topic 4 - The US elections
INSERT INTO Topic_Likers (topicid, personid) VALUES (5, 3); -- Tom likes Topic 5 - What is your favourite book?
INSERT INTO Topic_Likers (topicid, personid) VALUES (6, 3); -- Tom likes Topic 6 - The greatest novel of the 20th Century?


CREATE TABLE Post (
   id INTEGER PRIMARY KEY,
   authorid INTEGER NOT NULL,
   topicid INTEGER NOT NULL,
   text TEXT NOT NULL,
   postedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   CONSTRAINT authorid_fk FOREIGN KEY (authorid) REFERENCES Person (id),
   CONSTRAINT topicid_fk FOREIGN KEY (topicid) REFERENCES Topic (id)
);

INSERT INTO Post (authorid, topicid, text) VALUES (2, 2, 'Quicksort is amazing!'); -- Joseph has written a post about algorithms
INSERT INTO Post (authorid, topicid, text) VALUES (1, 1, '1st NF is...'); -- Alex has written a post about DBs
INSERT INTO Post (authorid, topicid, text) VALUES (1, 1, '2nd NF is...'); -- Alex has written a post about DBs
INSERT INTO Post (authorid, topicid, text) VALUES (1, 1, '3rd NF is...'); -- Alex has written a post about DBs
INSERT INTO Post (authorid, topicid, text) VALUES (3, 3, 'Pros and cons of staying in the EU?'); -- Tom has written a post about the EU
INSERT INTO Post (authorid, topicid, text) VALUES (3, 4, 'Do people think Clinton will win?'); -- Tom has written a post about the US elections
INSERT INTO Post (authorid, topicid, text) VALUES (1, 5, 'Using SQLite by Jay A. Kreibich?'); -- Alex has written a post about favourite books
INSERT INTO Post (authorid, topicid, text) VALUES (1, 6, 'Blood Meridian by Cormac McCarthy'); -- Alex has written a post about favourite books
INSERT INTO Post (authorid, topicid, text) VALUES (1, 1, 'CWK3 answers?'); /* Alex has written a post about DBs */
INSERT INTO Post (authorid, topicid, text) VALUES (1, 2, 'Need help with time complexity analysis.'); -- Alex has written a post about Algorithms

CREATE TABLE Post_Likers (
   postid INTEGER NOT NULL,
   personid INTEGER NOT NULL,
   PRIMARY KEY(postid, personid),
   CONSTRAINT post_fk FOREIGN KEY (postid) REFERENCES Post (id),
   CONSTRAINT person_fk FOREIGN KEY(personid) REFERENCES Person (id)
);

INSERT INTO Post_Likers (postid, personid) VALUES (1, 1); -- Alex likes Post 1 - 1st NF...
INSERT INTO Post_Likers (postid, personid) VALUES (1, 3); -- Alex likes Post 1 - 3rd NF..
INSERT INTO Post_Likers (postid, personid) VALUES (2, 2); -- Joseph likes Post 2 - 2nd NF...
INSERT INTO Post_Likers (postid, personid) VALUES (2, 6); -- Joseph likes Post 6 - Will Clinton win?
INSERT INTO Post_Likers (postid, personid) VALUES (3, 3); -- Tom likes Post 3 - 3rd NF...
INSERT INTO Post_Likers (postid, personid) VALUES (3, 6); -- Tom likes Post 6 - Will Clinton win?


SELECT * FROM Person LIMIT 6;
SELECT * FROM Forum LIMIT 6;
SELECT * FROM Topic LIMIT 6;
SELECT * FROM Topic_Likers LIMIT 6;
SELECT * FROM Post;
SELECT * FROM Post_Likers LIMIT 6;
