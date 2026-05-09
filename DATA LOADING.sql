CREATE DATABASE dataset;

USE dataset;

CREATE TABLE emp(
eid INT,
ename VARCHAR(100),
eadd VARCHAR (100),
esal VARCHAR(100)
);

# DATA LOADING
LOAD DATA INFILE"C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Employee.csv"
INTO TABLE emp
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS ;

SET GLOBAL local_infile = 1;

# TO FIND THE RIGHT PATH, THAT WHERE SHOULD BE FILE STORE 
SHOW VARIABLES LIKE "secure_file_priv";
 
SELECT * FROM emp;
UPDATE emp SET eadd='Noida' WHERE eadd='';
UPDATE emp SET eadd='Noida' WHERE eadd=103;

# DELETE ALL DATA WITH STRUCTURE
TRUNCATE emp;
DROP TABLE emp;

# If file has null values 
LOAD DATA INFILE"C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Employee.csv"
INTO TABLE emp
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS 
(eid,ename,eadd,esal)
SET
	ename = NULLIF(ename,'NoName'),
    eadd = IF(eadd='','NoAddress', eadd),
    esal = IF(esal='',0.0,esal);
    