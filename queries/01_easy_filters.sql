USE MEDIA_PLATFORM_DB;
/* 
=============================================================================
QUERY 1: High-Tier Subscribers
=============================================================================
HOW IT WORKS: Finds all users who are paying for the 'Premium 4K' tier (plan_id = 3).
*/
SELECT name, email, join_date 
FROM Users 
WHERE plan_id = 3;

/* 
=============================================================================
QUERY 2: Feature-Length Content Filter
=============================================================================
HOW IT WORKS: Retrieves movies that are longer than 2 hours (120 mins).
*/
SELECT title, duration_minutes 
FROM Content 
WHERE duration_minutes > 120;

/* 
=============================================================================
QUERY 3: Early Abandonment Detection
=============================================================================
HOW IT WORKS: Identifies watch events where the user stopped watching before 
hitting the 60-minute mark.
*/
SELECT user_id, content_id, minutes_watched 
FROM Watch_History 
WHERE minutes_watched < 60;

/* 
=============================================================================
QUERY 4: Recent Acquisitions
=============================================================================
HOW IT WORKS: Finds users who joined the platform in the year 2024.
*/
SELECT name, join_date 
FROM Users 
WHERE join_date >= '2024-01-01';