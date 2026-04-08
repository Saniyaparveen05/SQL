CREATE DATABASE college;

USE college;

CREATE TABLE student (
sid INT PRIMARY KEY AUTO_INCREMENT,
sname VARCHAR(40) NOT NULL,
semail VARCHAR(50) UNIQUE NOT NULL,
Sage INT NOT NULL CHECK (sage>17),
sgender VARCHAR(10) DEFAULT 'male',
sfee DECIMAL (8,2) DEFAULT 0.0
);

INSERT INTO student(sname,semail,Sage) 
VALUE('RAHUL','RAHUL123@GMAIL.COM','23');

SELECT * FROM student;

INSERT INTO student(sid,sname,semail,Sage) 
VALUE(105,'RAMAN','RAMAN123@GMAIL.COM','27');  # now my cursor in 105 in sid and it will continue from 105

INSERT INTO student(sname,semail,Sage) 
VALUE('RAjan','Rajan123@GMAIL.COM','30');

SELECT * FROM student;

INSERT INTO student(sname,semail,Sage) 
VALUE('rohan','Rohan123@GMAIL.COM','16');  # this query will not insert because age restriction.alter


INSERT INTO student(sname,semail,Sage) 
VALUE('riya','Riya123@GMAIL.COM','25');

INSERT INTO student(sname,semail,Sage) 
VALUE('siya','riya123@GMAIL.COM','20');

SELECT * FROM student;

INSERT INTO student(sname,semail,Sage) 
VALUE('siya','siya123@GMAIL.COM','20');

SELECT * FROM student;

INSERT INTO student(sname,semail,Sage) 
VALUE('rohan','rohan123@GMAIL.COM','24');

SELECT * FROM student;

INSERT INTO student(sid,sname,semail,Sage) 
VALUE(108,'rohit','rohit123@GMAIL.COM','29');

SELECT * FROM student;

# CHECK COMMAND PEHLE QUERY KO CHECK KRTA H FIR INSERT KRTA H AUR UNIQUE COMMAND PEHLE INSERT KRTA H FIR CHECK KRTA h

# CLAUSES
#LIMIT
SELECT * FROM student LIMIT 3;

ALTER TABLE student ADD COLUMN 	sadd VARCHAR (20) NOT NULL;

UPDATE student SET sadd='Delhi' WHERE sage >25;

# AGGREGATE FUNCTIONS
# SUM, MIN, MAX, COUNT, AVG	
SELECT COUNT(*) FROM student;

SELECT SUM(sfee) FROM student;

SELECT MAX(sage) FROM student;

SELECT MIN(sage) FROM student;

SELECT AVG(sage) FROM student;

# GROUP BY
SELECT sadd,COUNT(*) FROM student GROUP BY sadd;

SELECT sadd,SUM(sage) FROM student GROUP BY sadd;

SELECT sadd,MAX(sage) FROM student GROUP BY sadd;