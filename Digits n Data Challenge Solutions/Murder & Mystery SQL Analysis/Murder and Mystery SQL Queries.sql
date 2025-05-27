USE murder;

-- Exploratory Data Analysis
SELECT * FROM cases;
SELECT * FROM evidence;
SELECT * FROM suspects;
SELECT * FROM victims;

-- 1) Find all criminal cases ?
SELECT case_name, crime_type, crime_date, location
FROM cases;

-- 2) Find all suspects in the database ?
SELECT suspect_name, gender, criminal_record
FROM suspects;

-- 3) Find the names and ages of all victims ?
SELECT victim_name, age
FROM victims;

-- 4) List all pieces of evidence collected along with their descriptions ?
SELECT c.case_name, e.evidence_type, e.description
FROM evidence e
JOIN cases c ON e.case_id =  c.case_id;

-- 5) Find all cases that occurred between January 1, 2024, and January 1, 2025 ?
SELECT * FROM cases
WHERE crime_date BETWEEN '2024-01-01' AND '2025-01-01';

-- 6) List all victims aged above 40 ?
SELECT * FROM victims
WHERE age > 40;

-- 7) Find the suspect whose names start with the letter "L" ?
SELECT suspect_name
FROM suspects
WHERE suspect_name LIKE "L%";

-- 8) List suspects along with the case they are associated with ?
SELECT c.case_name, s.suspect_name
FROM suspects s
JOIN cases c ON s.case_id =  c.case_id;

-- 9) Count the number of victims in each crime type ?
SELECT c.crime_type, COUNT(victim_id)
FROM cases c
JOIN victims v ON c.case_id = v.case_id
GROUP BY c.crime_type;

-- 10) Find out how many cases are currently open, closed, or under investigation ?
SELECT case_status, COUNT(*)
FROM cases
GROUP BY case_status;