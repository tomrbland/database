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

INSERT INTO Forum (name) VALUES ('Test1');
INSERT INTO Forum (name) VALUES ('Test2');
INSERT INTO Forum (name) VALUES ('Test3');

.header on
.mode column

SELECT * FROM Person LIMIT 5;
SELECT * FROM Forum LIMIT 5;
