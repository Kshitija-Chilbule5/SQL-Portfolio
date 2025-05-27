
-- 1) Get all the characters in the show?
SELECT DISTINCT name FROM characters;

-- 2) Get all episode titles and their air dates?
SELECT DISTINCT title, air_date FROM episodes;

-- 3) Find Joey Tribbiani’s occupation?
SELECT name, occupation
FROM characters
WHERE name = 'Joey Tribbiani';

-- 4) Find how many episodes each character has appeared in.
SELECT ca.character_id, c.name, COUNT(ca.episode_id) AS total_episodes
FROM character_appearances ca
JOIN characters c ON ca.character_id = c.character_id
GROUP BY ca.character_id, c.name
ORDER BY total_episodes DESC;

-- 5) Find the highest number of characters appearing in a single episode?
SELECT ca.episode_id, COUNT(ca.character_id) AS total_characters,GROUP_CONCAT(c.name SEPARATOR " , ") AS actors
FROM character_appearances ca
JOIN characters c ON ca.character_id = c.character_id
GROUP BY ca.episode_id
ORDER BY total_characters DESC;

-- 6) Find all episodes that aired between 1998 and 2002.
SELECT episode_number, title, air_date
FROM episodes
WHERE YEAR(air_date) BETWEEN 1998 AND 2002
ORDER BY air_date;

-- 7) Find all characters whose name starts with ‘J’?
SELECT name FROM characters
WHERE name LIKE "J%";


-- 8) Find all episodes from season 5 or season 6?
SELECT season, episode_number, title AS episode_name
FROM episodes
WHERE season IN (5,6)
ORDER BY season, episode_number;

-- 9) Find the first and last episode of each season
SELECT e1.season, e1.episode_number AS first_episode_number, e1.title AS first_episode_name, e2.episode_number AS last_episode_number, e2.title AS last_episode_name
FROM episodes e1
JOIN episodes e2 ON e1.season = e2.season
AND e1.episode_number = (SELECT MIN(episode_number) FROM episodes WHERE season = e1.season) -- First episode
AND e2.episode_number = (SELECT MAX(episode_number) FROM episodes WHERE season = e2.season) -- Last episode
ORDER BY e1.season;

-- 10) Find all female characters in the show.
SELECT name AS Female_Characters
FROM characters
WHERE gender = 'Female';