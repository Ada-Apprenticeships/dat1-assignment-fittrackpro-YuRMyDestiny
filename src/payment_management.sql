-- Initial SQLite setup
.open fittrackpro.db
.mode table

-- Enable foreign key support
PRAGMA foreign_keys = ON;
-- Payment Management Queries

-- 1. Record a payment for a membership
-- INSERT INTO payments (member_id, amount, payment_date, payment_method, payment_type)
-- VALUES (11, 50.00, datetime('now'), 'Credit Card', 'Monthly membership fee');
----------------- UNCOMMENT THIS WHEN SUBMIT ------------------------

-- 2. Calculate total revenue from membership fees for each month of the last year
SELECT strftime('%m', payment_date) AS month, SUM(amount) as total_revenue
FROM payments 
WHERE CAST(strftime('%Y', DATE('now')) AS INT) - CAST(strftime('%Y', payment_date) AS INT) = 1
GROUP BY month;
------ refactor? ------

-- 3. Find all day pass purchases
SELECT payment_id, amount, payment_date, payment_method
FROM payments
WHERE payment_type = 'Day pass';