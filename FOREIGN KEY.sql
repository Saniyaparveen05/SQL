CREATE DATABASE college;

USE college;

CREATE TABLE course(
cid INT PRIMARY KEY AUTO_INCREMENT,
cname VARCHAR (20) NOT NULL,
cfee DECIMAL (8,2) DEFAULT 0.0
);

CREATE TABLE student (
sid INT PRIMARY KEY AUTO_INCREMENT,
sname VARCHAR (30) NOT NULL,
sadd VARCHAR (30) NOT NULL,
cid INT NOT NULL,
FOREIGN KEY (cid) REFERENCES course (cid) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO course VALUE 
(301,"Data science",67000);

INSERT INTO student VALUES 
(101,"mohan", "noida", 301); 

DELETE FROM course WHERE cid = 301   # you need to delete the "mohan"

UPDATE course SET cid = 305 WHERE cid = 301;

# IF YOU WANT TO DELETE ALL DATA FROM A TABLE WITHOUT CHANGING ITS STRUCTURE 
TRUNCATE student;
SELECT * FROM student;

DROP TABLE student;
DROP TABLE course;

CREATE TABLE course(
cid INT PRIMARY KEY AUTO_INCREMENT,
cname VARCHAR (20) NOT NULL,
cfee DECIMAL (8,2) DEFAULT 0.0
);

CREATE TABLE student (
sid INT PRIMARY KEY AUTO_INCREMENT,
sname VARCHAR (30) NOT NULL,
sadd VARCHAR (30) NOT NULL,
cid INT NOT NULL,
FOREIGN KEY (cid) REFERENCES course (cid) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO course VALUE 
(301,"Data Analytics",67000);
INSERT INTO student VALUES 
(101,"mohan", "noida", 301); 

SELECT * FROM course;
SELECT * FROM student;

UPDATE course SET cid=305 WHERE cid=301;
DELETE FROM course WHERE cid = 305; # ye course ke sath sath student ko bhi delete kr deta h isliye on update cascade tk hi use krna chahiye.
