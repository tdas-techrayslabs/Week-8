create database bank;

use bank;

-- Customer
CREATE TABLE CUSTOMER (
	CUST_NO CHAR(5) PRIMARY KEY CHECK(
    CUST_NO LIKE 'C____'
    ),
    NAME VARCHAR(20) NOT NULL,
    PHONE_NO NUMERIC(10),
    CITY VARCHAR(15) NOT NULL
);

DROP TABLE CUSTOMER;
DROP TABLE DEPOSITOR;
DROP TABLE LOAN;
DROP TABLE INSTALLMENT;
DROP TABLE BRANCH;
DROP TABLE ACCOUNT;

DESCRIBE CUSTOMER;

-- Branch 
CREATE TABLE BRANCH (
	BRANCH_CODE VARCHAR(5) PRIMARY KEY,
    BRANCH_NAME VARCHAR(15) NOT NULL,
    BRANCH_CITY VARCHAR(20) CHECK(BRANCH_CITY IN ('DELHI', 'MUMBAI', 'KOLKATA', 'CHENNAI'))
);

DESCRIBE BRANCH;

-- Account
CREATE TABLE ACCOUNT (
	ACCOUNT_NO CHAR(5) PRIMARY KEY CHECK(ACCOUNT_NO LIKE 'A____'),
    TYPE CHAR(2) CHECK(TYPE IN ('SB', 'FD', 'CA')),
    BALANCE NUMERIC(7) CHECK(BALANCE < 10000000),
    BRANCH_CODE VARCHAR(5),
    CONSTRAINT fk_Branch_code FOREIGN KEY (BRANCH_CODE) REFERENCES BRANCH(BRANCH_CODE)
);

DESCRIBE ACCOUNT;

-- Depositor
CREATE TABLE DEPOSITOR (
	CUST_NO CHAR(5) CHECK(CUST_NO LIKE 'C____'),
    ACCOUNT_NO CHAR(5) CHECK(ACCOUNT_NO LIKE 'A____'),
    PRIMARY KEY (CUST_NO, ACCOUNT_NO),
    CONSTRAINT fk_Cust_no FOREIGN KEY (CUST_NO) REFERENCES CUSTOMER(CUST_NO),
    CONSTRAINT fk_Account_no FOREIGN KEY (ACCOUNT_NO) REFERENCES ACCOUNT(ACCOUNT_NO)
);

DESCRIBE DEPOSITOR;

-- Loan
CREATE TABLE LOAN (
	LOAN_NO CHAR(5) PRIMARY KEY CHECK(LOAN_NO LIKE 'L____'),
    CUST_NO CHAR(5) CHECK(CUST_NO LIKE 'C____'),
    AMOUNT NUMERIC(10) CHECK(AMOUNT>1000),
    BRANCH_CODE VARCHAR(5),
    CONSTRAINT fk_Cust_no_loan FOREIGN KEY (CUST_NO) REFERENCES CUSTOMER(CUST_NO),
    CONSTRAINT fk_Branch_code_loan FOREIGN KEY (BRANCH_CODE) REFERENCES BRANCH(BRANCH_CODE)
);

DESCRIBE LOAN;

-- Installment
CREATE TABLE INSTALLMENT (
	INST_NO NUMERIC(5) CHECK(INST_NO <= 10),
    LOAN_NO CHAR(5) CHECK(LOAN_NO LIKE 'L____'),
    INST_AMOUNT NUMERIC(10) NOT NULL,
    CONSTRAINT fk_Loan_no_inst FOREIGN KEY (LOAN_NO) REFERENCES LOAN(LOAN_NO),
    CONSTRAINT pk_Loan PRIMARY KEY (INST_NO, LOAN_NO)
);

DESCRIBE INSTALLMENT;


-- Account data insertion
INSERT INTO CUSTOMER VALUES (
'C0001', 'RAJ ANAND SINGH', 9861258466, 'DELHI');

SELECT * FROM CUSTOMER; 

