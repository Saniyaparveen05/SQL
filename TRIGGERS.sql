# TRIGGERS :- triggers is a stored query, which will fires automatically when an event occur
# EVENT :- INSERT, DELETE, UPDATE
USE amazone;

SHOW TABLES;

SELECT * FROM employee;

CREATE TABLE emp_log(
logid INT PRIMARY KEY AUTO_INCREMENT,
eid INT,
ename VARCHAR(100),
eadd VARCHAR(100),
edesg VARCHAR(100),
esal DECIMAL(8,2),
time_ TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
event_ VARCHAR(100)
);

INSERT INTO employee (ename,eadd,edesg,esal) VALUES
('MOHAN', 'GZB', 'IT',73475);

SELECT * FROM employee;

INSERT INTO emp_log (eid,ename,eadd,edesg,esal,event_) VALUES
(108,'MOHAN','GZB','IT',73475,'joined');

SELECT * FROM emp_log;

# SYNTAX :-
/*
DELIMITER $$
CREATE TRIGGER trigger_name
BEFORE|AFTER INSERT|DELETE|UPDATE  ON table_name
FOR EACH ROWS
BEGIN
	--SQL QUERY;
END $$ DELIMITER ;
*/

# Example:-
DELIMITER $$
CREATE TRIGGER ins_emp
AFTER INSERT ON employee
FOR EACH ROW
BEGIN
	INSERT INTO emp_log (eid,ename,eadd,edesg,esal,event_) VALUES
(New.eid, New.ename, New.eadd, New.edesg, New.esal,'joined');
END $$ DELIMITER ;


INSERT INTO employee (ename,eadd,edesg,esal) VALUES
('vihan', 'delhi','HR',45665);

SELECT * FROM employee;
SELECT * FROM emp_log;

DELIMITER //
CREATE TRIGGER del_emp
BEFORE DELETE ON employee
FOR EACH ROW
BEGIN
	INSERT INTO emp_log (eid,ename,eadd,edesg,esal,event_) VALUES
(OLD.eid, OLD.ename, OLD.eadd, OLD.edesg, OLD.esal,'Resigned');
END // DELIMITER ;

SELECT * FROM employee;
SELECT * FROM emp_log;

DELETE FROM employee WHERE eid = 108;

DELIMITER //
CREATE TRIGGER upd_emp
AFTER UPDATE ON employee
FOR EACH ROW
BEGIN
	INSERT INTO emp_log (eid,ename,eadd,edesg,esal,event_) VALUES
(NEW.eid, NEW.ename, NEW.eadd, NEW.edesg, NEW.esal,'Updated');
END // DELIMITER ;

SELECT * FROM employee;
SELECT * FROM emp_log;
 
 UPDATE employee SET esal = 50000 WHERE eid = 109;
 
 SET SQL_SAFE_UPDATES = 0; 