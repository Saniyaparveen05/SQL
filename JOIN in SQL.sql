CREATE DATABASE store;

USE store;

CREATE TABLE customer(
cid int PRIMARY KEY AUTO_INCREMENT,
cname VARCHAR(100) NOT NULL,
cadd VARCHAR(100) NOT NULL,
cmob VARCHAR(15) UNIQUE NOT NULL
);

INSERT INTO customer VALUES (101, "Mohan", "Noida", "8756874875"),
(102,"Suresh", "Delhi", "84798758448"),
(103,"Riya", "GZB", "74643859875"),
(104,"Preet", "Delhi", "4385674658");

SELECT * FROM customer;

CREATE TABLE product(
pid int PRIMARY KEY AUTO_INCREMENT,
pname VARCHAR(100) NOT NULL,
price DECIMAL(8,2) NOT NULL);

INSERT INTO product VALUES (501, "keyboard", 980);

INSERT INTO product (pname, price) VALUES 
("mouse", 680),
("SSD", 9750),
("Monitor", 4270),
("HDD", 5300);

SELECT * FROM product;

CREATE TABLE orders(
oid int PRIMARY KEY AUTO_INCREMENT,
cid int NOT NULL,
pid int NOT NULL,
qty int DEFAULT 1);

INSERT INTO orders (cid , pid , qty) VALUES
(102,504,5),
(103,502,7),
(108,503,7),
(103,509,4),
(109,509,5);

SELECT * FROM orders;

# JOIN
# JOIN IS USED TO DISPLAY DATA FROM MORE THAN ONE TABLE

# CROSS JOIN  
SELECT * FROM customer
JOIN orders;
# OR
 SELECT * FROM customer
CROSS JOIN orders;


# JOIN/INNER JOIN (INTERSECTION/COMMON)
SELECT * FROM customer
JOIN orders
ON customer.cid = orders.cid;
# or 
SELECT * FROM customer
INNER JOIN orders
ON customer.cid = orders.cid;


# JOIN aur CROSS JOIN dono ek hi jaise hi hum agr isme CONDITION("ON") lgate h wo INNER JOIN kehlayega

# Another type of synatax for print
SELECT * FROM customer AS c
INNER JOIN orders AS o
ON c.cid = o.cid;

SELECT * FROM customer AS c
JOIN orders AS o
ON c.cid = o.cid
JOIN product AS p
ON o.pid = p.pid;

SELECT c.*,pname,price,qty FROM customer AS c     # c.* means everything from customer table
JOIN orders AS o
ON c.cid = o.cid
JOIN product AS p
ON o.pid = p.pid;

# OR

SELECT c.cid,cname,cadd,cmob,pname,price,qty FROM customer AS c    
JOIN orders AS o
ON c.cid = o.cid
JOIN product AS p
ON o.pid = p.pid;


SELECT c.cid,cname,cadd,cmob,pname,price,qty, price *qty AS Amt FROM customer AS c    
JOIN orders AS o
ON c.cid = o.cid
JOIN product AS p
ON o.pid = p.pid;