INSERT INTO CUSTOMER VALUES
('C0002', 'ANKITA SINGH', '9879958651', 'BANGALORE'),
('C0003', 'SOUMYA JHA', '9885623344', 'MUMBAI'),
('C0004', 'ABHIJIT MISHRA', '9455845425', 'MUMBAI'),
('C0005', 'YASH SARAF', '9665854585', 'KOLKATA'),
('C0006', 'SWAROOP RAY', '9437855466', 'CHENNAI'),
('C0007', 'SURYA NARAYAN PRADHAN', '9937955212', 'GURGAON'),
('C0008', 'PRANAV PRAVEEN', '9336652441', 'PUNE'),
('C0009', 'STUTI MISRA', '7870266534', 'DELHI'),
('C0010', 'ASLESHA TIWARI', NULL , 'MUMBAI');

SELECT * FROM CUSTOMER; 

-- Branch data insertion
INSERT INTO BRANCH VALUES
('B001', 'JANAKPURI BRANCH', 'DELHI'),
('B002', 'CHANDNICHOWK BRANCH', 'DELHI'),
('B003', 'JUHU BRANCH', 'MUMBAI'),
('B004', 'ANDHERI BRANCH', 'MUMBAI'),
('B005', 'SALTLAKE BRANCH', 'KOLKATA'),
('B006', 'SRIRAMPURAM BRANCH', 'CHENNAI');

SELECT * FROM BRANCH;

-- Account data insertion
INSERT INTO ACCOUNT VALUES
('A0001', 'SB', 200000, 'B003'),
('A0002', 'SB', 15000, 'B002'),
('A0003', 'CA', 850000, 'B004'),
('A0004', 'CA', 35000, 'B004'),
('A0005', 'FD', 28500, 'B005'),
('A0006', 'FD', 550000, 'B005'),
('A0007', 'SB', 48000, 'B001'),
('A0008', 'SB', 7200, 'B002'),
('A0009', 'SB', 18750, 'B003'),
('A0010', 'FD', 99000, 'B004');

SELECT * FROM ACCOUNT;

-- Depositor data insertion 
INSERT INTO DEPOSITOR VALUES
('C0003', 'A0001'),
('C0004', 'A0001'),
('C0004', 'A0002'),
('C0006', 'A0003'),
('C0006', 'A0004'),
('C0001', 'A0005'),
('C0002', 'A0005'),
('C0010', 'A0006'),
('C0009', 'A0007'),
('C0008', 'A0008'),
('C0007', 'A0009'),
('C0006', 'A0010');

SELECT * FROM DEPOSITOR;

-- Loan data insertion
INSERT INTO LOAN VALUES
('L0001', 'C0005', 3000000, 'B006'),
('L0002', 'C0001', 50000, 'B005'),
('L0003', 'C0002', 8000000, 'B004'),
('L0004', 'C0010', 100000, 'B004'),
('L0005', 'C0009', 9500000, 'B005'),
('L0006', 'C0008', 25000, 'B006');

SELECT * FROM LOAN;

-- Installment data insertion
INSERT INTO INSTALLMENT VALUES
(1, 'L0005', 500000),
(1, 'L0002', 10000),
(1, 'L0003', 50000),
(1, 'L0004', 20000),
(2, 'L0005', 500000),
(1, 'L0006', 3000),
(2, 'L0002', 10000),
(3, 'L0002', 10000),
(2, 'L0003', 50000),
(2, 'L0004', 20000);


SELECT * FROM INSTALLMENT;

-- 1)
-- a) Find out the name, phone_no and cust_no of customer having Account_no “A0004”. 
SELECT NAME, PHONE_NO, CUSTOMER.CUST_NO
FROM CUSTOMER 
INNER JOIN DEPOSITOR 
ON CUSTOMER.CUST_NO = DEPOSITOR.CUST_NO
WHERE ACCOUNT_NO = 'A0004';

-- b) Find out the loan_amount and branch code of customer named “YASH SARAF”. 
SELECT AMOUNT, BRANCH_CODE
FROM CUSTOMER 
INNER JOIN LOAN 
ON CUSTOMER.CUST_NO = LOAN.CUST_NO
WHERE CUSTOMER.NAME = 'YASH SARAF';

-- c)  Find out the name of the customer who has not taken any loan. 
SELECT NAME
FROM CUSTOMER 
WHERE CUST_NO NOT IN (
SELECT CUST_NO 
FROM LOAN);

