USE amazone;

SHOW TABLES;

SELECT * FROM employee;
SELECT * FROM emp_log;

DELIMITER //
CREATE TRIGGER check_salary
BEFORE UPDATE ON employee
FOR EACH ROW
BEGIN
	IF NEW.esal < old.esal THEN
    SIGNAL SQLSTATE	'45000'
    SET MESSAGE_TEXT = "Salary can not be decreased";
    END IF;
END // DELIMITER ;

SELECT * FROM employee;
SELECT * FROM emp_log;

UPDATE employee SET esal = 70000 WHERE eid = 101;
UPDATE employee SET esal = 50000 WHERE eid = 101;  # this will give you error 
 

 # NAME LENGTH SHOULD NOT BE LESS THAN 4 CHARSCTERS
 DELIMITER //
CREATE TRIGGER validate_name
BEFORE INSERT ON employee
FOR EACH ROW
BEGIN
	IF LENGTH(NEW.ename) < 4 THEN
	SIGNAL SQLSTATE	'45000'
	SET MESSAGE_TEXT = "Name should be atleast 4 characters!";
    END IF;
END // DELIMITER ;

INSERT INTO employee (ename,eadd,edesg,esal) VALUE
('Anu','noida','IT',75566);    # it will gives you warning

SHOW WARNINGS;