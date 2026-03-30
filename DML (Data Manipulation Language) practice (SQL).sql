CREATE DATABASE Company;

USE Company;

CREATE TABLE Employee(
EmpID int,
EmpName text,
EmpAdd text,
EmpMob, text
);

Describe Employee;

ALTER TABLE Employee ADD COLUMN EmpEmail text;

DESCRIBE Employee;

# INSERT
# INSERT INTO table_name VALUE (val1, val2,...);
INSERT INTO employee
 VALUE (101, 'Rahul', 'Noida', '2534626237', 'Rahul123@Gmail.com');
 
 #SELECT
 #SELECT col1,col2.col3,... FROM Employee
 SELECT employee_id, employee_name, Employee_Address, Employee_Mobile, EmpEmail
 FROM employee;
 
 SELECT * FROM employee;   # * => ALL
 SELECT employee_id, employee_name FROM employee;
 
 #INSERT INTO table_name (col1,col2,..) VALUE (al1,val2,..);
 INSERT INTO employee(employee_id, employee_name, employee_address, EmpEmail)
 VALUE (102, 'Mohan', 'DELHI','mohan456@Gmail.com');
 
 SELECT * FROM employee;
 
 INSERT INTO employee VALUES
 (103, 'Vikas', 'GZB', '347857754', 'Vikas123@Gmail.com'),
 (104, 'Aman', 'DELHI', '8748647637', 'Aman423@Gmail.com'),
 (105, 'Jain ', 'Noida', '2387443784', 'Jain869@Gmail.com'),
 (106, 'Preet', 'DELHI', '7465834633', 'Preet098@Gmail.com');
 
 INSERT INTO employee VALUES
 (107, 'Vikas', NULL, '347857754', 'Ritik6345@Gmail.com'),
 (108, 'Vinit', 'NOIDA', NULL, 'Ritik6345@Gmail.com');
 
 SELECT * FROM employee;
 
 # WHERE clause
 SELECT * FROM employee WHERE employee_address="noida";

SELECT * FROM employee WHERE employee_id>103;

# DELETE  
DELETE FROM employee;  # it will erase all data of your table
DELETE FROM employee WHERE Employee_id=101;

# IF safe mode is ON and you are unable to delete anything
SET SQL_SAFE_UPDATES = 0; 

SELECT * FROM Employee;

# UPDATE 
# UPDATE table_name SET col_name=Values
UPDATE Employee SET Employee_address='DELHI' WHERE Employee_id=107;

SELECT * FROM Employee;


# TRAINER TABLE 
# CHAR(0-255 character)
# VARCHAR (0-65K characters)
# TEXT (0-65K characters)   FIXED SIZE

# PRIMARY KEY => UNIQUE, NOT NULL, FOREIGN KEY
# UNIQUE => UNIQUE

CREATE TABLE Trainer(
tid int PRIMARY KEY AUTO_INCREMENT,
tname VARCHAR(30) NOT NULL,
tadd VARCHAR (100) NOT NULL,
temail VARCHAR(30)UNIQUE NOT NULL,
tmob VARCHAR(15) UNIQUE,
tsalary DECIMAL(8,2)
);

 DESCRIBE Trainer;