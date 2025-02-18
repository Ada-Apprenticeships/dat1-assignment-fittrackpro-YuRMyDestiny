-- Initial SQLite setup
.open fittrackpro.db
.mode table

-- Enable foreign key support
PRAGMA foreign_keys = ON;
-- Equipment Management Queries

-- 1. Find equipment due for maintenance
-- TODO: Write a query to find equipment due for maintenance
SELECT equipment_id,
       NAME,
       next_maintenance_date
FROM   equipment
WHERE  julianday(next_maintenance_date) - julianday('now') < 30; 
---------   refactor?   ---------

-- 2. Count equipment types in stock
-- TODO: Write a query to count equipment types in stock
SELECT type     AS equipment_type,
       COUNT(*) AS count
FROM   equipment
GROUP  BY type; 

-- 3. Calculate average age of equipment by type (in days)
-- TODO: Write a query to calculate average age of equipment by type (in days)
SELECT    type AS equipment_type, 
          CAST(AVG(julianday('now') - julianday(purchase_date)) AS INT) AS avg_age_days
FROM      equipment
GROUP BY  type;
---------- check accuracy! ---------------