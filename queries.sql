/*Queries that provide answers to the questions from all projects.*/

// select all animals whose name end with 'mon';
SELECT * FROM animals WHERE TRIM(name) LIKE '%mon'; 
// select all animals which were born between 2016 and 2019;
SELECT NAME FROM ANIMALs WHERE DATE_OF_BIRTH BETWEEN '2016-01-01' AND '2019-12-31';
// select all animals which were nurtered and have less than 3 escape-ESCAPE_ATTEMPTS
SELECT NAME FROM ANIMALS WHERE NEUTERED = true AND ESCAPE_ATTEMPTS < 3;
// List the date of birth of all animals named either "Agumon" or "Pikachu".
 SELECT DATE_OF_BIRTH FROM ANIMALS WHERE TRIM(NAME)='Augmon' OR TRIM(NAME)='Pikachu';
//List name and escape attempts of animals that weigh more than 10.5kg
SELECT NAME, ESCAPE_ATTEMPTS FROM ANIMALS WHERE WEIGHT_KG &gt;10.5;
//Find all animals that are neutered.
SELECT *FROM ANIMALS WHERE NEUTERED=true;
// find all animals not named 'Gabumon'
SELECT *FROM ANIMALS WHERE NAME <> 'Gabumon';
//Find all animals with a weight between 10.4kg and 17.3kg (including the animals with the weights that equals precisely 10.4kg or 17.3kg)
SELECT *FROM ANIMALS WHERE WEIGHT_KG >= 10.4 AND WEIGHT_KG <= 17.3;
//Transactions for the updating the animals table;
BEGIN;
//Update the animals table by setting the species column to digimon for all animals that have a name ending in mon.
UPDATE ANIMALS SET species='digimon' WHERE TRIM(name) LIKE '%mon';
//Update the animals table by setting the species column to pokemon for all animals that don't have species already set.
UPDATE ANIMALS SET species='Pokemon' WHERE species='' OR species IS NULL;
COMMIT;
//delete all records from the table inside a transaction;
BEGIN;
DELETE FROM ANIMALS;
ROLLBACK;
SELECT*FROM ANIMALS;
//Delete all animals born after Jan 1st, 2022.
DELETE FROM ANIMALS WHERE date_of_birth > '2022-01-01';
SAVEPOINT SP1;
//Update all animals' weight to be their weight multiplied by -1.
UPDATE ANIMALS SET weight_kg =weight_kg*-1;
ROLLBACK TO SP1;
//Update all animals' weights that are negative to be their weight multiplied by -1.
UPDATE ANIMALS SET weight_kg = weight_kg*-1 WHERE weight_kg < 0;
//Query to determine how many animals are in the table;
SELECT COUNT(NAME) FROM ANIMALS;
//Query to determine how many animals have never tried to escape;
SELECT COUNT(NAME) FROM ANIMALS WHERE escape_attempts <= 0;
//Determine the average weight of the animals;
SELECT AVG(WEIGHT_KG) FROM ANIMALS;
//Who escapes the most, neutered or not neutered animals?
SELECT neutered,MAX(escape_attempts) FROM ANIMALS GROUP BY neutered;
//What is the minimum and maximum weight of each type of animal?
SELECT species,MAX(weight_kg) FROM ANIMALS GROUP BY species;
SELECT species,MIN(weight_kg) FROM ANIMALS GROUP BY species;
//What is the average number of escape attempts per animal type of those born between 1990 and 2000?
SELECT species, AVG(escape_attempts) FROM ANIMALS GROUP BY species WHERE date_of_birth=1990 AND date_of_birth=2000; 
//Update the skipped Squirtle animal data
UPDATE ANIMALS SET species='Pokemon' WHERE NAME='Squirtle';
//Update the skipped Squirtle animal data weight_kg column;
UPDATE ANIMALS SET weight_kg = weight_kg*-1 WHERE name='Squirtle';

