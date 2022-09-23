/* Populate database with sample data. */

INSERT INTO animals (name,id,date_of_birth,escape_attempts,neutered,weight_kg) VALUES ('Agumon',1,'3-2-2020',0,true,10.23);
INSERT INTO animals (name,id,date_of_birth,escape_attempts,neutered,weight_kg) VALUES ('Gabumon',2,'15-11-2018',2,true,8);
INSERT INTO animals (name,id,date_of_birth,escape_attempts,neutered,weight_kg) VALUES ('Pikachu',3,'7-1-2021',1,false,15.04);
INSERT INTO animals (name,id,date_of_birth,escape_attempts,neutered,weight_kg) VALUES ('Devimon',4,'12-5-2017',5,true,11);
INSERT INTO animals (name,id,date_of_birth,escape_attempts,neutered,weight_kg) VALUES ('Charmander',5,'8-2-2020',0,false,-11);
INSERT INTO animals (name,id,date_of_birth,escape_attempts,neutered,weight_kg) VALUES ('Plantmon',6,'15-12-2021',2,true,-5.7);
INSERT INTO animals (name,id,date_of_birth,escape_attempts,neutered,weight_kg) VALUES ('Squirtle',7,'2-3-1993',3,false,-12.13);
INSERT INTO animals (name,id,date_of_birth,escape_attempts,neutered,weight_kg) VALUES ('Angemon',8,'12-6-2005',1,true,-45);
INSERT INTO animals (name,id,date_of_birth,escape_attempts,neutered,weight_kg) VALUES ('Boarmon',9,'7-6-2005',7,true,20.4);
INSERT INTO animals (name,id,date_of_birth,escape_attempts,neutered,weight_kg) VALUES ('Blossom',10,'13-10-1998',3,true,17);
INSERT INTO animals (name,id,date_of_birth,escape_attempts,neutered,weight_kg) VALUES ('Ditto',11,'14-5-2022',4,true,22);

INSERT INTO species (name) VALUES('Pokemon');
INSERT INTO species (name) VALUES('Digimon');


INSERT INTO owners (full_name,age) VALUES('Sam Smith',34);
INSERT INTO owners (full_name,age) VALUES('Jennifer Orwell',19);
INSERT INTO owners (full_name,age) VALUES('Bob',45);
INSERT INTO owners (full_name,age) VALUES('Melody Pond',77);
INSERT INTO owners (full_name,age) VALUES('Dean Winchester',14);
INSERT INTO owners (full_name,age) VALUES('Jodie Whittaker',38);

UPDATE animals SET species_id = (SELECT id FROM species WHERE name = 'Digimon')  WHERE name LIKE '%mon';
UPDATE animals SET species_id =(SELECT id FROM species WHERE name = 'pokemon') WHERE species_id IS NULL;

UPDATE animals SET owner_id =(SELECT id FROM owners WHERE full_name='Sam Smith') WHERE name ='Agumon';
UPDATE animals SET owner_id =(SELECT id FROM owners WHERE full_name='Jennifer Orwell') WHERE name IN ('Gabumon','Pikachu');
UPDATE animals SET owner_id =(SELECT id FROM owners WHERE full_name='Bob')WHERE name IN ('Devimon', 'Plantmon');
UPDATE animals SET owner_id =(SELECT id FROM owners WHERE full_name='Melody Pond') WHERE  name IN ('Charmander','Squirtle','Blossom');
UPDATE animals SET owner_id =(SELECT id FROM owners WHERE full_name='Dean Winchester') WHERE name = ('Angemon','Boarmon');


INSERT INTO vets (name,age,date_of_graduation) VALUES ('William Tatcher',45,'23-4-2000');
INSERT INTO vets (name,age,date_of_graduation) VALUES ('Maisy Smith',26,'17-1-2019');
INSERT INTO vets (name,age,date_of_graduation) VALUES ('Stephanie Mendez',64,'4-5-1981');
INSERT INTO vets (name,age,date_of_graduation) VALUES ('Jack Harkness',38,'8-7-2008')

INSERT INTO specializations (species_id, vet_id) SELECT species.id, vets.id FROM species, vets WHERE species.name = 'Pokemon' AND vets.name = 'William Tatcher';
INSERT INTO specializations (species_id, vet_id) SELECT species.id, vets.id FROM species, vets WHERE species.name = 'Digimon' AND vets.name = 'Stephanie Mendez';
INSERT INTO specializations (species_id, vet_id) SELECT species.id, vets.id FROM species, vets WHERE species.name = 'Pokemon' AND vets.name = 'Stephanie Mendez';
INSERT INTO specializations (species_id, vet_id) SELECT species.id, vets.id FROM species, vets WHERE species.name = 'Digimon' AND vets.name = 'Jack Harkness';


INSERT INTO visits (animal_id, vet_id) SELECT animals.id, vets.id FROM animals, vets WHERE animals.name = 'Agumon' AND vets.name = 'William Tatcher';
UPDATE visits SET visit_date = ('24-5-2020') WHERE visit_date IS NULL;

INSERT INTO visits (animal_id, vet_id) SELECT animals.id, vets.id FROM animals, vets WHERE animals.name = 'Agumon' AND vets.name = 'Stephanie Mendez';
UPDATE visits SET visit_date = ('22-7-2020') WHERE visit_date IS NULL;

