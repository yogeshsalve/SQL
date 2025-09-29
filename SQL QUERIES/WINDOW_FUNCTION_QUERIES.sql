--- WINDOW FUNCTION QUERIES ---

CREATE DATABASE SQLPRACTICE;
USE SQLPRACTICE;

CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    DepartmentID INT,
    JobTitle NVARCHAR(50),
    Salary DECIMAL(10,2),
    Bonus DECIMAL(10,2),
    HireDate DATE,
    City NVARCHAR(50)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10,2)
);

CREATE TABLE Product (
    ProductID INT PRIMARY KEY,
    CategoryID INT,
    ProductName NVARCHAR(50),
    Revenue DECIMAL(10,2)
);

INSERT INTO Employee (EmployeeID, FirstName, LastName, DepartmentID, JobTitle, Salary, Bonus, HireDate, City) VALUES
(1, 'John', 'Doe', 101, 'Software Engineer', 60000.00, 5000.00, '2020-01-15', 'New York'),
(2, 'Jane', 'Smith', 102, 'HR Manager', 75000.00, 7000.00, '2019-03-22', 'Los Angeles'),
(3, 'Michael', 'Brown', 103, 'Sales Executive', 55000.00, 3000.00, '2021-06-10', 'Chicago'),
(4, 'Emily', 'Davis', 101, 'Software Engineer', 62000.00, 4500.00, '2020-09-05', 'San Francisco'),
(5, 'Daniel', 'Wilson', 104, 'Finance Analyst', 68000.00, 4000.00, '2018-11-12', 'Boston'),
(6, 'Olivia', 'Taylor', 105, 'Marketing Specialist', 59000.00, 3500.00, '2021-02-28', 'Seattle'),
(7, 'James', 'Anderson', 103, 'Sales Executive', 57000.00, 3200.00, '2019-08-19', 'Miami'),
(8, 'Sophia', 'Thomas', 102, 'HR Coordinator', 50000.00, 2500.00, '2022-01-03', 'Dallas'),
(9, 'William', 'Moore', 104, 'Finance Manager', 80000.00, 6000.00, '2017-05-21', 'Denver'),
(10, 'Ava', 'Jackson', 105, 'Marketing Manager', 72000.00, 5500.00, '2020-07-17', 'Atlanta');


INSERT INTO Product (ProductID, CategoryID, ProductName, Revenue) VALUES
(1, 301, 'Laptop', 120000.00),
(2, 302, 'Smartphone', 90000.00),
(3, 303, 'Headphones', 15000.00),
(4, 301, 'Desktop PC', 80000.00),
(5, 304, 'Office Chair', 10000.00),
(6, 302, 'Tablet', 25000.00),
(7, 303, 'Keyboard', 5000.00),
(8, 304, 'Desk Lamp', 3000.00),
(9, 301, 'Gaming Laptop', 150000.00),
(10, 302, 'Smartwatch', 20000.00);

SELECT * FROM Employee;
SELECT * FROM Orders;
SELECT * FROM Product;

