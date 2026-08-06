-- show databases;
-- CREATE DATABASE BankingDB;
-- USE Bankingdb;
CREATE TABLE Customers(
CustomerID INT PRIMARY KEY,
FirstName VARCHAR(50),
LastName VARCHAR(50),
Email VARCHAR(100),
Phone VARCHAR(15),
AccountCreationDate DATE
);

describe customers;

select * from customers;

 CREATE TABLE Accounts(
 AccountID INT,
 AccountType VARCHAR(50),
 Balance DECIMAL(10,2)
 );
 
 desc accounts;
 
 CREATE TABLE Transctions(
 TransactionID INT,
 TransactionDate DATE,
 Amount DECIMAL (10,2),
 TransactionType VARCHAR(20)
 );
 
 desc Transctions;
ALTER TABLE Transctions
RENAME TO Transactions;

CREATE TABLE Branches(
BranchID INT,
BranchName VARCHAR(100),
BranchAddress VARCHAR(100),
BranchPhone VARCHAR(15)
);

desc Branches;

CREATE TABLE AccountBranches(
AssignmentDate date
);

CREATE TABLE Loans (
LoanID INT,
LoanAmount decimal(10,2),
InterestRate decimal(5,2),
StartDate DATE,
EndDate DATE
);
desc loans;

ALTER TABLE customers
ADD DateOfBirth DATE;
desc customers;

ALTER TABLE customers
MODIFY Phone VARCHAR(20);
desc customers;

ALTER TABLE Accounts
ADD CONSTRAINT chk_MinBalance
CHECK (Balance >= 1000);
 desc Accounts;
 
 DROP TABLE AccountBranches;
 
 ALTER TABLE Accounts
 ADD CustomerID INT;
 
 ALTER TABLE Accounts
 ADD CONSTRAINT Fk_Accounts_Customers
 foreign key (CustomerID)
 REFERENCES Customers(CustomerID);
 desc Accounts;
 
 ALTER TABLE Accounts
 ADD Constraint PK_AccountID
 PRIMARY KEY (AccountID);
 desc accounts;
 
ALTER TABLE customers
MODIFY FirstName varchar(50) NOT NULL;
desc customers;

ALTER TABLE Customers
ADD constraint uq_Email
UNIQUE (Email);
desc Customers;
 
 ALTER TABLE Branches
 ADD constraint PK_BranchID
 primary key (BranchID);
 desc branches;
 
 Alter table Accounts
 ADD BranchID INT;

  ALTER TABLE Accounts
 ADD CONSTRAINT Fk_Branch_Customers
 foreign key (BranchID)
 REFERENCES Branches(BranchID);
 desc Accounts;
 
 -- Transaction connect with Accounts 
 ALTER TABLE transactions
 Add AccountID INT;
 
 ALTER TABLE Transactions
ADD CONSTRAINT FK_Transactions_Accounts
FOREIGN KEY (AccountID)
REFERENCES Accounts(AccountID);
desc transactions;

ALTER TABLE Transactions
ADD CONSTRAINT PK_TransactionID
PRIMARY KEY (TransactionID);

-- Connect Loan with Customers
ALTER TABLE Loans
ADD CustomerID INT;

ALTER TABLE Loans
ADD CONSTRAINT FK_Loans_Customers
FOREIGN KEY (CustomerID)
REFERENCES Customers(CustomerID);

desc Loans;

ALTER TABLE Loans
ADD CONSTRAINT PK_LoanID
PRIMARY KEY (LoanID);

 SELECT
  CONSTRAINT_NAME,
 CONSTRAINT_TYPE
 FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
 WHERE TABLE_SCHEMA= "bankingdb"
 AND TABLE_NAME = "Transactions";
 
 SHOW CREATE TABLE Accounts;
 
 INSERT INTO Customers
 (CustomerID, FirstName, LastName, Email, Phone, DateOfBirth)
 VALUES
 (101,'Rahul','Sharma','rahulsharma@gmail.com','9876543210','1998-04-15');
 
 SELECT * From Customers;
 UPDATE Customers
SET AccountCreationDate = '2026-08-01'
WHERE CustomerID = 101;

 SELECT * From Customers;
 
 INSERT INTO Customers
 VALUES
 (10,'Rahul','Sharma','rahulsharma@gmail.com','9876543210','2026-08-04', '1998-04-15');
 
  INSERT INTO Customers
 VALUES
 (102,'Ketan','Tiwaro','ketan@gmail.com','2428543210','2026-08-04', '1788-07-10');
 SELECT * From Customers;
 
 INSERT INTO Customers
 VALUE
 (103,'Neha','Singh','neha@gmail.com','8975643210','2025-02-04', '2025-05-15');
  INSERT INTO Customers
 VALUE
 (104,'Tanu','Patil','Tanu@gmail.com','8579312210','2025-06-10', '2005-01-20'),
 (105,'Shweta','Pal','shweta@gmail.com','8975643210','2025-11-20', '2004-05-22');
 SELECT * From Customers;
 
