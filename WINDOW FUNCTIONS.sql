# WINDOW FUNCTIONS
# SELECT col1,col2, win_fun OVER () FROM table_name
USE amazone;

SELECT eadd, SUM(esal) FROM employee GROUP BY eadd;

# aggregate (behave like a window finction)
SELECT ename, SUM(esal) OVER () FROM employee;
SELECT * , SUM(esal) OVER () AS Total_budget FROM employee;

SELECT * , SUM(esal) OVER (PARTITION BY eadd) AS Total FROM employee;

SELECT * , SUM(esal) OVER (PARTITION BY eadd ORDER BY esal) AS Total FROM employee;


# window function
# ROW NUMBER
SELECT ename, esal, ROW_NUMBER () OVER ()FROM employee;
SELECT ename, esal, ROW_NUMBER () OVER (ORDER BY ename) AS RowNumber FROM employee;

SELECT ename, esal, ROW_NUMBER () OVER (ORDER BY esal) AS RowNumber FROM employee;

SELECT ename, esal, ROW_NUMBER () OVER (ORDER BY esal DESC) AS RowNumber FROM employee;

# RANK    (ye rank number utna accurate nhi deta skip bhi kr deta h
SELECT * , RANK () OVER ( ORDER BY esal DESC) FROM employee;

# DENSE_RANK   ( ye accurate rank number deta h skip nhi krta)
SELECT * , DENSE_RANK () OVER ( ORDER BY esal DESC) AS RANK_ FROM employee;

# LAG   (ye last value lekr chalta h for comparison)
SELECT * , LAG (esal) OVER ( ORDER BY esal) FROM employee;

# CTE (Common Table Expression)
/*
WITH new_table_name AS(
	Your Query;
) SELECT * FROM new_table_name;
*/
SELECT *,esal*0.20 AS bonus FROM employee;

WITH myemp AS (
SELECT eid,ename,email FROM employee
) SELECT eid,ename FROM myemp;

# FIND THE THIRD HIGHEST SALARY's EMPLOYEE DETAIL
WITH mytable AS (
SELECT * , DENSE_RANK() OVER (ORDER BY esal DESC) AS rnk FROM employee
) SELECT * FROM mytable WHERE rnk=3;