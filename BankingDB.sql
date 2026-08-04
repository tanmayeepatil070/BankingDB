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

INSERT INTO Accounts
(AccountID, AccountType, Balance, CustomerID, BranchID)
value
(301, 'Savings', 25000, 101, 1);
SELECT * From Accounts;

 

 
 
 
 
 