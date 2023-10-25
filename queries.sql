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


