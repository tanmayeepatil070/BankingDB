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
-- Find distinct(unique) account types from accounts table
SELECT DISTINCT AccountType
FROM Accounts;

-- find distinct transaction types and accountID
-- from transactions Table
SELECT DISTINCT TransactionType, AccountID
FROM transactions;

-- offset limit  Select column_name from table_name limit number_of_rows offset skiped_rows
SELECT * from Customers
limit 2 offset 1;

-- top 2 highest balance
select* from accounts
order by Balance Desc
limit 2;

-- customer having 3rd hightest balance 
-- by using limit and offset
select* from accounts
order by Balance Desc
limit 1 offset 2;

-- by using only limit
select* from accounts
order by Balance Desc
limit 2,1; -- here 1 specifies the number of row to be return and 2 denotes the rows to be skiped 

-- Pagination
-- Formula Page Number = P
-- Records per page = N
-- Offset = (P-1)*N

-- IS NULL
-- null is the absence of any value

INSERT INTO Customers
(CustomerID, FirstName, LastName, Email, Phone, AccountCreationDate, DateOfBirth)
Values
(106,'Priya', 'Patil', 'priya@gmail.com', NULL, '2024-05-12', '1999-07-16'),
(107,'Adhira', 'Bagde', 'adhira@gmail.com', '9585671536', '2025-08-25', '2022-01-01'),
(108,'Anshu', 'Shelare', 'anshu@gmail.com', NULL, '2023-02-10', '2008-12-17'),
(109,'Kajal', 'Pande', 'kajal@gmail.com', '9875630402', '2026-02-20', '2007-02-23'),
(110,'yash', 'Shende', 'yash@gmail.com', '7675459612', '2024-02-10', '2005-09-04');

-- '______' is the string
Select * From Customers
where phone IS NULL;

Select * From Customers
where phone IS  NOT NULL;

INSERT INTO Accounts
(AccountID, AccountType, Balance, CustomerID, BranchID)
Values
(305, 'Current',40000, 105,1),
(306, 'Savings',40500, 106,2),
(307, 'Savings',80050, 107,3),
(308, 'Current',70000, 108,2),
(309, 'Current',100000, 109,1),
(310, 'Savings',65000, 110,2);

INSERT INTO Transactions
(TransactionID, TransactionDate, Amount, TransactionType, AccountID)
Values
(50004, '2025-03-21',10000, 'Withdrawal',305),
(50005, '2025-06-15',15000, 'Deposit',305),
(50006, '2026-03-01',35000, 'Withdrawal',306),
(50007, '2024-12-30','5000', 'Withdrawal',307),
(50008, '2025-11-16','25000', 'Deposit',307);

INSERT INTO Loans
(LoanID, LoanAmount, InterestRate, StartDate, EndDate, CustomerID)
Values
(4002,100000,2.5,'2020-02-15','2021-02-14',102),
(4003,105500,4.5,'2021-03-08','2022-02-10',103),
(4004,150000,5,'2022-01-05','2023-02-14',104);

-- CASE Statement  >50000 high value  <50000 low value
Select AccountID, Balance,
CASE
When Balance>=50000 then 'HIGH VALUE'
ELse 'LOW VALUE'
END AS Category
From Accounts;

-- Categorize the deposits in the transactions table as per conditions given
-- If above 10000(included) high amount alter
-- If 5000(included) to 10000 Medium Amount
-- If upto 5000 Low Amount
-- For transaction type withdrawal "Not Applicable"
Select TransactionType, Amount,
CASE
When TransactionType = 'Deposit' AND Amount >=10000 then 'HIGH AMOUNT'
When TransactionType = 'Deposit' AND Amount >=5000 then ' MEDIUM AMOUNT' 
When TransactionType = 'Deposit' And Amount <5000 then 'LOW AMOUNT'
ELse 'Not Applicable'
END AS AmountStatus
From transactions;

-- String Functions : Modify TEXT, Analyze text, format text
Select CustomerID, upper(FirstName), upper(LastName)
From Customers; 

Select CustomerID, lower(FirstName), lower(LastName)
From Customer;

-- Char Length and Length gives output in bytes

Select LastName, length(lastName) from customers;

Select LastName, char_length(LastName) from customers;
Select length("NAGPUR"); -- GIVES O/P in number of bytes
Select length("नागपूर"); -- GIVES O/P in number of bytes
Select char_length("NAGPUR"); -- GIVES O/P in number of characters
Select char_length("नागपूर"); -- GIVES O/P in number of characters

-- CONCAT() means to join like lastName and firstname results into full name
SELECT CustomerID,CONCAT(FirstName, ' ', LastName,' - ', Phone) AS FullName
FROM Customers;

