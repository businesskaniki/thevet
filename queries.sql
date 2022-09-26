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


SELECT name FROM animals INNER JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Melody Pond';
SELECT * FROM animals INNER JOIN species ON animals.species_id = species.id WHERE species.name = 'Pokemon';
SELECT full_name, STRING_AGG (animals.name, ', ') AS animals FROM owners LEFT JOIN animals ON animals.owner_id = owners.id GROUP BY owners.full_name;
SELECT species.name, COUNT (*) FROM species JOIN animals ON animals.species_id = species.id GROUP BY species.name;
SELECT animals.name FROM animals INNER JOIN owners ON owners.id = animals.owner_id WHERE species_id = (SELECT id FROM species WHERE name = 'Digimon') AND owners.full_name = 'Jennifer Orwell';
SELECT * FROM animals INNER JOIN owners ON owners.id = animals.owner_id WHERE escape_attempts = 0 AND owners.full_name = 'Dean Winchester';
SELECT owners.full_name FROM owners LEFT JOIN animals ON owners.id = animals.owner_id GROUP BY owners.full_name ORDER BY COUNT(*) DESC LIMIT 1;

SELECT animals.name FROM animals INNER JOIN visits ON visits.animal_id = animals.id INNER JOIN vets ON visits.vet_id = vets.id WHERE vets.id = 1 AND visit_date = (SELECT MAX (visit_date) FROM visits);
SELECT COUNT(*) FROM animals INNER JOIN visits ON visits.animal_id = animals.id INNER JOIN vets ON visits.vet_id = vets.id WHERE vets.id = 3;
SELECT vets.name, STRING_AGG (species.name, ',') FROM vets LEFT JOIN specializations ON vets.id = specializations.vet_id LEFT JOIN species ON specializations.species_id = species.id GROUP BY vets.name;
SELECT animals.name, visit_date FROM animals INNER JOIN visits ON visits.animal_id = animals. id INNER JOIN vets ON visits.vet_id = vets.id WHERE vets.id = 3 AND visit_date BETWEEN '01/04/2020' AND '30/08/2020';
SELECT animals.name,COUNT(animals.name) FROM animals INNER JOIN visits ON animals.id = visits.animal_id GROUP BY animals.name ORDER BY COUNT(animals.name) DESC LIMIT 1;
SELECT animals.name FROM animals INNER JOIN visits ON visits.animal_id = animals. id INNER JOIN vets ON visits.vet_id = vets.id WHERE vets.id = 2 AND visit_date = (SELECT MIN (visit_date) FROM visits);
SELECT * FROM animals INNER JOIN visits ON visits.animal_id = animals. id INNER JOIN vets ON visits.vet_id = vets.id WHERE visit_date = (SELECT MAX (visit_date) FROM visits);
SELECT COUNT(visits.animal_id) FROM visits INNER JOIN vets ON visits.vet_id = vets.id INNER JOIN animals ON animals.id = visits.animal_id INNER JOIN specializations ON specializations.species_id = vets.id WHERE specializations.species_id != animals.species_id;
SELECT species.name, COUNT(*) FROM animals INNER JOIN visits ON animals.id = visits.animal_id INNER JOIN species ON animals.species_id = species.id WHERE visits.vet_id = 2 GROUP BY species.name ORDER BY COUNT(*) DESC LIMIT 1;