-- d) Find out the account_no and Balance of customer with cust_no = “C0010”. 
SELECT ACCOUNT_NO, BALANCE
FROM ACCOUNT
WHERE ACCOUNT_NO = (
SELECT ACCOUNT_NO
FROM DEPOSITOR
WHERE CUST_NO = 'C0010');
 
-- e) Find out the branch_city where “ASLESHA TIWARI” has taken a loan.
SELECT 
    BRANCH_CITY
FROM
    BRANCH
WHERE
    BRANCH_CODE = (SELECT 
            BRANCH_CODE
        FROM
            LOAN
        WHERE
            CUST_NO = (SELECT 
                    CUST_NO
                FROM
                    CUSTOMER
                WHERE
                    NAME = 'ASLESHA TIWARI'));

-- f) Find out the installment details of customer named “ANKITA SINGH”. 
SELECT * 
FROM INSTALLMENT 
WHERE LOAN_NO = (
SELECT LOAN_NO
FROM LOAN
WHERE CUST_NO = (
SELECT CUST_NO
FROM CUSTOMER
WHERE NAME = 'ANKITA SINGH')
);

-- g)  Find out the branch name and branch city, in which “ABHIJIT MISHRA” has an account.
SELECT BRANCH_NAME, BRANCH_CITY
FROM BRANCH
WHERE BRANCH_CODE IN (
SELECT BRANCH_CODE
FROM ACCOUNT
WHERE ACCOUNT_NO IN (
SELECT ACCOUNT_NO 
FROM DEPOSITOR
WHERE CUST_NO = (
SELECT CUST_NO
FROM CUSTOMER 
WHERE NAME = 'ABHIJIT MISHRA')
));

-- h) Create a table named ACCOUNT_TYPE from ACCOUNT table with two columns named as ACCOUNT_NO and TYPE without taking any records from ACCOUNT table. 
CREATE TABLE ACCOUNT_TYPE AS
SELECT ACCOUNT_NO, TYPE
FROM ACCOUNT
WHERE 1 = 0;

DESCRIBE ACCOUNT_TYPE;

-- i) Insert the account no and type from ACCOUNT table into the ACCOUNT_TYPE table whose balance is less than 50000.
INSERT INTO ACCOUNT_TYPE (
SELECT ACCOUNT_NO, TYPE
FROM ACCOUNT 
WHERE BALANCE < 50000);

SELECT * FROM ACCOUNT_TYPE; 

-- j) UPDTAE the account type to FD in ACCOUNT_TYPE table for the customer with CUST_NO equal to C0007.
UPDATE ACCOUNT_TYPE
SET TYPE = 'FD'
WHERE ACCOUNT_NO = (
SELECT ACCOUNT_NO
FROM DEPOSITOR
WHERE CUST_NO = 'C0007'
);

SELECT * FROM ACCOUNT_TYPE;

-- k) Delete from ACCOUNT_TYPE table the details of account whose balance is less than 20000.
DELETE
FROM ACCOUNT_TYPE
WHERE ACCOUNT_NO IN (
SELECT ACCOUNT_NO
FROM ACCOUNT
WHERE BALANCE < 20000);

SELECT * FROM ACCOUNT_TYPE;

-- l) Find out the name of the customers who have both an account and loan at the bank.
SELECT NAME
FROM CUSTOMER
WHERE CUST_NO IN (
SELECT CUST_NO
FROM LOAN)
AND CUST_NO IN (
SELECT CUST_NO
FROM DEPOSITOR
);

-- m) Find out the name of all customers who have a loan at the bank but don’t have an account at the bank.
SELECT NAME
FROM CUSTOMER
WHERE CUST_NO IN (
SELECT CUST_NO
FROM LOAN)
AND CUST_NO NOT IN (
SELECT CUST_NO
FROM DEPOSITOR
);

-- n) Find out the name of the customers having more than one account.
SELECT NAME
FROM CUSTOMER
WHERE CUST_NO IN (
SELECT CUST_NO
FROM DEPOSITOR
GROUP BY CUST_NO
HAVING COUNT(*) > 1);

-- o) Find out the details of the account having same type and branch_code as the account_no A0001.
SELECT * FROM ACCOUNT
WHERE TYPE = (
SELECT TYPE 
FROM ACCOUNT
WHERE ACCOUNT_NO = 'A0001')
AND BRANCH_CODE = (
SELECT BRANCH_CODE
FROM ACCOUNT
WHERE ACCOUNT_NO = 'A0001')
AND 
ACCOUNT_NO != 'A0001';

