-- Initial SQLite setup
.open fittrackpro.db
.mode table

-- Enable foreign key support
PRAGMA foreign_keys = ON;
-- User Management Queries

-- 1. Retrieve all members
SELECT member_id, first_name, last_name, email, join_date
FROM   members; 

-- 2. Update a member's contact information
-- UPDATE members
-- SET email = 'emily.jones.updated@email.com', phone_number = '555-9876'
-- WHERE member_id = 5;
-----------------   UNCOMMENT -------------------------------

-- 3. COUNT total number of members
SELECT COUNT(*) AS 'Total number of members'
FROM   members; 

-- 4. Find member with the most class registrations
SELECT 
    members.member_id, 
    first_name, 
    last_name, 
    COUNT(attendance_status) AS registration_count
FROM members
RIGHT JOIN class_attendance ON members.member_id = class_attendance.member_id
GROUP BY members.member_id
HAVING registration_count = (
    SELECT COUNT(attendance_status) AS registration_count
    FROM class_attendance
    GROUP BY member_id
    ORDER BY registration_count DESC
    LIMIT 1
);

-- 5. Find member with the least class registrations
SELECT 
    members.member_id, 
    first_name, 
    last_name, 
    COUNT(attendance_status) AS registration_count
FROM members
LEFT JOIN class_attendance ON members.member_id = class_attendance.member_id
GROUP BY members.member_id
HAVING registration_count = (
    SELECT COUNT(attendance_status) AS registration_count
    FROM members
    LEFT JOIN class_attendance ON members.member_id = class_attendance.member_id
    GROUP BY members.member_id
    ORDER BY registration_count ASC
    LIMIT 1
);

-- 6. Calculate the percentage of members who have attended at least one class
-- TODO: Write a query to calculate the percentage of members who have attended at least one class

SELECT COUNT(DISTINCT( class_attendance.member_id )) * 1.0/ 
              COUNT(members.member_id) * 1.0 * 100
                AS 'percentage of members attended at least 1 class'
FROM   members
       LEFT JOIN class_attendance
         ON class_attendance.member_id = members.member_id;

