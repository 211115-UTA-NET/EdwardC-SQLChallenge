-- Create Tables
-- ### 1
Create TABLE Pokemon
(
	Id INT IDENTITY(1, 1) PRIMARY KEY,
	Name VARCHAR(20) ,
	Height VARCHAR(50),
	Weight VARCHAR(50)

);

-- ### 2
CREATE TABLE Type
(
	Id INT IDENTITY(1, 1) PRIMARY KEY,
	Name VARCHAR(20) UNIQUE,
);

-- ### 3
CREATE TABLE PokemonType
(
	Id INT IDENTITY(1, 1) PRIMARY KEY,
	PokemonId INT,
	TypeId Int,
	CONSTRAINT FK_PokmonType_PokemonId FOREIGN KEY (PokemonId) 
	REFERENCES Pokemon(Id),
	CONSTRAINT FK_PokemonType_TypeId FOREIGN KEY (TypeId) 
	REFERENCES Type(Id)
);

-- Set Records
-- ### 4
INSERT INTO Pokemon 
	(Name, Height, Weight)
VALUES 
	('Bulbasaur', '7', '70'),
	('Ditto', '3', '40');

-- ### 5
INSERT INTO Type
	(Name)
VALUES
	('Normal'),
	('Grass');

-- ### 6
INSERT INTO PokemonType
	(PokemonId, TypeId)
VALUES
	(1, 2),
	(2, 1);

-- Display Pokemon's Information (Pokedex)
-- ### 7
SELECT Pokemon.Id, Pokemon.Name, Height, Weight, Type.Id, Type.Name, PokemonType.ID 
FROM Pokemon
INNER JOIN PokemonType ON PokemonType.PokemonId = Pokemon.Id
INNER JOIN Type ON Type.Id = PokemonType.TypeId;