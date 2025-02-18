-- Initial SQLite setup
.open fittrackpro.db
.mode table

-- Enable foreign key support
PRAGMA foreign_keys = ON;
-- Staff Management Queries

-- 1. List all staff members by role
-- TODO: Write a query to list all staff members by role
SELECT staff_id, first_name, last_name, position AS role
FROM staff;

-- 2. Find trainers with one or more personal training session in the next 30 days
-- TODO: Write a query to find trainers with one or more personal training session in the next 30 days
SELECT staff.staff_id AS trainer_id, first_name AS trainer_name, COUNT(start_time) AS session_count
FROM staff
JOIN personal_training_sessions ON staff.staff_id = personal_training_sessions.staff_id
WHERE position = 'Trainer'
AND julianday(session_date) - julianday('now') BETWEEN 0 AND 30
GROUP BY trainer_id;
-------  first and last name? / include today? -------------