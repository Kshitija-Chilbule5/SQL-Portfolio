USE snapchat;

-- Exploratory Data Analysis
SELECT * FROM filters;
SELECT * FROM filterusage;
SELECT * FROM messages;
SELECT * FROM streaks;
SELECT * FROM users;

-- 1️) Find All Users ?
SELECT user_id, username, email
FROM users;

-- 2) Find All Messages ?
SELECT message_id, message_text, media_type
FROM messages;

-- 3) Find Streaks with Count Greater Than 10 ?
SELECT streak_id, streak_count
FROM streaks
WHERE streak_count > 10
ORDER BY streak_count DESC;

-- 4) Find Messages That Contain the Word "Hey" ?
SELECT message_text FROM messages
WHERE message_text LIKE "%Hey%";

-- 5) Count Total Users ?
SELECT COUNT(user_id) AS total_users
FROM users;

-- 6) Find Users Born After the Year 2000 ?
SELECT username, full_name, email, phone_number, date_of_birth
FROM users
WHERE YEAR(date_of_birth) > 2000;

-- 7)  Find All Unread Messages ?
SELECT * FROM messages
WHERE is_read = 0;

-- 8) Find Users Who Used a Specific Filter ('Cat Whiskers') 
SELECT fu.user_id, u.username, u.full_name, u.email, u.phone_number, f.filter_name 
FROM users u 
JOIN filterusage fu 
ON u.user_id = fu.user_id
JOIN filters f 
ON f.filter_id = fu.filter_id
WHERE f.filter_name = 'Cat Whiskers';

-- Find Most Used Filter by Users ?
SELECT f.filter_name, f.filter_type, COUNT(fu.usage_id) AS usage_count
FROM filters f
JOIN filterusage fu 
ON f.filter_id = fu.filter_id
GROUP BY f.filter_name, f.filter_type
ORDER BY usage_count DESC
LIMIT 3;

-- 10) Find all filters sorted alphabetically in ascending order ?
SELECT filter_name FROM filters
ORDER BY filter_name ASC;