/*
DCL :- DATA CONTROL LANGUAGE

*/
# How to check current user
SELECT CURRENT_USER ();   

# How to create user
# SYNTAX :- CREATE USER 'user_name'@'LOCALHOST' INDENTIFIED BY 'PASSWORD' 
CREATE USER 'Admin'@'localhost' IDENTIFIED BY '1234';

# How to login in command line mysql using a different a/c
# mysql -u username -p enter

# How to display all users
SELECT USER , HOST FROM Mysql.USER;


# How to delete a user
DROP USER 'Admin'@'localhost';

USE amazone;
SHOW TABLES ;

# GRANT PERMISSIONS OF A DATABASE'S TABLE
# PRIVILEGES => SELECT, DELETE, UPDATE, INSERT  (privileges means permissions)
GRANT SELECT, INSERT ON amazone.employee TO 'Admin'@'localhost';

# GRANT FULL ACCESS of a table
GRANT ALL PRIVILEGES ON amazone.employee TO 'Admin'@'localhost';

# REMOVE PERMISSIONS
REVOKE DELETE ON amazone.employee FROM 'Admin'@'localhost';
REVOKE ALL PRIVILEGES ON amazone.employee FROM 'Admin'@'localhost';

# DDL :- Data Definition Language
	# CREATE , DROP , ALTER , TRUNCATE
# DML :- Data Manipulation Language
	# INSERT , DELETE , SELECT , UPDATE
# DQL :- Data Query Language
	# SELECT (JOINS , SUB-QUERIES , GROUP BY etc) 
# TCL :- Transaction Control Language
	# START TRANSACTION , COMMIT , ROLLBACK , SAVEPOINT
# DCL :- Data Control Language
	# GRANT , REVOKE