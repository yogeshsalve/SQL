/* PROBLEM STATEMENT
WRITE A SQL QUERY TO REPORT CAPITAL GAIN / LOSS FOR EACH STOCK 
*/


-- CREATE TABLE --
CREATE TABLE stocks (
    id INT IDENTITY(1,1) PRIMARY KEY,
    stock_name VARCHAR(50),
    operation VARCHAR(4) CHECK (operation IN ('Buy', 'Sell')),
    operation_day INT,
    price INT
);

INSERT INTO stocks (stock_name, operation, operation_day, price) VALUES
('Apple', 'Buy', 1, 1500),
('Tesla', 'Buy', 2, 1200),
('Apple', 'Sell', 5, 5000),
('Samsung', 'Buy', 17, 20000),
('Tesla', 'Sell', 3, 1300),
('Tesla', 'Buy', 4, 1500),
('Tesla', 'Sell', 5, 1100),
('Tesla', 'Buy', 6, 1400),
('Samsung', 'Sell', 29, 15000),
('Tesla', 'Sell', 10, 1200); 


SELECT * FROM stocks;

SELECT stock_name
FROM stocks
group by stock_name;

--- METHOS 01 - USING ROW_NUMBER() --

-- STEP 01 - GIVE ROW NUMBER SAPARATELY TO BUY AND SELL TRANSACTIONS --

WITH ordered AS (
    SELECT 
        stock_name, 
        operation, 
        operation_day, 
        price, -- Included price to use it later
        ROW_NUMBER() OVER(PARTITION BY stock_name, operation ORDER BY operation_day) as rn 
    FROM stocks
), 
paired AS (
    SELECT 
        b.stock_name,
        -- Calculate the gain/loss: Sell Price - Buy Price
        s.price - b.price AS gain_loss,
        b.operation_day AS buy_day,
        s.operation_day AS sell_day
    FROM ordered b
    JOIN ordered s 
        ON b.stock_name = s.stock_name
        AND b.rn = s.rn -- Assumes trades occur in perfect (Buy 1, Sell 1), (Buy 2, Sell 2) order
        AND b.operation = 'Buy'
        AND s.operation = 'Sell'
) -- Removed the erroneous extra parenthesis here
SELECT stock_name, gain_loss FROM paired;