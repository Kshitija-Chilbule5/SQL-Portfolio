CREATE DATABASE pokemon;

USE pokemon;

CREATE TABLE Pokémon (
    PokemonID INT PRIMARY KEY,
    Name VARCHAR(255),
    Type VARCHAR(255),
    EvolutionStage VARCHAR(50)
);

INSERT INTO Pokémon (PokemonID, Name, Type, EvolutionStage)
VALUES
    (1, 'Pikachu', 'Electric', 'Stage 2'),
    (2, 'Charizard', 'Fire', 'Stage 3'),
    (3, 'Bulbasaur', 'Grass', 'Stage 1'),
    (4, 'Jigglypuff', 'Normal', 'Stage 2'),
    (5, 'Gyarados', 'Water', 'Stage 2'),
    (6, 'Eevee', 'Normal', 'Stage 1'),
    (7, 'Machop', 'Fighting', 'Stage 1'),
    (8, 'Geodude', 'Rock', 'Stage 1'),
    (9, 'Psyduck', 'Water', 'Stage 1'),
    (10, 'Rattata', 'Normal', 'Stage 1');

CREATE TABLE Trainers (
    TrainerID INT PRIMARY KEY,
    Name VARCHAR(255),
    Hometown VARCHAR(255),
    PokemonID INT,
    FOREIGN KEY (PokemonID) REFERENCES Pokémon(PokemonID)
);

INSERT INTO Trainers (TrainerID, Name, Hometown, PokemonID)
VALUES
    (1, 'Ash Ketchum', 'Pallet Town', 1),
    (2, 'Misty', 'Cerulean City', 2),
    (3, 'Brock', 'Pewter City', 3),
    (4, 'Gary Oak', 'Pallet Town', 4),
    (5, 'May', 'Petalburg City', 5),
    (6, 'Serena', 'Vaniville Town', 6),
    (7, 'Dawn', 'Twinleaf Town', 7),
    (8, 'Red', 'Pallet Town', 8),
    (9, 'Blue', 'Pallet Town', 9),
    (10, 'Cynthia', 'Celestic Town', 10);

CREATE TABLE Battles (
    BattleID INT PRIMARY KEY,
    Date DATE,
    Location VARCHAR(255),
    TrainerID INT,
    FOREIGN KEY (TrainerID) REFERENCES Trainers(TrainerID)
);

INSERT INTO Battles (BattleID, Date, Location, TrainerID)
VALUES
    (1, '2025-01-15', 'Cerulean Cape', 1),
    (2, '2025-02-20', 'Victory Road', 2),
    (3, '2025-03-10', 'Indigo Plateau', 5),
    (4, '2025-04-05', 'Pewter City Gym', 7),
    (5, '2025-05-12', 'Viridian Forest', 9),
    (6, '2025-06-18', 'Saffron City Gym', 1),
    (7, '2025-07-22', 'Mt. Moon', 3),
    (8, '2025-08-30', 'Cinnabar Island', 4);

CREATE TABLE PokemonMoves (
    MoveID INT PRIMARY KEY,
    Name VARCHAR(255),
    Type VARCHAR(255),
    Power INT
);

INSERT INTO PokemonMoves (MoveID, Name, Type, Power) VALUES
(1, 'Thunderbolt', 'Electric', 90),
(2, 'Flamethrower', 'Fire', 95),
(3, 'Solar Beam', 'Grass', 120),
(4, 'Water Gun', 'Water', 40),
(5, 'Ice Beam', 'Ice', 90),
(6, 'Psychic', 'Psychic', 90),
(7, 'Earthquake', 'Ground', 100),
(8, 'Thunder Wave', 'Electric', 0),
(9, 'Poison Sting', 'Poison', 15),
(10, 'Quick Attack', 'Normal', 40),
(11, 'Bite', 'Dark', 60),
(12, 'Confusion', 'Psychic', 50),
(13, 'Ember', 'Fire', 40);