-- p) Display the customer number and the number of accounts,  which has more than one account without using having clause. (Use sub query in  the form clause) 
SELECT CUST_NO, ACC_COUNT
FROM (
SELECT CUST_NO, COUNT(*) AS ACC_COUNT
FROM DEPOSITOR
GROUP BY CUST_NO) AS ACC_COUNT_TABLE
WHERE ACC_COUNT > 1;

-- q) Display the name of the customers and their number of accounts, who have more than one account. (Use scalar subquey) 
SELECT NAME, (
SELECT COUNT(*)
FROM DEPOSITOR
WHERE CUST_NO = CUSTOMER.CUST_NO) AS Acc_count
FROM CUSTOMER
WHERE (
SELECT COUNT(*)
FROM DEPOSITOR
WHERE CUST_NO = CUSTOMER.CUST_NO) > 1;

-- r) Display the branch codes and average account balance of those branches where the average account balance is greater than 60000. (Use sub query in  the form clause) 
SELECT BRANCH_CODE, AVERAGE_ACCOUNT_BALANCE
FROM (
SELECT BRANCH_CODE, AVG(BALANCE) AS AVERAGE_ACCOUNT_BALANCE
FROM ACCOUNT
GROUP BY BRANCH_CODE) AS Avg_Acc_balance
WHERE AVERAGE_ACCOUNT_BALANCE > 60000;

-- s) Find out the account_no that has grater balance than some accounts of type FD. (Use >some clause)
SELECT ACCOUNT_NO, TYPE 
FROM ACCOUNT
WHERE BALANCE > SOME (SELECT BALANCE 
FROM ACCOUNT
WHERE TYPE = 'FD');

-- t) Find out the account_no that has grater balance than all accounts of type FD. (Use  >all clause)
SELECT ACCOUNT_NO, TYPE 
FROM ACCOUNT
WHERE BALANCE > ALL (SELECT BALANCE 
FROM ACCOUNT
WHERE TYPE = 'FD');

-- u) Display the details of the branch in which some loans are taken. (Use exist clause)
SELECT * 
FROM BRANCH b
WHERE EXISTS (
SELECT BRANCH_CODE
FROM LOAN l
WHERE b.BRANCH_CODE = l.BRANCH_CODE);

-- v) Display the details of the loan for which no instalments are paid. (Use not exist clause)
SELECT *
FROM LOAN l
WHERE NOT EXISTS (
SELECT *
FROM INSTALLMENT i
WHERE l.LOAN_NO = i.LOAN_NO);

-- w) Increase all accounts with balance over 80000 by 6%, and all other accounts receive 5%. (Use case statement) 
CREATE TABLE ACCOUNT_temp AS
SELECT * FROM ACCOUNT;

SELECT *,
	CASE
    WHEN BALANCE > 80000 THEN BALANCE * 1.06
    ELSE BALANCE * 1.05
    END NEW_BALANCE
FROM ACCOUNT_temp;

-- 2)
-- a) Find out the Loan_nos where the loans are taken from any branch with branch_city = MUMBAI.
SELECT LOAN_NO
FROM LOAN l
INNER JOIN
BRANCH b
ON l.BRANCH_CODE = b.BRANCH_CODE
where BRANCH_CITY = 'MUMBAI';

-- b) Find the Type of the accounts available in any branch with branch_city =DELHI. 
SELECT DISTINCT TYPE
FROM ACCOUNT a
INNER JOIN BRANCH b
ON a.BRANCH_CODE = b.BRANCH_CODE
WHERE BRANCH_CITY = 'DELHI';

-- c) Find out the Name and Ph_no of customers who have account balance more than 100000. 
SELECT NAME, PHONE_NO
FROM CUSTOMER c
INNER JOIN 
DEPOSITOR d 
ON c.CUST_NO = d.CUST_NO
INNER JOIN ACCOUNT a
ON d.ACCOUNT_NO = A.ACCOUNT_NO
WHERE BALANCE > 100000;

