# ALL CLAUSES

CREATE DATABASE amazone;

USE amazone;

CREATE TABLE employee(
eid INT PRIMARY KEY AUTO_INCREMENT,
ename VARCHAR(100) NOT NULL,
eadd VARCHAR(100) NOT NULL,
edesg VARCHAR(100) NOT NULL,
esal DECIMAL(8,2) DEFAULT 0.0
);

INSERT INTO employee VALUES
(101,'rahul sharma','noida','IT', 64376),
(102,'simran kaur', 'delhi','HR',47388),
(103,'harpreet','GZB','IT',87345),
(104, 'yogesh', 'delhi','HR', 58457),
(105,'shiva','noida','HR', 85454);

 # SELECT
 SELECT * FROM employee;
 
 # FROM
 SELECT * FROM employee;
 
 # WHERE
 SELECT * FROM employee WHERE esal>50000;
 SELECT * FROM employee WHERE eadd='delhi';
 
 # DISTINCT
 SELECT eadd FROM employee;
 SELECT DISTINCT eadd FROM employee;
 
 # HOW MANY CITIES WE HAVE
 SELECT DISTINCT COUNT(eadd) FROM employee;
SELECT COUNT(DISTINCT eadd) FROM employee; 

# ORDER BY (use to sort)
SELECT * FROM employee ORDER BY esal;       # BY DEFAULT = ASC
SELECT * FROM employee ORDER BY esal ASC;   # ASC = ASCENDING ORDER
SELECT * FROM employee ORDER BY esal DESC;  # DESC = DESCENDING ORDER

# LIMIT 
SELECT * FROM employee LIMIT 2;

# NAME OF HIGHEST SALARY THE EMPLOYEE 
SELECT * FROM employee ORDER BY esal DESC LIMIT 1;
# NAME OF LOWEST SALARY THE EMPLOYEE
SELECT * FROM employee ORDER BY esal ASC LIMIT 1;


# OFFSET   # ISKA MTLB STARTING KI EK YA EK SE JYADA LINE CHHOR KR PRINT KRWANA
SELECT * FROM employee LIMIT 2 OFFSET 2;

# SECOND HIGHEST SALARY
SELECT * FROM employee ORDER BY esal DESC LIMIT 1 OFFSET 1;

# GROUP BY 
SELECT edesg, SUM(esal) FROM employee GROUP BY edesg;
SELECT eadd, SUM(esal) FROM employee GROUP BY eadd;


# print employee name and designation and salary
SELECT ename, edesg, esal FROM employee; 

# SALARIES IN EVERY ADDRES IN ASENDING ORDER
SELECT eadd,sum(esal) FROM employee GROUP BY eadd ORDER BY sum(esal);
SELECT eadd,sum(esal) AS salary FROM employee GROUP BY eadd ORDER BY salary ;