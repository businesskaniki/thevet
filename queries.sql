/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name LIKE  '%mon';
SELECT name,date_of_birth FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name,escape_attempts FROM animals WHERE weight_kg > 10;
SELECT name,weight_kg FROM animals WHERE weight_kg >= 10.4 OR weight_kg <= 17.3;
SELECT name FROM animals WHERE neutered = true;
SELECT name FROM animals WHERE name != 'Gabumon';

UPDATE animals SET species = 'digimon' WHERE name LIKE  '%mon';
UPDATE animals SET weight_kg = 'pokemon' WHERE species IS NULL;
DELETE FROM animals WHERE date_of_birth > '1-1-2022';
UPDATE animals SET weight_kg = weight_kg * -1;
UPDATE animals SET weight_kg = weight_kg *-1 WHERE weight_kg < 0;

SELECT count(*) FROM animals;
SELECT count(*) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered FROM animals WHERE escape_attempts = (SELECT MAX(escape_attempts) FROM animals);
SELECT species, MIN ( weight_kg ), MAX( weight_kg ) FROM animals GROUP BY species;
SELECT species, AVG ( escape_attempts ) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;