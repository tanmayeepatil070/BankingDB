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
 
 
 
 