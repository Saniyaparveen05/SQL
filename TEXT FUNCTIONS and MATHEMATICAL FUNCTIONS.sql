# TEXT FUNCTIONS
# UPPER, LOWER, TRIM, LENGTH, SUBSTRING, REPLACE, CONCAT

USE amazone;

SELECT * FROM employee;

SELECT UPPER(ename) FROM employee;
SELECT LOWER(ename) FROM employee;
SELECT ename, LENGTH(ename) FROM employee;
SELECT CONCAT(ename," - ",eadd) FROM employee;
SELECT ename, TRIM(ename) FROM employee;    # REMOVE EXTRA SPACES FROM LEADING AND TRAINING
SELECT ename, SUBSTRING(ename,4) FROM employee;
SELECT ename, SUBSTRING(ename,1,3) FROM employee;
SELECT ename, UPPER(SUBSTRING(ename,1,3)) FROM employee;
SELECT REPLACE ("HELLO INDIA", "INDIA","WORLD");
SELECT email, REPLACE(email,"@gmail.com","@hotmail.com") FROM employee;
SELECT ename, REPLACE(ename,"s","k") FROM employee;

# MATHEMATICAL FUNCTIONS
# ROUND, CEIL, FLOOR, MOD, POWER, RAND
# ROUND
SELECT esal, ROUND(esal) FROM employee;
SELECT esal, ROUND(esal,1) FROM employee;

# FLOOR
SELECT esal, FLOOR(esal) FROM employee;   # YE NICHE KI TARAF ROUND OFF KRTA H

# CEIL
SELECT esal, CEIL(esal) FROM employee;   # YE UPAR KI TARAF ROUND OFF KRTA H

# MOD
SELECT esal, MOD(esal,100) FROM employee;  # YE REMAINDER NIKALTA H

SELECT esal FROM employee;
SELECT esal, FLOOR(esal/1000) AS KM , MOD(esal,1000) AS M FROM employee;   #KM=kilometer , M=meter
SELECT esal, CONCAT(FLOOR(esal/1000),"KM" , MOD(esal,1000),"M") FROM employee;

# POWER
SELECT POWER(2,5);
SELECT eid,POWER(eid,2) FROM employee;

# RAND
SELECT RAND();
SELECT RAND()*100;
SELECT CEIL(RAND()*100);

# DATE and TIME FUNCTIONS
# NOW, TODAY, CURRENT_DATE, CURRENT_TIMESTAMP

SELECT NOW();
SELECT CURRENT_DATE();
SELECT CURDATE();
SELECT CURRENT_TIMESTAMP();
SELECT CURTIME();

SELECT YEAR(CURDATE());
SELECT MONTH(CURDATE());
SELECT DAY(CURDATE());

# CONDITIONAL FORMULA
# IF, IFNULL
SELECT * FROM employee;
SELECT ename, esal, IF (esal>55000,"HIGH","LOW") FROM employee;

SELECT ename , esal,
	CASE
		WHEN esal>70000 THEN "above_average"
        WHEN esal>55000 THEN "Average_salary"
		ELSE "Below_salary"
	END AS Status
FROM employee;

# IFNULL
SELECT ename,IFNULL( eadd,"No Address") FROM employee;