-- Initial SQLite setup
.open fittrackpro.db
.mode table

-- Enable foreign key support
PRAGMA foreign_keys = ON;
-- User Management Queries

-- 1. Retrieve all members
SELECT member_id, first_name, last_name, email, join_date
FROM members;

-- 2. Update a member's contact information
UPDATE members
SET email = 'emily.jones.updated@email.com', phone_number = '555-9876'
WHERE member_id = 5;

-- 3. Count total number of members
SELECT COUNT(*) AS "Total number of members"
FROM members;

-- 4. Find member with the most class registrations
-----------------------------
------     TODO     ---------
----------------------------

-- 5. Find member with the least class registrations
-----------------------------
------     TODO     ---------
-----------------------------

-- 6. Calculate the percentage of members who have attended at least one class
-- TODO: Write a query to calculate the percentage of members who have attended at least one class
-----------------------------
------     TODO     ---------
-----------------------------
