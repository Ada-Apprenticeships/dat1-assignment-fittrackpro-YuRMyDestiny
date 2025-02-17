-- Initial SQLite setup
.open fittrackpro.db
.mode table
.timer on
-- Enable foreign key support
PRAGMA foreign_keys = ON;

-- Class Scheduling Queries

-- 1. List all classes with their instructors
-- TODO: Write a query to list all classes with their instructors
-- SELECT class_schedule.class_id, name AS class_name, first_name AS instructor_name
-- FROM class_schedule
-- JOIN staff ON class_schedule.staff_id = staff.staff_id
-- JOIN classes ON class_schedule.class_id = classes.class_id;
------   ?  first + LAST NAME ?   ----------------

-- 2. Find available classes for a specific date
-- TODO: Write a query to find available classes for a specific date
-- SELECT classes.class_id, name, start_time, end_time, available_spots
-- FROM class_schedule
-- JOIN JOIN classes ON class_schedule.class_id = classes.class_id;
-------        ??????????????        ----------------

-- 3. Register a member for a class
-- TODO: Write a query to register a member for a class

-- INSERT INTO class_attendance (member_id, schedule_id, attendance_status)
-- SELECT 11, schedule_id, 'Registered'
-- FROM class_schedule
-- WHERE class_id = 3
-- AND start_time LIKE '2025-02-01%';


-- 4. Cancel a class registration
-- TODO: Write a query to cancel a class registration
-- DELETE FROM class_attendance 
-- WHERE member_id = 2
-- AND schedule_id = 7;

-- 5. List top 5 most popular classes
-- TODO: Write a query to list top 5 most popular classes
SELECT classes.class_id, name AS class_name, SUM(attendance_status = 'Registered') AS registration_count
FROM class_schedule
JOIN class_attendance ON class_schedule.schedule_id = class_attendance.schedule_id
JOIN classes ON class_schedule.class_id = classes.class_id
GROUP BY classes.class_id
ORDER BY registration_count DESC 
LIMIT 5; ---- OR 3?



-- 6. Calculate average number of classes per member
-- TODO: Write a query to calculate average number of classes per member
-------- ????????? ------------------