//Write queries (using JOIN) to answer the following questions
//:What animals belong to Melody Pond?
SELECT name FROM ANIMALS JOIN OWNERS ON ANIMALS.owner_id=OWNERS.id WHERE TRIM(OWNERS.full_name)='Melody Pond';
//List of all animals that are pokemon (their type is Pokemon).
SELECT ANIMALS.name FROM ANIMALS JOIN SPECIES ON ANIMALS.species_id=SPECIES.id WHERE ANIMALS.species_id=1;
//List all owners and their animals, remember to include those that don't own any animal.
SELECT OWNERS.full_name, ANIMALS.name FROM OWNERS LEFT  JOIN ANIMALS ON ANIMALS.owner_id=OWNERS.id;
//How many animals are there per species?
SELECT SPECIES.name, COUNT(SPECIES.name) FROM ANIMALS JOIN SPECIES ON ANIMALS.species_id=SPECIES.id GROUP BY SPECIES.name;
//List all Digimon owned by Jennifer Orwell.
SELECT ANIMALS.name, OWNERS.full_name FROM ANIMALS JOIN OWNERS ON ANIMALS.owner_id=OWNERS.id JOIN SPECIES ON SPECIES.id=ANIMALS.species_id 
WHERE TRIM(OWNERS.full_name)='Jennifer Orwell' AND TRIM(SPECIES.name)='Digimon';
//List all animals owned by Dean Winchester that haven't tried to escape.
SELECT ANIMALS.name, OWNERS.full_name FROM ANIMALS 
JOIN OWNERS ON ANIMALS.owner_id =OWNERS.id
WHERE escape_attempts<=0 AND TRIM(OWNERS.full_name)='Dean Winchester';
//Who owns the most animals?
SELECT OWNERS.full_name, COUNT(ANIMALS.id)
FROM OWNERS
LEFT JOIN ANIMALS ON OWNERS.id = ANIMALS.owner_id
GROUP BY OWNERS.full_name
LIMIT 1;

//Who was the last animal seen by William Tatcher?
SELECT ANIMALS.name,VETS.name FROM ANIMALS 
JOIN VISITS ON VISITS.animals_id=ANIMALS.id 
JOIN VETS ON VETS.id=VISITS.vets_id  WHERE 
TRIM(VETS.name)='William Tatcher' 
ORDER BY VISITS.date_of_visit DESC LIMIT 1;
//How many different animals did Stephanie Mendez see?
SELECT COUNT (DISTINCT ANIMALS.NAME) AS animals_seen FROM 
ANIMALS JOIN VISITS ON VISITS.animals_id = ANIMALS.id 
JOIN VETS ON VETS.id=VISITS.vets_id WHERE TRIM(VETS.name)='Stephanie Mendez'; 
//List all vets and their specialties, including vets with no specialties;
SELECT VETS.name, SPECIES.name FROM VETS 
LEFT JOIN SPECIALIZATIONS ON SPECIALIZATIONS.vets_id=VETS.id 
LEFT JOIN SPECIES ON SPECIES.id=SPECIALIZATIONS.species_id;
//List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
SELECT ANIMALS.name FROM ANIMALS 
JOIN VISITS ON ANIMALS.id = VISITS.animals_id 
JOIN VETS ON VISITS.vets_id = VETS.id 
WHERE VETS.name = 'Stephanie Mendez' AND
VISITS.date_of_visit BETWEEN '2020-04-01' AND '2020-08-30';
//What animal has the most visits to vets?
COUNT(VISITS.vets_id) FROM ANIMALS JOIN VISITS ON VISITS.animals_id =ANIMALS.id 
GROUP BY ANIMALS.name ORDER BY COUNT(VISITS.vets_id) DESC LIMIT 1;
//Who was Maisy Smith's first visit?;
SELECT ANIMALS.name
FROM ANIMALS
JOIN VISITS ON VISITS.animals_id = ANIMALS.id
JOIN VETS ON VETS.id = VISITS.vets_id
WHERE TRIM(VETS.name) = 'Maisy Smith'
ORDER BY VISITS.date_of_visit
LIMIT 1;
//Details for most recent visit: animal information, vet information, and date of visit.
SELECT ANIMALS.name AS animal_name, VETS.name AS vet_name, VISITS.date_of_visit
FROM ANIMALS
JOIN VISITS ON VISITS.animals_id = ANIMALS.id
JOIN VETS ON VETS.id = VISITS.vets_id
ORDER BY VISITS.date_of_visit DESC
LIMIT 1;
//How many visits were with a vet that did not specialize in that animal's species?
SELECT COUNT(*) AS num_visits
FROM VISITS
JOIN ANIMALS ON VISITS.animals_id = ANIMALS.id
JOIN VETS ON VISITS.vets_id = VETS.id
LEFT JOIN SPECIALIZATIONS ON VETS.id = SPECIALIZATIONS.vets_id AND ANIMALS.species_id = SPECIALIZATIONS.species_id
WHERE SPECIALIZATIONS.vets_id IS NULL;
//What specialty should Maisy Smith consider getting? Look for the species she gets the most.
SELECT species.name, COUNT(species.name) AS visit_count
FROM visits
JOIN animals ON visits.animals_id = animals.id
JOIN specializations ON animals.species_id = specializations.species_id
JOIN species ON specializations.species_id = species.id
JOIN vets ON visits.vets_id = vets.id
WHERE TRIM(vets.name) = 'Maisy Smith'
GROUP BY species.name
ORDER BY visit_count DESC
LIMIT 1;

