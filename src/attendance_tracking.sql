-- Initial SQLite setup
.open fittrackpro.db
.mode table

-- Enable foreign key support
PRAGMA foreign_keys = ON;
-- Attendance Tracking Queries

-- 1. Record a member's gym visit
INSERT INTO attendance (member_id, location_id, check_in_time)
VALUES (7, 1, datetime('now'));

-- 2. Retrieve a member's attendance history
SELECT 
    strftime('%F', check_in_time)  AS visit_date,
    strftime('%T', check_in_time)  AS check_in_time,
    strftime('%T', check_out_time) AS check_out_time
FROM  attendance
WHERE member_id = 5; 

-- 3. Find the busiest day of the week based on gym visits
SELECT 
    CASE CAST(strftime('%w', check_in_time) AS integer)
    WHEN 0 THEN 'Sunday'
    WHEN 1 THEN 'Monday'
    WHEN 2 THEN 'Tuesday'
    WHEN 3 THEN 'Wednesday'
    WHEN 4 THEN 'Thursday'
    when 5 THEN 'Friday'
    ELSE 'Saturday' END AS day_of_week, 
    COUNT(*) AS visit_count
FROM  attendance
GROUP BY day_of_week
ORDER BY visit_count DESC
LIMIT 1;

-- 4. Calculate the average daily attendance for each location
SELECT name AS location_name, COUNT(DISTINCT(strftime('%F',check_in_time))) * 1.0 /
    (julianday('now') - julianday(MIN(check_in_time))) AS avg_daily_attendance
FROM attendance
JOIN locations ON locations.location_id = attendance.location_id
GROUP BY location_name;
