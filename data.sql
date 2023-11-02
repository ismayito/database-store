/* Populate database with sample data. */
INSERT INTO animals(NAME, DATE_OF_BIRTH, ESCAPE_ATTEMPTS, NEUTERED, WEIGHT_KG) 
VALUES('Agumon', '2020-02-03', 0, true, 10.23),
    ('Gabumon', '2018-11-15', 2, true, 8),
    ('Pikachu', '2021-01-07', 1, false, 15.4),
    ('Devimon', '2017-05-12', 5, true, 11);

// insert more data into our TABLE
INTO animals(NAME, DATE_OF_BIRTH, ESCAPE_ATTEMPTS, NEUTERED, WEIGHT_KG) 
VALUES('Charmander', '2020-02-08', 0, true, -11),
    ('Plantmon', '2021-11-15', 2, true, -5.7),
    ('Angemon', '2005-06-12', 3, false, -45),
    ('Boarmon', '2005-06-07', 7, true, 20.4),
    ('Blossom', '1998-10-13', 3, true, 17),
    ('Ditto', '2022-05-14', 4, true, 22);
//insert skipped animal data
INSERT INTO ANIMALS(NAME,DATE_OF_BIRTH,ESCAPE_ATTEMPTS,NEUTERED,WEIGHT_KG) VALUES('Squirtle','1993-04-02',3,false,-12.13);
//insert data into owners table;
INSERT INTO OWNERS(FULL_NAME,AGE)
 VALUES('Sam Smith',34),
 ('Jennifer Orwell',19),
 ('Bob',45),
 ('Melody Pond',77),
 ('Dean Winchester',14),
 ('Jodie Whittaker',38);
 //insert data into species table;
 INSERT INTO SPECIES (NAME) VALUES('Pokemon'),('Digimon');

//Modify your inserted animals so it includes the species_id value:
//If the name ends in "mon" it will be Digimon
//All other animals are Pokemon
UPDATE ANIMALS SET species_id=2 WHERE TRIM(NAME) LIKE '%mon';
UPDATE ANIMALS SET species_id=1 WHERE species_id IS NULL;
//Sam Smith owns Agumon.
UPDATE ANIMALS SET owner_id =1 WHERE TRIM(NAME)='Agumon';
//Jennifer Orwell owns Gabumon and Pikachu.
UPDATE ANIMALS SET owner_id =2 WHERE TRIM(NAME)='Gabumon' OR TRIM(NAME)='Pikachu';
//Bob owns Devimon and Plantmon.
UPDATE ANIMALS SET owner_id =3  WHERE TRIM(NAME)='Devimon' OR TRIM(NAME)='Plantmon';
//Melody Pond owns Charmander, Squirtle, and Blossom.
UPDATE ANIMALS SET owner_id =4  WHERE TRIM(NAME)='Charmander' OR TRIM(NAME)='Squirtle' OR TRIM(NAME)='Blossom';
//Dean Winchester owns Angemon and Boarmon.
UPDATE ANIMALS SET owner_id =5  WHERE TRIM(NAME)='Angemon' OR TRIM(NAME)='Boarmon'
//Insert data into vets table;
INSERT INTO  VETS(name,date_of_graduation,age ) 
VALUES('William Tatcher','2000-04-23',45),
('Maisy Smith','2019-01-17',26),
('Stephanie Mendez','1991-05-04',64),
('Jack Harkness','2008-06-08',38);
//Insert data into specializations table;
INSERT INTO SPECIALIZATIONS(vets_id,species_id)
VALUES(1,1),
(3,1),
(3,2),
(4,2);
//Insert data into visits;
INSERT INTO VISITS(vets_id,animals_id,date_of_visit)
VALUES(1,1,'2020-05-24'),
(3,1,'2020-07-22'),
(4,2,'2021-02-02'),
(2,3,'2020-01-05'),
(2,3,'2020-05-08'),
(2,3,'2020-05-14'),
(3,4,'2020-05-14'),
(4,5,'2021-02-24'),
(2,6,'2019-12-21'),
(1,6,'2020-08-10'),
(2,6,'2022-04-07'),
(3,15,'2019-09-29'),
(4,7,'2020-10-03'),
(4,7,'2020-11-04'),
(2,8,'2019-01-24'),
(2,8,'2019-05-15'),
(2,8,'2020-02-27'),
(2,8,'2020-08-03'),  
(2,8,'2020-01-05'),
(3,13,'2020-05-24'),
(1,13,'2021-01-11');

-- This will add 3.594.280 visits considering you have 10 animals, 4 vets, and it will use around ~87.000 timestamps (~4min approx.)
INSERT INTO visits (animalS_id, vets_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

-- This will add 2.500.000 owners with full_name = 'Owner <X>' and email = 'owner_<X>@email.com' (~2min approx.)
insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';
