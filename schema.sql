/* Database schema to keep the structure of entire database. */
CREATE TABLE animals (
    id INT,
    name TEXT,
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL,
);
ALTER TABLE animals ADD COLUMN  species TEXT;

CREATE TABLE owners (
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
    full_name TEXT,
    age INT,
    PRIMARY KEY (id)
);

CREATE TABLE species(
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
    name TEXT,
    PRIMARY KEY(id)
);

ALTER TABLE animals DROP COLUMN species;

ALTER TABLE animals ADD COLUMN species_id INT REFERENCES species(id) ON DELETE CASCADE;
ALTER TABLE animals ADD COLUMN owner_id INT REFERENCES owners(id) ON DELETE CASCADE;

CREATE TABLE vets (
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
    name TEXT,
    age INT,
    date_of_graduation DATE,
    PRIMARY KEY(id)
);

CREATE TABLE specializations (
    species_id INT NOT NULL,
    vet_id INT NOT NULL,
    FOREIGN KEY (species_id) REFERENCES species(id),
    FOREIGN KEY (vet_id) REFERENCES vets(id),
    PRIMARY KEY (species_id, vet_id)
);

CREATE TABLE visits (
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
    animal_id INT NOT NULL,
    vet_id INT NOT NULL,
    visit_date DATE,
    FOREIGN KEY (animal_id) REFERENCES animals(id),
    FOREIGN KEY (vet_id) REFERENCES vets(id),
    PRIMARY KEY (id)
);
