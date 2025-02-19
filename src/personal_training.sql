-- Initial SQLite setup
.open fittrackpro.db
.mode table

-- Enable foreign key support
PRAGMA foreign_keys = ON;
-- Personal Training Queries

-- 1. List all personal training sessions for a specific trainer
SELECT session_id,
       CONCAT(staff.first_name, ' ', staff.last_name) AS member_name,
       session_date,
       start_time,
       end_time
FROM   staff
       JOIN personal_training_sessions
            ON staff.staff_id = personal_training_sessions.staff_id
WHERE  member_name = 'Ivy Irwin'; 
