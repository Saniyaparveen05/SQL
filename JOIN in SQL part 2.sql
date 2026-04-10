USE store;

SHOW TABLES;

SELECT * FROM customer;

SELECT * FROM customer JOIN orders ON customer.cid = orders.cid;

SELECT * FROM customer c 
 JOIN orders o ON c.cid = o.cid 
JOIN product P ON p.pid = o.pid;

SELECT c.*, pname, price, qty FROM customer c 
 JOIN orders o ON c.cid = o.cid 
JOIN product P ON p.pid = o.pid;

SELECT c.*, pname, price, qty*price AS amount FROM customer c 
 JOIN orders o ON c.cid = o.cid 
JOIN product P ON p.pid = o.pid;

SELECT c.*, pname, price, qty*price AS amount, price*qty*0.18 AS TAX,
price*qty+price*qty*0.18 AS NetAmount FROM customer c 
 JOIN orders o ON c.cid = o.cid 
JOIN product P ON p.pid = o.pid;

# LEFT JOIN / LEFT OUTER JOIN
SELECT * FROM customer c
LEFT JOIN orders o
ON c.cid = o.cid;

SELECT * FROM customer c
LEFT JOIN orders o
ON c.cid = o.cid;

# RIGHT JOIN / RIGHT OUTER JOIN 
SELECT * FROM customer c
RIGHT JOIN orders o
ON c.cid = o.cid;

SELECT * FROM customer c
RIGHT OUTER JOIN orders o
ON c.cid = o.cid; 

# FULL OUTER JOIN (DO NOT SUPPORT IN MySQL)   
# UNION 
SELECT * FROM customer c
LEFT JOIN orders o
ON c.cid = o.cid
UNION
SELECT * FROM customer c
RIGHT JOIN orders o
ON c.cid = o.cid;

# SELF JOIN
SELECT * FROM customer c1
JOIN customer c2;

SELECT * FROM customer c1
JOIN customer c2
ON c1.cid = c2.cid;