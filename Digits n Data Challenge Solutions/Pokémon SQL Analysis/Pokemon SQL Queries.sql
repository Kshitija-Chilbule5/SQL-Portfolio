USE pokemon;

-- Exploratory Data Analysis
SELECT * FROM battles;
SELECT * FROM pokemonmoves;
SELECT * FROM pokémon;
SELECT * FROM trainers;

-- 1) Find all Pokémon names and their types ?
SELECT Name, Type
FROM pokémon;

-- 2) Find the trainer from 'Petalburg City' ?
SELECT Name as Trainer_Name
FROM trainers
WHERE Hometown = 'Petalburg City';

-- 3) List battles that took place after '2025-05-01' ?
SELECT BattleID
FROM battles
WHERE Date > '2025-05-01';

-- 4) Find all Pokémon that are at 'Stage 1' evolution ?
SELECT Name as Pokemon_name
FROM Pokémon
WHERE EvolutionStage = 'Stage 1';

-- 5) Get the strongest Pokémon move (highest power) ?
SELECT Name as Pokemon_move_name, Power
FROM pokemonmoves
WHERE Power = (SELECT MAX(Power) AS highest_power FROM pokemonmoves);

-- 6) Find Battles with Trainers from 'Pallet Town' ?
SELECT b.BattleID, b.Location, t.Name as Trainer_name
FROM battles b
JOIN trainers t ON b.TrainerID = t.TrainerID;

-- 7) Find Trainers Who Own a Water-Type Pokémon ?
SELECT t.Name AS Trainer_name, p.Type
FROM trainers t 
JOIN pokémon p ON t.PokemonID = p.PokemonID
WHERE p.type = 'Water';

-- 8) Count the Number of Trainers for Each Pokémon Type ?
SELECT p.Type AS Pokemon_type, COUNT(t.TrainerID) AS Total_trainers
FROM pokémon p JOIN trainers t ON p.PokemonID = t.PokemonID
GROUP BY Pokemon_type
ORDER BY Total_trainers DESC;

-- 9) List all Pokémon in alphabetical order (A → Z) ?
SELECT Name AS Pokemon_name
FROM pokémon
ORDER BY Name ASC;

-- 10) Find battles that happened in March ?
SELECT * FROM battles
WHERE MONTH(Date) = 3;