INSERT INTO Branches
(BranchID, BranchName, BranchAddress, BranchPhone)
value
(1, 'Dharmpeth','Nagpur',0712-568941);
SELECT * From Branches;

INSERT INTO Branches
value
(2, 'Kamptee', 'Kamptee Road', 8745963147),
(3, 'Kuhi', 'Bhandara', 8746931454);

INSERT INTO Accounts
(AccountID, AccountType, Balance, CustomerID, BranchID)
value
(301, 'Savings', 25000, 101, 1);
SELECT * From Accounts;

INSERT INTO Accounts
value
(302, 'Savings', 50000, 102, 2),
(303, 'Savings', 75000, 103, 3);

INSERT INTO Accounts
value
(304, 'Current', 1000000, 103,3);

-- INSER INTO Accounts
-- Value 
-- (305, 'Current', 25000, 105,5),


DELETE FROM ACCOUNTS
WHERE AccountID = 201;

update accounts
set balance = balance+2000
where accountid = 304;

INSERT INTO Loans
(LoanID, LoanAmount, InterestRate, StartDate, EndDate, CustomerID)
value
(4001, 50000.00, 10, '2024-01-01', '2025-12-31', 101);
SELECT* FROM Loans;

INSERT INTO Transactions
(TransactionID, TransactionDate, Amount, TransactionType, AccountID)
value
(50001, '2025-06-10', 100000.00, 'Deposit', 301);
SELECT * FROM Transactions;

INSERT INTO Trsanctions
value
(50002, '2025-07-11', 10000.00, 'Withdrawal', 302),
(50003, '2025-08-12', 55000.00, 'Deposit', 304);

insert	into transactions
value 
(50002, '2026-01-05', 100000.00, 'Deposit', 304),
(50003, '2025-07-14', 1000.00, 'Withdrawal', 301);

delete from transactions
where TransactionID = 5000;

UPDATE ACCOUNTS
SET Balance = 30000
where CustomerID = 101;

update customers 
set Email = 'rahulsharma@gmail.com', Phone = '7249884501'
where customerid = 101;

delete from accounts
where accountid = 303;

-- select column-name from table-name;  DQL command  
-- * represents all
SELECT   
    CustomerID, FirstName, LastName, Phone
FROM
    Customers;
    
 -- where clause filtering data (conditions)
 
 SELECT * From Accounts
 Where AccountType = 'Savings';
 
 SELECT * FROM ACCOUNTS
 WHERE BALANCE <50000;
 
--  !=/<> not equal to

SELECT *FROM ACCOUNTS
WHERE ACCOUNTTYPE <>'Savings';

SELECT * FROM ACCOUNTS
WHERE BALANCE <=50000 AND ACCOUNTTYPE = 'SAVINGS';
-- AND = && can use by this two types
-- OR = || can use by this tow types 

SELECT * FROM ACCOUNTS
WHERE BALANCE <=50000 OR ACCOUNTTYPE = 'SAVINGS';

SELECT * FROM ACCOUNTS
WHERE NOT ACCOUNTTYPE = 'SAVINGS';

SELECT * From Customers
Where AccountCreationDate >='2026-07-01';

update Customers 
set Phone = '7597463145' and phone = '2428543210'
where customerID = 105;

-- 06-08-2026
-- USED IN Operators
SELECT FirstName, LastName, Phone
From Customers
where Phone IN ('7249884501', '2428543210', '8975643210');

SELECT FirstName, LastName, Phone
From Customers
where Phone = '7249884501' or Phone = '2428543210' or Phone ='8975643210';

-- Using Between Operator (we can give range)
-- Find customers having balance between 20000 to 60000
Select AccountID, CustomerId, balance
from Accounts
where Balance Between 20000 and 60000;
-- the values specified in the range are included in the results.

Select AccountID, CustomerID , balance
from accounts
where balance >=20000 and Balance <=60000; -- using logical operator

-- LIKE operator use for pattern matching
-- two wild card characters 
-- %=matches any number of characters, even zero characters
-- "_"Underscore= Matches excatly one number of characters
select * from Customers 
where FirstName Like 'K%';

-- Customers whose last name ends with"a"
select * from Customers 
where FirstName Like '%a';

-- Find all customers whose last name has excatly 3 characters
select * from Customers 
where LastName Like '___';

-- ORDER BY 
-- sort the accounts table according to customers balance.
Select * From Accounts
order by Balance DESC; 

-- sort the Branches table according to Branch Name .
Select * From Branches
order by BranchName DESC; 

-- Sort accoirding to multiple columns
-- Sort accounts table according to the accounttype and balance
Select * From Accounts
Order by Accounttype ASC, Balance asc;

-- using DISTINCT clause
-- Find distinct(unique) account tyoes from accounts table
SELECT DISTINCT AccountType
FROM Accounts;

-- find distinct transaction types and accountID
-- from transactions Table
SELECT DISTINCT TransactionType, AccountID
FROM transactions;

SELECT* FROM Accounts;
SELECT* FROM Branches;
SELECT* FROM Customers;
SELECT* FROM Loans;
SELECT* FROM Transactions;