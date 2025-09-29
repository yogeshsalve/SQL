--- CREATE DATABASE
create database talendcloud

--- USE DATABASE
use talendcloud

--- create a customer table 
CREATE TABLE customer (
    customer_id INT PRIMARY KEY,
    first_name NVARCHAR(50) NOT NULL,
    last_name NVARCHAR(50) NOT NULL,
    country NVARCHAR(50),
    email NVARCHAR(100) UNIQUE,
    phone_number VARCHAR(20),
    registration_date DATE
);

INSERT INTO customer (customer_id, first_name, last_name, country, email, phone_number, registration_date)
VALUES
(1, 'John', 'Doe', 'USA', 'john.doe@email.com', '123-456-7890', '2024-01-15'),
(2, 'Jane', 'Smith', 'Canada', 'jane.smith@email.ca', '987-654-3210', '2024-02-20'),
(3, 'Akira', 'Tanaka', 'Japan', 'akira.t@email.jp', '555-123-4567', '2024-03-10'),
(4, 'Maria', 'Garcia', 'Spain', 'maria.g@email.es', '666-987-6543', '2024-04-05'),
(5, 'Mohammed', 'Khan', 'India', 'mo.khan@email.in', '777-111-2233', '2024-05-18'),
(6, 'Li', 'Wei', 'China', 'li.w@email.cn', '888-333-4455', '2024-06-25'),
(7, 'Anna', 'Kovalenko', 'Ukraine', 'anna.k@email.ua', '999-555-6677', '2024-07-30'),
(8, 'Carlos', 'Lopez', 'Mexico', 'carlos.l@email.mx', '444-777-8899', '2024-08-12'),
(9, 'Fatima', 'Ahmad', 'Egypt', 'fatima.a@email.eg', '222-888-9900', '2024-09-01'),
(10, 'Oliver', 'Brown', 'Australia', 'oliver.b@email.au', '111-222-3344', '2024-09-22');

SELECT * FROM customer;

/* A function is a stored subroutine in SQL that accepts parameters, 
performs an action, and returns a single value. It can be used in SELECT, WHERE, 
and HAVING clauses. */

--- SINGLE ROW FUNCTIONS :[ STRING, NUMERIC, DATE, NULL ]
--- MULTIROW FUNCTIONS : [AGGREGATE FUNCTIONS , WINDOWS FUNCTIONS ]


--- STRING FUNCTIONS : [MANIPULATION, CALCULATION, STRING EXTRACTION ] 

--CONCAT() : Combine multiple strings into one 
SELECT first_name, last_name, 
concat(first_name, ' ', last_name) as full_name 
from customer;

-- UPPER() & LOWER()
SELECT UPPER(first_name) AS UPPERCASE,
LOWER(last_name) AS LOWERCASE
FROM customer;

--- TRIM() : 