-- Substring function (String,Position,Length) to extract
Select CustomerID, concat(Substring(FirstName, 1, 1),". ", LastName) As Full
From Customers;

-- Trim  function Removes leading (LTRIM) and trailing (RTRIM) spaces
Select length(TRIM("   Hello World   ")); -- with TRIM()
Select length("   Hello World   "); -- Without TRIM()
Select length(trim(Substring("Hello World",6)));

-- Replace function - Replaces a part of string or replaces occurances of the specified string
-- It is case sensitive
Select replace("MAT","M","C");
Select replace("MAT MAT","M","C");
Select replace("MAT mAT","M","C");
Select replace("Madhya Pradesh","Madhya","Andhra");

-- Mathematical functions
-- Round function - Rounds number to given decimal places.

Select avg(Balance) From accounts 
where AccountType = 'Savings';

Select round(avg(Balance),2) From accounts 
where AccountType = 'Savings';

-- CEIL()/CEILING() returns the smallest integer value not less than x. REutns NULL if x is NULL.
-- it rounds the number upward
Select ceil(avg(Balance)) From accounts 
where AccountType = 'Savings';

-- Floor() - Rounds to downward or Return the largest interger value not greater than the argument
Select floor(avg(Balance)) From accounts 
where AccountType = 'Savings';

Select floor(avg(Balance)) From accounts 
where AccountType = 'Current';

Select floor(avg(Amount)) From transactions 
where TransactionType = 'Deposit';

Select avg(Amount) as AverageDeposit From transactions 
where TransactionType = 'Deposit';

-- Absolute() - returns positive number
Select abs(-2453) As Example;
Select abs(-2.43) As Example;
Select abs(453) As Example;
Select abs(45.23) As Example;

-- MOD() Remainder - It returns the remainder after division
Select (7/3); -- simple division
Select mod(7,3);

-- POWER() - Exponent=Raises number to power
Select power(2,3);
Select power(1.5,3);

-- SQRT() - Square root = 
Select sqrt(144) ;
Select sqrt(123) ;

-- DATE AND TIME FUNCTIONS
-- Format yyyy-mm-dd; hh-mm-ss
-- NOW() Current date & time
Select now();
Select current_date(); -- returns current date
Select current_time(); -- returns current time
Select year(current_date()); -- returns year
Select month(current_date()); -- returns month
Select day(current_date()); -- returns day
 
-- YEAR(), MONTH(), DAY()
Select  DateOfBirth,Year(DateOfBirth)As YEAR,
Month(DateOfBirth) As MONTH,
Day(DateOfBirth) As DAY
From Customers;

-- Datediff - Difference between Dates- returns 
Select concat(FirstName," ",LastName)AS FullName, DateOfBirth, 
datediff(Current_Date(),DateOfBirth)/365 As Age
From Customers;

SELECT CONCAT(FirstName, ' ', LastName) AS FullName,
       DateOfBirth,
       FLOOR(DATEDIFF(CURRENT_DATE(), DateOfBirth) / 365) AS Age
FROM Customers;

SELECT CONCAT(FirstName, ' ', LastName) AS FullName,
       DateOfBirth,
       YEAR(CURRENT_DATE()) - YEAR(DateOfBirth) AS Age
FROM Customers;


-- DATE_ADD() - Add Days - Adds interval to date
Select concat(FirstName, " ", LastName) AS FullName,
AccountCreationDate,date_add(AccountCreationDate,interval 1 Year)
From Customers;


-- DATE_SUB() - 
 


SELECT* FROM Accounts;
SELECT* FROM Branches;
SELECT* FROM Customers;
SELECT* FROM Loans;
SELECT* FROM Transactions;



-- Practice 10-08-2026 
-- (1) Display the CustomerID, FirstName and Email of customers whose AccountCreationDate is after 1-Jan-2025.
select CustomerID, FirstName, Email
From Customers
where AccountCreationDate > '2025-01-01';

-- (2) Display all Savings accounts having balance greater than ₹20,000.
Select * From Accounts
Where AccountType = 'Savings' AND Balance >20000;

-- (3)Display customers whose Phone number is NOT NULL.
Select * From Customers 
Where Phone IS NOT NULL;

-- (4)Display distinct Account Types available in the Accounts table.
Select DISTINCT AccountType
From Accounts;

-- (5) Display customers whose FirstName starts with 'R'
Select * From Customers
Where FirstName Like  'R%';

-- (6)Display accounts having Balance between ₹20,000 and ₹60,000.
Select *  From Accounts 
Where Balance BETWEEN 20000 AND 60000;

-- (7)Display all Deposit transactions whose amount is greater than ₹3000.
Select * From Transactions 
Where TransactionType = 'Deposit' AND Amount >3000;

