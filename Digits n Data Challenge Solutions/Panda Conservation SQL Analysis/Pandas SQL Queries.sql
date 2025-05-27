USE pandas;

-- 1) Find the names and ages of all pandas ?
SELECT Name, age 
FROM panda_info;

-- 2) Find all Conservation Centers ?
SELECT Name, Location 
FROM conservation_centers;

-- 3) Find all pandas living at 'Chengdu Research Base' and show their details ?
SELECT pi.Name AS Panda_Name
FROM panda_info pi
JOIN conservation_centers cc ON pi.Conservation_Center_ID = cc.Center_ID
WHERE cc.Name = 'Chengdu Research Base';

-- 4) Find Pandas That Are Endangered ?
SELECT pi.Name as Panda_Name
FROM panda_info pi
LEFT JOIN endangered_status es ON pi.Endangered_Status_ID = es.Status_ID
WHERE Status_Name = 'Endangered';

-- 5) Count Number of Pandas in Each Conservation Center ?
SELECT cc.Name AS Conservation_Center_Name, COUNT(pi.Panda_ID) AS Total_Pandas
FROM conservation_centers cc
JOIN panda_info pi ON cc.Center_ID = pi.Conservation_Center_ID
GROUP BY Conservation_Center_Name
ORDER BY Total_Pandas DESC;

-- 6) Find the Oldest Panda in the Database ?
SELECT Name AS Panda_Name, Age
FROM panda_info
WHERE Age = (SELECT MAX(Age) FROM panda_info);

-- 7) Find Conservation Centers Established Before the Year 2000 ?
SELECT Name AS Conservation_Center_Name, Established_Year
FROM conservation_centers
WHERE Established_Year < 2000;

-- 8) Find Pandas with Weight More Than 100kg ?
SELECT Name AS Panda_Name, Weight
FROM panda_info
WHERE Weight > 100;

-- 9) Calculate the Average Weight of Pandas in Each Conservation Center ?
SELECT cc.Name AS Conservation_Center_Name, AVG(pi.Weight) AS Avg_Weight
FROM conservation_centers cc
LEFT JOIN panda_info pi ON cc.Center_ID = pi.Conservation_Center_ID
GROUP BY Conservation_Center_Name
ORDER BY Avg_Weight DESC;

-- 10) Find the name and location of the conservation center where the panda "Xiao Qi Ji" is located ?
SELECT cc.Name AS Conservation_center_name, cc.Location
FROM conservation_centers cc
JOIN panda_info pi ON cc.Center_ID = pi.Conservation_Center_ID
WHERE pi.Name = 'Xiao Qi Ji';