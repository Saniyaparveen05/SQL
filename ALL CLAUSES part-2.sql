SHOW DATABASES;

USE amazone;

SELECT * FROM employee;

SELECT eadd, sum(esal) AS salary FROM employee GROUP BY eadd ORDER BY eadd ASC;

# HAVING clause:- where clause group by ke sath use nhi hota to hum having ka use krte group by use krte waqt
# Print salaries that are more than 100000
  SELECT eadd, sum(esal) AS salary FROM employee GROUP BY eadd HAVING sum(esal)>100000;
  
SELECT * FROM employee WHERE esal>60000;
  
SELECT * FROM employee HAVING esal>60000;
   
# HAVING clause har jagah kam krta h jaha jaha WHERE kam krta h but WHERE waha kam nhi krta jaha GROUP BY laga ho
   
INSERT INTO employee (ename,eadd,edesg,esal) VALUES
   ('Riya Sharma','Nainital', 'HR', 86758),
   ('Siya Singh','Nagpur', 'IT', 83858);
   
SELECT * FROM employee; 
SELECT * FROM employee WHERE eadd='NOIDA';

# LIKE 
# WILDCARD (% , _ ) ...."%" = iska mtlb h ye sign "%" jidhar bhi dia ho aage pichhe utna chhor kr dia gya specific alphabet se related word print hona chahiya but ye word ke beech ka dia gya aplhabet print nhi kr skta to uski jagah hum "_" ka use krte h
SELECT * FROM employee WHERE eadd LIKE 'NOIDA';
SELECT * FROM employee WHERE eadd LIKE 'N%';
SELECT * FROM employee WHERE eadd LIKE 'Na%';

SELECT * FROM employee WHERE eadd LIKE '%i%';
SELECT * FROM employee WHERE eadd LIKE '%i';
SELECT * FROM employee WHERE eadd LIKE 'i%';
   
SELECT * FROM employee WHERE ename LIKE 'r%';

# _ ..."_ " iska mtlb h jitni baar is sign ka "_" ka use krenge utni baar chhor ke dia gya specific alphabet se related word print krna hota h
SELECT * FROM employee WHERE ename LIKE '_a%';
SELECT * FROM employee WHERE eadd LIKE '__l%';


# AND OR NOT
# Print add but jaha noida ho wo nhi
# NOT
SELECT * FROM employee WHERE eadd!='noida';  # ! = is not equal to
SELECT * FROM employee WHERE eadd='noida';   # = equal to
SELECT * FROM employee WHERE NOT eadd='noida';

# AND
SELECT * FROM employee WHERE esal>50000 AND eadd='noida';
SELECT * FROM employee WHERE esal>50000 AND esal<80000;

# OR  ...# dono m se koi sa bhi condition true hoga print ho jayega...bhale hi dono print ho jaye
SELECT * FROM employee WHERE esal>80000 OR eadd='delhi';  
SELECT * FROM employee WHERE esal<60000 OR eadd='noida'; 


# BETWEEN , IN  
SELECT * FROM employee WHERE esal BETWEEN 50000 AND 80000;
SELECT * FROM employee WHERE eadd IN ('NOIDA','DELHI'); 

# CASE 
SELECT * ,
CASE
	WHEN esal<50000 THEN 'Below_Average'
    WHEN esal<80000 THEN 'Average'
	ELSE 'Above_Average'
END AS 'Status' 
FROM employee;