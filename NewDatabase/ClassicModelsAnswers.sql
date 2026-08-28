SELECT * From Customers;
SELECT * From Employees;
SELECT * From Offices;
SELECT * From Orderdetails;
SELECT * From Orders;
SELECT * From Payments;
SELECT * From Productlines;
SELECT * From Products;


-- Question Set 1:
-- 1. List all employees (first name, last name, job title) who are 'Sales Rep's.
SELECT FirstName, LastName, JobTitle
From Employees 
Where JobTitle = 'Sales Rep';

-- 2. Find all products that belong to the 'Classic Cars' product line.
SELECT * From Products 
Where ProductLine = 'Classic Cars';

-- 3. Get a list of all customers from 'USA'.
SELECT CustomerName 
From Customers 
Where Country = 'USA';

-- 4. Show all orders that were shipped after the required date.
SELECT * From Orders
Where ShippedDate > RequiredDate;

-- 5. Find the names of all products that have a quantity in stock less than 1000.
SELECT ProductName, QuantityInStock
From PRoducts
Where QuantityInStock < 1000;

-- Question Set 2:
-- 1. For each customer, list their customer name and the name of their sales representative employee.
SELECT C.CustomerName, E.FirstName, E.LastName
From Customers C
INNER JOIN Employees E
ON C.SalesRepEmployeeNumber = E.EmployeeNumber;

-- 2. Calculate the total number of orders placed by each customer. 
-- Show the customer name and the order count.
SELECT C.CustomerNumber,C.CustomerName, COUNT(O.OrderNumber) AS NoofOrders
From Customers C
INNER JOIN Orders O
ON C.CustomerNumber = O.CustomerNumber
GROUP BY C.CustomerNumber, C.CustomerName;

-- 3. Find the total payment amount received from each customer. 
-- Show the customer name and the total amount.
SELECT C.CustomerName, SUM(P.Amount) AS TotalAmount
From Customers C
INNER JOIN Payments P
ON C.CustomerNumber = P.CustomerNumber
GROUP BY C.CustomerNumber, C.CustomerName;

-- 4. List all products (product name, product line) that have never been ordered. 
-- (Hint: Use a LEFT JOIN and check for NULL).
SELECT ProductName, ProductLine
FROM Products P
LEFT JOIN OrderDetails OD
ON P.ProductCode = OD.ProductCode
Where OD.ProductCode IS NULL;

-- 5. Show the product name and the total quantity ordered for each product, 
-- but only for products where the total quantity ordered is greater than 1000.
SELECT P.ProductName, SUM(QuantityOrdered) As TotalQuantity
From Products P
INNER JOIN OrderDetails OD
ON P.ProductCode = OD.ProductCode
Group BY P.ProductCode, P.ProductName
Having TotalQuantity > 1000;

-- Question Set 3:
-- 1.Find the top 5 most expensive products (based on buyPrice).
SELECT * From Products
ORDER BY BuyPrice DESC
LIMIT 5;

-- 2. List all orders that are currently 'On Hold'.
SELECT *
FROM orders
WHERE status = 'On Hold';

-- 3. Find all payments made in the year 2004.
SELECT * From Payments 
Where Year(PaymentDate ) = '2004';

-- 4. Show the three office cities that have the most employees.
SELECT O.City, COUNT(E.EmployeeNumber) As EmployeeCount
From Offices O
INNER JOIN Employees E
ON E.OfficeCode = O.OfficeCode
GROUP BY O.City
ORDER BY EmployeeCount DESC
LIMIT 3;

-- 5. Get the list of employees who report to someone else (i.e., they have a reportsTo value). 
-- Show their name and their manager's name.
SELECT CONCAT(E.firstName, ' ', E.lastName) AS EmployeeName,
    CONCAT(M.firstName, ' ', M.lastName) AS ManagerName
FROM employees E
INNER JOIN employees M
ON E.reportsTo = M.employeeNumber;

-- Question Set 4:
-- 1. For each order, list the order number, customer name, 
-- and the name of the sales rep responsible for that customer.
SELECT 
    O.orderNumber,
    C.customerName,
    ( SELECT CONCAT(E.firstName, ' ', E.lastName)
        FROM employees E
        WHERE E.employeeNumber = C.salesRepEmployeeNumber) AS SalesRepName
FROM orders O
INNER JOIN customers C
ON O.customerNumber = C.customerNumber;

-- 2. Find the customer who has made the single largest payment.
SELECT C.CustomerNumber, C.CustomerName, P.amount
From Customers C
INNER JOIN Payments P
ON C.CustomerNumber = P.CustomerNumber
ORDER BY P.Amount DESC
LIMIT 1;

-- 3. Show the product line and the average buy price for products within that product line, 
-- but only show product lines whose average buy price is above $50.
SELECT ProductLine, AVG(BuyPrice) AS AVGPrice
From Products
GROUP BY ProductLine
Having AVGPrice > 50;

-- 4. List all products that were ordered in 2005. 
-- Show the product code, product name, and the total quantity ordered in that year.
SELECT 









