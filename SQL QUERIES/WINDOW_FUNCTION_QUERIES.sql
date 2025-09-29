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


--A. ROW_NUMBER() – Unique row numbering

--1. Assign row numbers to all employees ordered by salary descending.
SELECT *,
ROW_NUMBER() OVER(ORDER BY Salary DESC) AS Rank
FROM Employee;

--2. Assign row numbers partitioned by department, ordered by salary descending.
SELECT *,
ROW_NUMBER() OVER(PARTITION BY DepartmentID ORDER BY Salary DESC) AS Rank
FROM Employee;

--3. Assign row numbers partitioned by job title, ordered by hire date ascending.
SELECT *,
ROW_NUMBER() OVER(PARTITION BY JobTitle ORDER BY HireDate) AS Rank
FROM Employee;

--4. Assign row numbers to employees ordered by last name ascending.
SELECT *,
ROW_NUMBER() OVER(ORDER BY LastName) AS Rank
FROM Employee;

--5. Assign row numbers partitioned by city, ordered by salary descending.
SELECT *,
ROW_NUMBER() OVER(PARTITION BY City ORDER BY Salary DESC) AS Rank
FROM Employee;

--6. Find the first employee per department using ROW_NUMBER().
WITH CTE AS(
SELECT *,
ROW_NUMBER() OVER(PARTITION BY DepartmentID ORDER BY HIreDate DESC) AS Rank
FROM Employee) 

SELECT * FROM CTE 
WHERE Rank =1;

--7. Find the top 3 salaries per department.
with cte as (
SELECT *,
ROW_NUMBER() OVER(PARTITION BY DepartmentID ORDER BY Salary DESC) AS Rank
FROM Employee) 

select * from cte
WHERE Rank <=3;

--8. Delete duplicate rows using ROW_NUMBER().
with cte as (
SELECT *,
ROW_NUMBER() OVER(PARTITION BY FirstName, LastName ORDER BY EmployeeID) AS Rank
FROM Employee)

DELETE FROM CTE WHERE Rank > 1;

--Find 2nd highest salary using ROW_NUMBER().

--Assign row numbers ignoring NULL salaries.

--B. RANK() – Handles ties, leaves gaps

--Rank employees by salary descending.

--Rank employees by department and salary descending.

--Rank sales orders by total amount per customer.

--Find top 3 salaries per department using RANK().

/*Find employees tied at the highest salary.

Rank employees by hire date ascending per department.

Rank products by revenue per category.

Rank customers by number of orders.

Find gaps in ranking due to ties.

Rank employees by bonus descending, show ties.

C. DENSE_RANK() – Handles ties, no gaps

Dense rank employees by salary descending.

Dense rank employees per department by salary descending.

Dense rank products per category by sales.

Find 2nd highest salary using DENSE_RANK().

Find top 3 performers per department using DENSE_RANK().

Dense rank employees by hire date ascending.

Dense rank customers by total purchase.

Find rank of products with same revenue.

Compare RANK() and DENSE_RANK() results.

Dense rank orders by order date per customer.

D. NTILE() – Divide into buckets

Divide employees into 4 quartiles by salary.

Divide employees into 10 percentiles by salary.

NTILE(3) by department, ordered by hire date.

NTILE(5) on order total per customer.

Divide products into 5 revenue buckets.

NTILE(2) for high vs low salary employees.

NTILE(4) on sales per region.

NTILE(3) on employee performance score.

NTILE(6) for customers by total orders.

Compare NTILE buckets across departments.

E. LAG() – Access previous row

Show previous salary for each employee.

Previous salary per department.

Previous order amount per customer.

Difference between current and previous salary.

Previous hire date per department.

Previous sale per product category.

Detect salary decrease using LAG().

Previous quarter revenue per region.

Previous employee bonus per department.

Find consecutive salary increases using LAG().

F. LEAD() – Access next row

Show next salary for each employee.

Next hire date per department.

Next order amount per customer.

Difference between next and current salary.

Next sale per product category.

Next bonus per employee.

Predict salary change using LEAD().

Next quarter revenue per region.

Next promotion date per employee.

Compare current and next sales order.

G. FIRST_VALUE() / LAST_VALUE()

First hired employee per department.

Last hired employee per department.

First salary in department.

Last salary in department.

First order per customer.

Last order per customer.

First product sold per category.

Last product sold per category.

First bonus awarded per employee.

Last bonus awarded per employee.

H. SUM() as window function

Running total of salaries.

Running total of sales per customer.

Running total of order quantity per product.

Total salary per department (window).

Total bonus per department.

Running total of revenue per region.

Cumulative salary per hire date.

Cumulative orders per customer.

Cumulative sales per month.

Total salary per department excluding current row.

I. AVG() as window function

Average salary per department (window).

Moving average of salary per hire date.

Average sales per product category.

Average order amount per customer.

Rolling 3-month average revenue per region.

Average bonus per department.

Moving average of employee performance score.

Average salary excluding current row.

Average salary per job title.

Rolling average of orders per customer.

J. MIN() / MAX() as window function

Max salary per department.

Min salary per department.

Max order per customer.

Min order per customer.

Max bonus per department.

Min bonus per department.

Max sale per product category.

Min sale per product category.

Max hire date per department.

Min hire date per department. */


