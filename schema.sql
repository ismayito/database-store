/* Database schema to keep the structure of entire database. */

CREATE TABLE animals(
ID SERIAL,
NAME CHAR,
DATE_OF_bIRTH DATE,
ESCAPE_ATTEMPTS INT,
NEUTERED BOOLEAN,
WEIGHT_KG DECIMAL,
PRIMARY KEY (ID)
);

// adding a new column species.
ALTER TABLE ANIMALS ADD COLUMN SPECIES CHAR(20);

//Create table owners;
CREATE TABLE owners (id SERIAL, full_name CHAR(50),age INT, PRIMARY KEY(ID));
//Create table species;
CREATE TABLE species(id SERIAL PRIMARY KEY,name CHAR(50));
//Remove column species from animals table;
 ALTER TABLE ANIMALS DROP COLUMN SPECIES;
//Add column species_id which is a foreign key referencing species table
ALTER TABLE ANIMALS ADD COLUMN species_id CHAR ,ADD CONSTRAINT Fk_species FOREIGN KEY (species_id) REFERENCES SPECIES(ID);
//Add column owner_id which is a foreign key referencing the owners table;
ALTER TABLE ANIMALS ADD COLUMN owner_id INT, ADD CONSTRAINT Fk_owner FOREIGN KEY(owner_id) REFERENCES OWNERS(ID);
//Create table vets;
CREATE TABLE vets (id SERIAL PRIMARY KEY,name CHAR(50),date_of_graduation DATE,age INT);
//Create a join table for vets and species tables;
CREATE TABLE specializations(vets_id INT,species_id INT);
// Create a join table for vets and animals tables;
CREATE TABLE visits(vets_id INT,animals_id INT,date_of_visit DATE);

-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);


