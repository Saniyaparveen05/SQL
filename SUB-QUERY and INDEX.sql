/*
SUB-QUERY and INDEX

SUB-QUERY :- A query in a query is called sub-query. or
A query inside a query
*/
USE amazone;

SELECT * FROM employee;
# SECOND HIGHEST SALARY EMPLOYEE
SELECT * FROM employee ORDER BY esal DESC LIMIT 1 OFFSET 1;

# 1 highest salary
SELECT MAX(esal) FROM employee;
# 2 highest salary
SELECT MAX(esal) FROM employee WHERE esal<87345;

# 2 highest salary with sub-query
SELECT MAX(esal) FROM employee 
WHERE esal<(SELECT MAX(esal) FROM employee);

# show all employees who earn less then average salary.
SELECT * FROM employee
WHERE esal<(SELECT AVG(esal) FROM employee);

# show all employees who earn ABOVE then average salary.
SELECT * FROM employee
WHERE esal>(SELECT AVG(esal) FROM employee);

# Show name of the employees who are from NOIDA city using their EMPLOYEE ID
SELECT ename FROM employee 
WHERE eid IN (SELECT eid FROM employee WHERE eadd='noida');
# OR
SELECT * FROM employee 
WHERE eid IN (SELECT eid FROM employee WHERE eadd='noida');


USE store;
# PRINT the name of the customers of have placed orders
SELECT cname FROM customer AS c WHERE EXISTS
(SELECT * FROM orders AS o WHERE c.cid = o.cid);

# PRINT the name of the customers of had not placed orders
SELECT cname FROM customer AS c WHERE NOT EXISTS
(SELECT * FROM orders AS o WHERE c.cid = o.cid);

USE amazone;
# print column and additional column by with the help of sub-query
SELECT eid,ename,esal,(SELECT AVG(esal) FROM employee) FROM employee;
#OR
# with the help of WINDOW FUNCTION
SELECT eid,ename,esal,AVG(esal) OVER () FROM employee;


SELECT * FROM employee WHERE esal>50000 AND eadd='Delhi';

SELECT * FROM 
(SELECT eid,ename,eadd,esal FROM employee WHERE eadd='Delhi') AS NewTable
WHERE esal>50000;

# INDEX
/*
WITHOUT INDEX (FULL SEARCH (slow process))
WITH INDEX (DIRECT SEARCH (fast process/search ))
*/

SELECT * FROM employee WHERE eadd='noida';  # it is time taking process

# CREATING INDEX
# SYNTAX :- CREATE INDEX index_name ON table_name(col_name)
CREATE INDEX address_index
ON employee(eadd);
SELECT * FROM employee WHERE eadd='noida';  


SELECT * FROM employee WHERE eadd='noida' AND esal>80000;  # slow (because only one column has index)
CREATE INDEX add_sal
ON employee(eadd,esal);
SELECT * FROM employee WHERE eadd='noida' AND esal>80000;  # fast

#INDEX
-primary key
-foreign key
-Unique
-custome index (less use)