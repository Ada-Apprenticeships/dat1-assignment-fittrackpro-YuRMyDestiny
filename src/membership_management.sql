-- Initial SQLite setup
.open fittrackpro.db
.mode table


-- Enable foreign key support
PRAGMA foreign_keys = ON;
-- Membership Management Queries

-- 1. List all active memberships
-- TODO: Write a query to list all active memberships
SELECT members.member_id, first_name, last_name, type AS membership_type, join_date
FROM members
JOIN memberships on members.member_id = memberships.member_id
WHERE status = 'Active';


-- 2. Calculate the average duration of gym visits for each membership type
-- TODO: Write a query to calculate the average duration of gym visits for each membership type


-- 3. Identify members with expiring memberships this year
-- TODO: Write a query to identify members with expiring memberships this year