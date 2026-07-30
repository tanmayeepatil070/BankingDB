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
 
 
 