INSERT INTO visits (animal_id, vet_id) SELECT animals.id, vets.id FROM animals, vets WHERE animals.name = 'Gabumon' AND vets.name = 'Jack Harkness';
UPDATE visits SET visit_date = ('2--2021') WHERE visit_date IS NULL;

INSERT INTO visits (animal_id, vet_id) SELECT animals.id, vets.id FROM animals, vets WHERE animals.name = 'Pikachu' AND vets.name = 'Maisy Smith';
UPDATE visits SET visit_date = ('5-1-2020') WHERE visit_date IS NULL;

INSERT INTO visits (animal_id, vet_id) SELECT animals.id, vets.id FROM animals, vets WHERE animals.name = 'Pikachu' AND vets.name = 'Maisy Smith';
UPDATE visits SET visit_date = ('8-3-2020') WHERE visit_date IS NULL;

INSERT INTO visits (animal_id, vet_id) SELECT animals.id, vets.id FROM animals, vets WHERE animals.name = 'Pikachu' AND vets.name = 'Maisy Smith';
UPDATE visits SET visit_date = ('14-5-2020') WHERE visit_date IS NULL;

INSERT INTO visits (animal_id, vet_id) SELECT animals.id, vets.id FROM animals, vets WHERE animals.name = 'Devimon' AND vets.name = 'Stephanie Mendez';
UPDATE visits SET visit_date = ('4-5-2021') WHERE visit_date IS NULL;

INSERT INTO visits (animal_id, vet_id) SELECT animals.id, vets.id FROM animals, vets WHERE animals.name = 'Charmander' AND vets.name = 'Jack Harkness';
UPDATE visits SET visit_date = ('24-2-2021') WHERE visit_date IS NULL;

INSERT INTO visits (animal_id, vet_id) SELECT animals.id, vets.id FROM animals, vets WHERE animals.name = 'Plantmon' AND vets.name = 'Maisy Smith';
UPDATE visits SET visit_date = ('21-12-2019') WHERE visit_date IS NULL;

INSERT INTO visits (animal_id, vet_id) SELECT animals.id, vets.id FROM animals, vets WHERE animals.name = 'Plantmon' AND vets.name = 'William Tatcher';
UPDATE visits SET visit_date = ('10-8-2020') WHERE visit_date IS NULL;

INSERT INTO visits (animal_id, vet_id) SELECT animals.id, vets.id FROM animals, vets WHERE animals.name = 'Plantmon' AND vets.name = 'Maisy Smith';
UPDATE visits SET visit_date = ('7-4-2021') WHERE visit_date IS NULL;

INSERT INTO visits (animal_id, vet_id) SELECT animals.id, vets.id FROM animals, vets WHERE animals.name = 'Squirtle' AND vets.name = 'Stephanie Mendez';
UPDATE visits SET visit_date = ('29-9-2019') WHERE visit_date IS NULL;

INSERT INTO visits (animal_id, vet_id) SELECT animals.id, vets.id FROM animals, vets WHERE animals.name = 'Angemon' AND vets.name = 'Jack Harkness';
UPDATE visits SET visit_date = ('3-10-2020') WHERE visit_date IS NULL;

INSERT INTO visits (animal_id, vet_id) SELECT animals.id, vets.id FROM animals, vets WHERE animals.name = 'Angemon' AND vets.name = 'Jack Harkness';
UPDATE visits SET visit_date = ('4-11-2020') WHERE visit_date IS NULL;

INSERT INTO visits (animal_id, vet_id) SELECT animals.id, vets.id FROM animals, vets WHERE animals.name = 'Boarmon' AND vets.name = 'Maisy Smith';
UPDATE visits SET visit_date = ('24-1-2019') WHERE visit_date IS NULL;

INSERT INTO visits (animal_id, vet_id) SELECT animals.id, vets.id FROM animals, vets WHERE animals.name = 'Boarmon' AND vets.name = 'Maisy Smith';
UPDATE visits SET visit_date = ('15-5-2019') WHERE visit_date IS NULL;

INSERT INTO visits (animal_id, vet_id) SELECT animals.id, vets.id FROM animals, vets WHERE animals.name = 'Boarmon' AND vets.name = 'Maisy Smith';
UPDATE visits SET visit_date = ('27-2-2020') WHERE visit_date IS NULL;

INSERT INTO visits (animal_id, vet_id) SELECT animals.id, vets.id FROM animals, vets WHERE animals.name = 'Boarmon' AND vets.name = 'Maisy Smith';
UPDATE visits SET visit_date = ('8-3-2020') WHERE visit_date IS NULL;

INSERT INTO visits (animal_id, vet_id) SELECT animals.id, vets.id FROM animals, vets WHERE animals.name = 'Blossom' AND vets.name = 'Stephanie Mendez';
UPDATE visits SET visit_date = ('5-24-2020') WHERE visit_date IS NULL;

INSERT INTO visits (animal_id, vet_id) SELECT animals.id, vets.id FROM animals, vets WHERE animals.name = 'Blossom' AND vets.name = 'William Tatcher';
UPDATE visits SET visit_date = ('11-1-2021') WHERE visit_date IS NULL;