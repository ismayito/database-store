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
