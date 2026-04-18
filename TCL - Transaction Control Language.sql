/*
TCL - Transaction Control Language

TRANSACTION :- A group of queries execute to complete a single task

ACID
A :- Atomicity - All or Nothing
C :- Consistency - Data Remains Valid
I :- Isolation - Transaction do not interfare
D :- Durability -Once commited, Data is saved permanently
*/

CREATE DATABASE Bank;

USE Bank;

CREATE TABLE accounts(
aid INT PRIMARY KEY AUTO_INCREMENT,
aname VARCHAR(100) NOT NULL,
balance DECIMAL(8,2) DEFAULT 0.0
);

INSERT INTO accounts VALUES
(5536,'aman kumar',7273),
(5537,'rahul singh',3548),
(5538,'yogesh saini',2534);

SELECT * FROM accounts;

# Aman wants to send 1000/- to rahul
UPDATE accounts SET balance=balance-1000 WHERE aid=5536;
UPDATE accounts SET balance=balance+1000 WHERE aid=5537;

# To perform a transaction we should start a TRANSACTION
SELECT * FROM accounts;
START TRANSACTION;

# Aman wants to send 1000/- to rahul
UPDATE accounts SET balance=balance-1000 WHERE aid=5536;
UPDATE accounts SET balance=balance+1000 WHERE aid=5537;
ROLLBACK;
SELECT * FROM accounts;

# Aman wants to send 1000/- to rahul
UPDATE accounts SET balance=balance-1000 WHERE aid=5536;
UPDATE accounts SET balance=balance+1000 WHERE aid=5537;
COMMIT;  # Its permanently save

# Aman wants to send 1000/- to rahul
# Rahul needs to send 1750/- to Yogesh
SELECT * FROM accounts;
START TRANSACTION;
# Transaction 1 
UPDATE accounts SET balance=balance-1000 WHERE aid=5536;
UPDATE accounts SET balance=balance+1000 WHERE aid=5537;
SAVEPOINT s1;
# Transaction 2
UPDATE accounts SET balance=balance-1750 WHERE aid=5537;
UPDATE accounts SET balance=balance+1750 WHERE aid=5538;
COMMIT;
# Or
ROLLBACK TO s1;