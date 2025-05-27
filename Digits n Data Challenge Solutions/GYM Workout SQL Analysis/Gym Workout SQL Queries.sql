-- 1) Retrieve all users ?
SELECT * FROM users;

-- 2) Get all workout sessions for user_id = 2 ?
SELECT * FROM workout_sessions
WHERE user_id = 2;

-- 3) Count the number of workouts each user has completed ?
SELECT u.user_id, u.name, COUNT(ws.session_id) AS workout_count
FROM users u
LEFT JOIN workout_sessions ws ON u.user_id = ws.user_id
GROUP BY u.user_id, u.name
ORDER BY workout_count DESC;

-- 4) Find the average duration of workouts ?
SELECT AVG(duration_minutes) AS avg_duration
FROM workout_sessions;

-- 5) List all exercises in the 'Strength' category ?
SELECT name, muscle_group, equipment 
FROM exercises
WHERE category = 'Strength';

-- 6) Get the top 3 users who burned the most total calories ?
SELECT u.user_id, u.name AS user_name, u.age, SUM(ws.calories_burned) AS total_calories
FROM users u JOIN workout_sessions ws ON u.user_id = ws.user_id
GROUP BY u.user_id, u.name, u.age
ORDER BY total_calories DESC
LIMIT 3;

-- 7) Find the shortest and longest workout duration ?
SELECT 
MIN(duration_minutes) AS shortest_workout_duration,
MAX(duration_minutes) AS longest_workout_duration
FROM workout_sessions;

-- 8) Identify the youngest and oldest user ?
SELECT name, age,
CASE 
WHEN age = (SELECT MIN(age) FROM users) THEN 'Youngest'
WHEN age = (SELECT MAX(age) FROM users) THEN 'Oldest'
END AS age_category
FROM users
WHERE age = (SELECT MIN(age) FROM users)
OR age = (SELECT MAX(age) FROM users);
   
-- 9) List users who have performed 'Squat' ?
SELECT u.name AS user_name
FROM users u
JOIN exercises e ON u.user_id = e.user_id
WHERE e.name = 'Squat';

-- 10) Get all workouts on '2025-03-06' ?
SELECT u.name AS user_name, e.name AS exercises, ws.workout_date
FROM workout_sessions ws
JOIN users u ON ws.user_id = u.user_id
JOIN exercises e ON u.user_id = e.user_id
WHERE ws.workout_date = '2025-03-06';