-- d) Find out Installment_no and Installment amount of customer with Name= RAJ ANAND SINGH.
SELECT INST_NO, INST_AMOUNT
FROM INSTALLMENT i
INNER JOIN LOAN l
on i.LOAN_NO = l.LOAN_NO
INNER JOIN
CUSTOMER c 
on l.CUST_NO = c.CUST_NO
WHERE NAME = 'RAJ ANAND SINGH';

-- e) Find out the Name of the customers who do not have account of Type=SB.
SELECT DISTINCT NAME
FROM CUSTOMER c
INNER JOIN
DEPOSITOR d
ON c.CUST_NO = d.CUST_NO
INNER JOIN
ACCOUNT a
ON d.ACCOUNT_NO = a.ACCOUNT_NO
WHERE TYPE != 'SB';

-- f) Find out the Name of the customers who have paid installments of Amount 50000 against his/her loan.
SELECT DISTINCT NAME
FROM CUSTOMER c
INNER JOIN LOAN l
ON c.CUST_NO = l.CUST_NO
INNER JOIN 
INSTALLMENT i
ON l.LOAN_NO = i.LOAN_NO
WHERE INST_AMOUNT = 50000; 

-- g) Find out the Ph_no of customers having account at branch with Branch_name equal to SALTLAKE.
SELECT PHONE_NO
FROM CUSTOMER c
INNER JOIN
LOAN l
ON c.CUST_NO = l.CUST_NO
INNER JOIN 
BRANCH b
ON l.BRANCH_CODE = b.BRANCH_CODE
WHERE BRANCH_NAME LIKE 'SALTLAKE%';

-- h) Find out the Branch_name and Branch_city where customer with Name=ABHIJIT MISHRA has his account.
SELECT BRANCH_NAME, BRANCH_CITY
FROM BRANCH b
INNER JOIN LOAN l
ON b.BRANCH_CODE = l.BRANCH_CODE
INNER JOIN CUSTOMER c
ON l.CUST_NO = c.CUST_NO
WHERE NAME = 'ABHIJIT MISHRA';

-- i) Find out the Types of account and the account Balance of customer with Name=’SWAROOP RAY’ 
SELECT TYPE, BALANCE
FROM ACCOUNT a
INNER JOIN DEPOSITOR d
ON a.ACCOUNT_NO = d.ACCOUNT_NO
INNER JOIN CUSTOMER c
ON d.CUST_NO = c.CUST_NO
WHERE NAME = 'SWAROOP RAY';

-- j) Display the name and the number of accounts of the customers, who have more than one account. 
SELECT NAME, COUNT(ACCOUNT_NO) 
FROM CUSTOMER c
INNER JOIN DEPOSITOR d
ON c.CUST_NO = d.CUST_NO
GROUP BY d.CUST_NO
HAVING COUNT(ACCOUNT_NO) > 1;

-- k) Find all the account_no with the maximum balance. (use with clause) 
WITH MAX_BALANCE AS (
	SELECT MAX(BALANCE) AS max_Bal
    FROM ACCOUNT
)

SELECT ACCOUNT_NO, BALANCE
FROM ACCOUNT
WHERE BALANCE = (
SELECT max_Bal
FROM MAX_BALANCE);

-- l) Find all branch codes where the total balance is greater than the average of the total balance at all departments. (use with clause)
WITH NEW_AVERAGE AS (
SELECT AVG(BALANCE) AS avg1
FROM ACCOUNT
GROUP BY BRANCH_CODE
)

SELECT BRANCH_CODE, SUM(BALANCE) AS Total_Balance
FROM ACCOUNT
GROUP BY BRANCH_CODE
HAVING SUM(BALANCE) > ALL(SELECT avg1
FROM NEW_AVERAGE);

-- 3)
-- a) Create a view CUSTOMER_ACC_DETAILS consisting of Customer_No, Name with Account number and Balance.  

-- i) Check the structure of the view. 
CREATE VIEW CUSTOMER_ACC_DETAILS AS 
SELECT c.CUST_NO, NAME, a.ACCOUNT_NO, BALANCE
FROM CUSTOMER c 
INNER JOIN DEPOSITOR d
ON c.CUST_NO = d.CUST_NO
INNER JOIN ACCOUNT a
ON d.ACCOUNT_NO = a.ACCOUNT_NO;

