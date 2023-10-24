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
