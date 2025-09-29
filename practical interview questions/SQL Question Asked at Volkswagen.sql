--- PROBLEM STATEMENT ---

/* WRITE AN SQL QUERY TO TRANSFORM DATA SO THAT EACH FRUIT BECOMES ITS OWN 
COLUMNS (Apple, Mango, Orange, Guava, Cherry) AND THE VALUES SHOULD BE 
Yes (if the person has that fruit) / OTHERWISE  No. */

--use database --
use INTERVIEW_PRACTICALS

-- create table ---
CREATE TABLE baskets (
    Person VARCHAR(10),
    Basket VARCHAR(100)
);
INSERT INTO baskets (Person, Basket) VALUES
('A', 'Apple,Mango,Orange'),
('B', 'Apple'),
('C', 'Guava,Cherry'),
('D', 'Mango,Cherry,Orange');

-- check table --
SELECT * FROM baskets;

-- SOLUTION - ( USING LIKE ) --
SELECT Person,
CASE WHEN Basket like '%Apple%' THEN 'Yes' ELSE 'No' END as Apple,
CASE WHEN Basket like '%Mango%' THEN 'Yes' ELSE 'No' END as Mango,
CASE WHEN Basket like '%Orange%' THEN 'Yes' ELSE 'No' END as Orange,
CASE WHEN Basket like '%Guava%' THEN 'Yes' ELSE 'No' END as Guava,
CASE WHEN Basket like '%Cherry%' THEN 'Yes' ELSE 'No' END as Cherry
FROM baskets;
