USE amazone;

SHOW TABLES;

SELECT * FROM employee;

SELECT *, esal*0.10 AS 	Bonus FROM employee;

#CTE :- Common Table Expression
WITH newTable AS (
 SELECT *, esal*0.10 AS 	Bonus FROM employee
 ) SELECT * FROM newTable WHERE Bonus>6000;
 
 SELECT * FROM newTable;   # it will not work
 
 # VIEW
 CREATE VIEW BonusTable AS 
 SELECT eid, ename, edesg, esal*0.10 AS Bonus FROM employee;
 
 SELECT * FROM BonusTable;

 SELECT * FROM BonusTable WHERE Bonus>7000;
 
 SHOW TABLES;
 
 # WINDOW FUNCTION 
 # NTILE :- It divides data into equal parts
 SELECT * FROM employee;
 SELECT * FROM employee ORDER BY esal DESC;
 SELECT *, ROW_NUMBER() OVER (ORDER BY esal DESC) FROM employee;

 SELECT *, NTILE(2) OVER (ORDER BY esal DESC) FROM employee;
 SELECT *, NTILE(4) OVER (ORDER BY esal DESC) FROM employee;
 SELECT *, NTILE(3) OVER (ORDER BY esal DESC) FROM employee;

# LAG
SELECT * FROM employee;
SELECT eid,ename,esal FROM employee;
SELECT eid,ename,esal, LAG(esal) OVER() AS PrevSalary FROM employee;
SELECT eid,ename,esal, LAG(esal) OVER(ORDER BY esal DESC) AS PrevSalary FROM employee;

# LEAD
SELECT * FROM employee;
SELECT eid,ename,esal, LEAD(esal) OVER(ORDER BY esal) AS NextSalary FROM employee;

 # FIRST_VALUE
 SELECT * FROM employee ORDER BY esal DESC LIMIT 1;
 SELECT *,FIRST_VALUE(esal) OVER() FROM employee;
  SELECT *,FIRST_VALUE(esal) OVER(ORDER BY esal DESC) FROM employee;
  
  