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
//Sam Smith owns Agumon.
UPDATE ANIMALS SET owner_id = WHERE TRIM(NAME)='Agumon';
//Jennifer Orwell owns Gabumon and Pikachu.
UPDATE ANIMALS SET owner_id =2 WHERE TRIM(NAME)='Gabumon' OR TRIM(NAME)='Pikachu';
//Bob owns Devimon and Plantmon.
UPDATE ANIMALS SET owner_id =3  WHERE TRIM(NAME)='Devimon' OR TRIM(NAME)='Plantmon';
//Melody Pond owns Charmander, Squirtle, and Blossom.
UPDATE ANIMALS SET owner_id =4  WHERE TRIM(NAME)='Charmander' OR TRIM(NAME)='Squirtle' OR TRIM(NAME)='Blossom';
//Dean Winchester owns Angemon and Boarmon.
UPDATE ANIMALS SET owner_id =5  WHERE TRIM(NAME)='Angemon' OR TRIM(NAME)='Boarmon'