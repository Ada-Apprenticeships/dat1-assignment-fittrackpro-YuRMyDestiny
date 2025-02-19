-- Initial SQLite setup
.open fittrackpro.db
.mode table


-- Enable foreign key support
PRAGMA foreign_keys = ON;


-- Membership Management Queries

-- 1. List all active memberships
-- TODO: Write a query to list all active memberships
SELECT members.member_id,
       first_name,
       last_name,
       type AS membership_type,
       join_date
FROM   members
        JOIN memberships
            ON members.member_id = memberships.member_id
WHERE  status = 'Active'; 


-- 2. Calculate the average duration of gym visits for each membership type
-- TODO: Write a query to calculate the average duration of gym visits for each membership type
SELECT   type AS membership_type, 
         AVG(unixepoch(check_out_time) - unixepoch(check_in_time))/60 AS avg_visit_duration_minutes
FROM     attendance
            JOIN memberships 
                ON attendance.member_id = memberships.member_id
GROUP BY membership_type;

-- 3. Identify members with expiring memberships this year
-- TODO: Write a query to identify members with expiring memberships this year
SELECT members.member_id,
       first_name,
       last_name,
       email,
       end_date
FROM   memberships
        JOIN members
            ON members.member_id = memberships.member_id
WHERE  strftime('%Y', end_date) = strftime('%Y', 'now'); 