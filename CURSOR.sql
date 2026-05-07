# CURSOR :- A cursor is use to execute a query row by row like a loop.

USE amazone;
SHOW TABLES;
SELECT * FROM employee;

# PROCEDURE
DELIMITER //
CREATE PROCEDURE show_emp()
BEGIN
	# DECLARE VARIABLES
	DECLARE emp_id INT;
    DECLARE emp_name VARCHAR(100);
    DECLARE emp_sal DECIMAL;
    DECLARE done INT DEFAULT 0;
    # DECLARE CURSOR
    DECLARE emp_cursor CURSOR FOR 
		SELECT eid,ename,esal FROM employee;
	# handler for exit
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
    # open cursor
    OPEN emp_cursor;
    read_loop: LOOP
		FETCH emp_cursor INTO emp_id, emp_name, emp_sal;
		IF done THEN
			LEAVE read_loop;
		END IF;
        SELECT emp_id AS EMP_ID,emp_name AS EMP_NAME, emp_sal AS EMP_SAL;
	END LOOP;
    CLOSE emp_cursor;
END // DELIMITER ;

CALL show_emp(); 