DESCRIBE CUSTOMER_ACC_DETAILS;

-- ii) Access the data from the view. 
SELECT * FROM CUSTOMER_ACC_DETAILS;

-- iii) Delete the information of the customer having CUST_NO C0004 from the view. 
DELETE 
FROM CUSTOMER_ACC_DETAILS
WHERE CUST_NO = 'C0004';

-- Check whether the deletion has done any changes in the base tables. 
SELECT * FROM CUSTOMER
WHERE CUST_NO = 'C0004';

SELECT * FROM CUSTOMER_ACC_DETAILS;

-- iv) Insert the information of the customer having CUST_NO C0004 to the view again. 
INSERT INTO CUSTOMER_ACC_DETAILS VALUES
('C0004', 'ABHIJIT MISHRA', 'A0001', '200000');

-- v) Update the view CUSTOMER_ACC_DETAILS to include customer’s phone no. 
CREATE OR REPLACE VIEW CUSTOMER_ACC_DETAILS AS 
SELECT c.CUST_NO, NAME, PHONE_NO, a.ACCOUNT_NO, BALANCE
FROM CUSTOMER c 
INNER JOIN DEPOSITOR d
ON c.CUST_NO = d.CUST_NO
INNER JOIN ACCOUNT a
ON d.ACCOUNT_NO = a.ACCOUNT_NO;

SELECT * FROM CUSTOMER_ACC_DETAILS;

-- vi) Delete the view with its structure. 
DROP VIEW CUSTOMER_ACC_DETAILS;

-- b) Create a View BRANCH_LOCATE having columns Branch Name and Branch City having branch city not in KOLKATA. 
CREATE VIEW BRANCH_LOCATE AS
SELECT BRANCH_NAME, BRANCH_CITY
FROM BRANCH
WHERE BRANCH_CITY != 'KOLKATA';

SELECT * FROM BRANCH_LOCATE;

-- c) Create a view LOAN_M with column customer name, loan no. and loan amount representing the details of all customers having loan in any branch of MUMBAI. 
CREATE VIEW LOAN_M AS 
SELECT NAME, LOAN_NO, AMOUNT
FROM CUSTOMER c 
INNER JOIN LOAN l
ON c.CUST_NO = l.CUST_NO 
INNER JOIN BRANCH b
on l.BRANCH_CODE = b.BRANCH_CODE
WHERE BRANCH_CITY = 'MUMBAI';

SELECT * FROM LOAN_M;

-- i) Display the name of the customers taking loan amount between 50000 to 500000 
-- in any branch of MUMBAI. (Write the query using the view LOAN_M and 
-- without using the view)
SELECT NAME 
FROM LOAN_M
WHERE AMOUNT BETWEEN 50000 AND 500000;

SELECT NAME, AMOUNT 
FROM CUSTOMER c
INNER JOIN LOAN l
ON c.CUST_NO = l.CUST_NO
INNER JOIN
BRANCH b
ON l.BRANCH_CODE = b.BRANCH_CODE
WHERE AMOUNT BETWEEN 50000 AND 500000
AND BRANCH_CITY = 'MUMBAI';

-- d) Create a view ALL_CUSTOMERS consisting of branches and their customers. 
create view ALL_CUSTOMERS as
select d.cust_no, name, a.account_no, branch_name
from customer c 
inner join depositor d 
on c.cust_no=d.cust_no
inner join account a 
on d.account_no=a.account_no
inner join branch b 
on a.branch_code=b.branch_code
union
select l1.cust_no, name, loan_no, branch_name
from customer c1
inner join loan l1 
on c1.cust_no=l1.cust_no
inner join branch b1
on l1.branch_code=b1.branch_code;

SELECT * FROM ALL_CUSTOMERS;

-- i) Find all customers WHO HAVE AN ACCOUNT OR LOAN IN JUHU BRANCH.
SELECT NAME, CUST_NO
FROM ALL_CUSTOMERS
WHERE BRANCH_NAME = 'JUHU BRANCH'; 

-- ii) Display the number of customers of each branch.
SELECT BRANCH_NAME, COUNT(DISTINCT CUST_NO) AS NO_OF_CUSTOMERS
FROM ALL_CUSTOMERS
GROUP BY BRANCH_NAME;

-- ---------------------------------------------------------