-- (8)Display customers whose CustomerID is IN (101,103,106,109) 
Select * From Customers 
Where CustomerID IN (101, 103, 106, 109);

-- (9)Display first 5 customers ordered by CustomerID.
Select * From Customers
ORDER By CustomerID
Limit 5;

-- (10)Display customers after skipping first 3 records.
Select * From Customers 
LIMIT 10 OFFSET 3;


-- (11)Display Savings accounts having balance between ₹20,000 and ₹80,000.
Select * From Accounts 
Where AccountType = 'Savings' AND Balance Between 20000 AND 80000;

-- (12)Display customer names whose phone number is NULL and account was created after 2025-01-01.
Select FirstName, LastName 
From Customers
Where Phone IS NULL AND AccountCreationDate >2025-01-01;

-- (13)Display all customers whose FirstName starts with 'A' OR LastName starts with 'S'.
Select * From Customers 
Where FirstName LIKE 'A%' 
OR LastName LIKE 'S%';

-- (14)Display all accounts whose AccountType is Savings or Salary and balance is greater than ₹10,000.
Select * From Accounts 
Where AccountType IN ('Savings', 'Salary')
AND Balance >10000; 

-- (15)Display customers whose CustomerID is IN (101,102,105,109) and phone number is not NULL.
Select * From Customers
Where CustomerID IN (101, 102, 105, 109) AND Phone IS NOT NULL;

Select * From Customers
Where CustomerID IN (101, 102, 105, 109) AND Phone IS NULL;

-- (16)Display transactions whose Amount is between ₹2,000 and ₹8,000 and TransactionType is Deposit.
Select * From Transactions
Where TransactionType = 'Deposit' And Amount Between 1000 and 30000;

-- (17)Display distinct BranchIDs from Accounts where balance is greater than ₹30,000.
Select DISTINCT BranchID 
From Accounts 
Where Balance > 30000;

-- (18)Display customers whose email contains gmail and first name ends with a.
Select * From Customers
Where Email LIKE '%gmail%' and 
FirstName LIKE '%a';

-- (19)Display customers whose DateOfBirth is between 1995 and 2000.
Select * From Customers 
Where DateOfBirth Between '1995-01-01' AND '2000-12-31';

-- (20)Display first 3 Savings accounts having balance greater than ₹25,000.
Select * From Accounts
Where AccountType = 'Savings' AND Balance > 25000
LIMIT 3;

-- (21)Display customers whose FirstName starts with &#39;P&#39; and Phone IS NULL.
Select * From Customers
Where FirstName LIKE 'P%' AND Phone IS NULL;

-- (22)Display accounts whose balance is NOT BETWEEN ₹20,000 and ₹50,000.
Select * From Accounts
Where Balance NOT BETWEEN 20000 And 50000;

-- (23)Display customers whose CustomerID is NOT IN (101,102,103).
Select * From Customers
Where CustomerID NOT IN (101, 102, 103);

-- (24)Display transactions that are Withdrawal and amount is less than ₹5000.
Select * From Transactions
Where TransactionType = 'Withdrawal' AND Amount < 5000;

-- (25)Display customers whose email ends with gmail.com and phone number is available.
Select * From Customers
Where Email LIKE '%gmail.com' AND Phone IS NOT NULL;

-- (26)Display distinct transaction types whose amount is greater than ₹5000.
Select Distinct TransactionType
From Transactions
Where Amount > 5000;

-- (27)Display all Savings accounts belonging to Branch 1 or Branch 3.
Select * From Accounts
Where AccountType = 'Savings'
AND BranchID IN (1, 3);

-- (28)Display customers whose first name contains 'ha' and DateOfBirth is after 1997.
Select * From Customers
Where FirstName Like '%ha' AND DateOfBirth > '1997-12-31';

-- (29)Display accounts whose balance is greater than ₹30,000 but less than ₹80,000.
Select * From Accounts
Where Balance > 30000 AND Balance <80000;

-- (30)Display first 4 Deposit transactions after skipping first 2 deposits.
Select * From Transactions
Where TransactionType = 'Deposit' 
Order BY TransactionID 
LIMIT 4 Offset 2;

-- (31)Display customer names whose phone number is NULL OR email starts with s.
Select FirstName, LastName 
From Customers
Where Phone IS NULL OR Email Like 's%';

-- (32)Display Savings accounts having balance greater than ₹10,000 AND belonging to Branch 1.
Select *
From Accounts
Where AccountType = 'Savings' 
And Balance > 10000
And BranchID = 1;

-- (33)Display Current accounts having balance between ₹40,000 and ₹1,00,000.
Select * From Accounts
Where AccountType = 'Current'
And Balance Between 40000 and 100000;

