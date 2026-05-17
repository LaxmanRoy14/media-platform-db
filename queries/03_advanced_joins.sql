USE media_platform_db;
/* 
=============================================================================
QUERY 9: The "Binge Drop-off" (Multi-Table Incomplete Watch Detection)
=============================================================================
HOW IT WORKS: Joins Watch_History and Content to find specific users who 
started a movie but abandoned it before the credits rolled (where minutes 
watched is less than the actual duration).
*/
SELECT u.name, c.title, wh.minutes_watched, c.duration_minutes
FROM Watch_History wh
JOIN Users u ON wh.user_id = u.user_id
JOIN Content c ON wh.content_id = c.content_id
WHERE wh.minutes_watched < c.duration_minutes;

/* 
=============================================================================
QUERY 10: Platform Churn / Inactive Users (Anti-Join)
=============================================================================
HOW IT WORKS: Identifies users who are paying for a subscription but have 
literally zero records in the Watch_History table (Ghost Accounts).
*/
SELECT name, email 
FROM Users 
WHERE user_id NOT IN (
    SELECT DISTINCT user_id 
    FROM Watch_History
);

/* 
=============================================================================
QUERY 11: Top Performing Genre by Engagement
=============================================================================
HOW IT WORKS: A 3-table join to calculate total watch time by genre, filtering 
via a HAVING clause to only show genres with over 100 total minutes of engagement.
*/
SELECT g.genre_name, SUM(wh.minutes_watched) AS total_engagement_minutes
FROM Genres g
JOIN Content c ON g.genre_id = c.genre_id
JOIN Watch_History wh ON c.content_id = wh.content_id
GROUP BY g.genre_name
HAVING SUM(wh.minutes_watched) > 100
ORDER BY total_engagement_minutes DESC;

/* 
=============================================================================
QUERY 12: Basic Recommendation Engine (Content Not Yet Watched)
=============================================================================
HOW IT WORKS: Recommends content to 'Arjun Reddy' (user_id = 1) by finding 
movies in the database that do NOT exist in his personal Watch_History.
*/
SELECT c.title, g.genre_name
FROM Content c
JOIN Genres g ON c.genre_id = g.genre_id
WHERE c.content_id NOT IN (
    SELECT content_id 
    FROM Watch_History 
    WHERE user_id = 1
);