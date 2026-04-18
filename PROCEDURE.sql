/*	PROCEDURES :- A procedures is a stored query which fires when a user called.alter
it is like a user define function.

SYNTAX :-
CREAT PROCEDURE procedure_name(parameters)
BEGIN
	--SQL query;
END ;
CALL procedure_name(arguments);

*/
USE amazone;

SHOW TABLES;

SELECT * FROM employee;

DELIMITER //
CREATE PROCEDURE total_salary() 
BEGIN
	SELECT sum(esal) FROM employee;
END // DELIMITER ;

CALL total_salary;

DELIMITER //
CREATE PROCEDURE salbydesg(IN desg VARCHAR(100))
BEGIN
	SELECT sum(esal) FROM employee WHERE edesg = desg ;
END // DELIMITER ; 

CALL salbydesg('IT');
CALL salbydesg('HR');


DELIMITER //
 CREATE PROCEDURE ins_emp (IN name VARCHAR(100), IN adds VARCHAR(100), IN desg VARCHAR(100), IN sal DECIMAL(8,2))
BEGIN
	INSERT INTO employee(ename,eadd,edesg,esal)
    VALUE(name,adds,desg,sal);
END //DELIMITER ;

CALL ins_emp ('ramandeep','GZB','IT',64364);
CALL ins_emp ('raman','GZB','Admin',64364);
SELECT * FROM employee;

SHOW PROCEDURE STATUS;  # it will show all database procedures
SHOW PROCEDURE STATUS WHERE db='amazone';  # it will show given database procedure

SHOW CREATE PROCEDURE ins_emp;

DELIMITER //
CREATE PROCEDURE total_salaries(IN desg VARCHAR(100),OUT Salary DECIMAL(8,2))
BEGIN
	SELECT sum(esal) INTO Salary FROM employee WHERE edesg = desg ;
END // DELIMITER ; 

CALL total_salaries('IT',@Salary);
SELECT @Salary;

CALL total_salaries('HR',@Salary);
SELECT @Salary;