-- (34)Display customers whose last name starts with S and were created after 2024.
Select * From Customers
Where LastName Like 'S%' AND 
AccountCreationDate > '2024-01-01';

-- (35)Display transactions whose amount is IN (2000,3000,5000,7000).
Select * From Transactions
Where Amount IN (2000,3000,5000,7000);

-- (36)Display customers whose first name starts with R or P, phone number is available and CustomerID is greater than 103.
Select * From Customers 
Where (FirstName Like 'R%' OR FirstName LIKE 'P%')
And Phone IS NOT NULL
ANd CustomerID >103;

-- (37)Display distinct balances greater than ₹15,000.
Select Distinct Balance
From Accounts
Where Balance > 15000;

-- (38)Display all accounts except Savings accounts having balance above ₹25,000.
Select * From Accounts
Where AccountType <> 'Savings' And Balance > 25000;

-- (39)Display customers whose email contains gmail but phone number is missing.
Select * From Customers
Where Email LIKE '%gmail%'
AND Phone IS NOT NULL;

-- (40)Display accounts whose balance is between ₹15,000 and ₹90,000 and AccountType is not Salary.
Select * From Accounts 
Where Balance Between 15000 and 90000
And AccountType <> 'Salary';

-- (41)Display first 5 customers whose FirstName starts with A or R, ordered by CustomerID.
Select * From Customers 
Where FirstName Like 'A%' OR FirstName LIKE 'R%'
Order bY CustomerID
Limit 5;

-- (42)Display Savings and Salary Accounts whose balance is greater than 15,000 and less than 60000
Select * From Accounts 
Where AccountType = 'Savings' And Balance > 15000 
And Balance < 60000;

-- (43)Display customers whose CustomerID is IN (101,103,105,107,109) and DateOfBirth is between 1994and 2000.
Select * From Customers 
Where CustomerID IN (101,103,105,107,109)
AND DateOfBirth between '1994-01-01'AND '2000-12-31'; 

-- (44)Display transactions whose amount is greater than ₹2000 but less than ₹8000 and TransactionType is not Withdrawal.
Select * From transactions
Where Amount >2000 And Amount <8000
AND TransactionType <> 'Withdrawal';

-- (45)Display customers whose phone number is NULL or FirstName 'an'
Select * from Customers 
Where Phone IS NULL 
OR FirstName LIKE '%an%';

-- (46)Display distinct AccountTypes where balance is greater than ₹20,000.
Select Distinct AccountType
From Accounts 
Where Balance > 20000;

-- (47)Display customers after skipping first 2 records and display only the next 4 records.
Select * From Customers
ORDER BY CustomerID
LIMIT 4 OFFSET 2;

-- (48)Display customers whose last name ends with 'ma' and email contains gmail.
Select * From Customers
Where LastName LIKE '%ma'
And email LIKE '%gmail%';

-- (49)Display accounts whose BranchID is IN (1,2) and balance is between ₹20,000 and ₹70,000.
Select * From Accounts 
Where BranchID IN (1,2)
AND Balance BETWEEN 20000 AND 70000;

-- (50)Display all customers whose first name starts with S, phone number is not NULL, and account was created between 1-Jan-2025 and 31-Dec-2025.
Select * From Customers
WHere FirstName LIKE 'S%'
And Phone IS NOT NULL 
And AccountCreationDate BETWEEN '2025-01-01' and '2025-12-31';

-- (1)Display all customers whose first name starts with &#39;R&#39; or &#39;S&#39; but whose phone number is NULL.
Select * From Customers
Where FIrstName Like 'R%' OR FirstName Like 'S%'
And Phone IS NULL;

-- (2)Display all accounts that are not Savings accounts and have a balance greater than ₹30,000.
Select * From Accounts 
Where AccountType <> 'Savings'
AND Balance > 30000;

-- (3)Display customers whose CustomerID is not 101, 102, or 103.
Select * From Customers 
Where CustomerID NOT IN (101, 102, 103);


-- (4)Display customers whose email does not end with &quot;gmail.com&quot;.
Select  * From Customers 
Where Email NOT LIKE '%gmail,com';

-- (5)Display accounts whose balance is not between ₹20,000 and ₹50,000.
Select * From Accounts 
Where balance not BETWEEN 20000 AND 50000;

-- (6)Display all transactions except Deposit transactions.
Select * From transactions
Where TransactionType <> 'Deposit';

-- (7)Display customers whose first name contains the letter 'a' but does not start with 'A'.
Select * From Customers 
Where FirstName Like '%a%' AND FirstName NOT Like '%A%';



SELECT* FROM Accounts;
SELECT* FROM Branches;
SELECT* FROM Customers;
SELECT* FROM Loans;
SELECT* FROM Transactions;