/* Database schema to keep the structure of entire database. */

/* DAY 1 */

CREATE TABLE animals (
	id SERIAL PRIMARY KEY NOT NULL,
	name VARCHAR(255),
	date_of_birth DATE,
	escape_attempts INTEGER,
	neutered BOOLEAN,
	weight_kg DECIMAL
);

/* DAY 2 */

ALTER TABLE animals ADD species VARCHAR(255);

/* DAY 3 */

CREATE TABLE owners (
	id INTEGER GENERATED ALWAYS AS IDENTITY,
	full_name VARCHAR(255),
	age INTEGER,
	PRIMARY KEY(id)
);

CREATE TABLE species (
	id INTEGER GENERATED ALWAYS AS IDENTITY,
	name VARCHAR(255),
	PRIMARY KEY(id)
);

ALTER TABLE animals DROP COLUMN species;

ALTER TABLE animals ADD species_id INTEGER;

ALTER TABLE animals ADD CONSTRAINT fk_species FOREIGN KEY(species_id) REFERENCES species(id);

ALTER TABLE animals ADD owner_id INTEGER;

ALTER TABLE animals ADD CONSTRAINT fk_owners FOREIGN KEY(owner_id) REFERENCES owners(id);

/* DAY 4 */

CREATE TABLE vets (
	id SERIAL PRIMARY KEY NOT NULL,
	name VARCHAR(255),
	age INTEGER,
	date_of_graduation DATE
);

CREATE TABLE specializations (
	vet_id INTEGER,
	species_id INTEGER,
	PRIMARY KEY(vet_id, species_id),
	CONSTRAINT fk_specializations_vets FOREIGN KEY(vet_id) REFERENCES vets(id),
	CONSTRAINT fk_specializations_species FOREIGN KEY(species_id) REFERENCES species(id)
);

CREATE TABLE visits (
	animal_id INTEGER,
	vet_id INTEGER,
	date_of_visit DATE,
	PRIMARY KEY(vet_id, animal_id, date_of_visit),
	CONSTRAINT fk_visits_vets FOREIGN KEY(vet_id) REFERENCES vets(id),
	CONSTRAINT fk_visits_animals FOREIGN KEY(animal_id) REFERENCES animals(id)
);

/* PERFORMANCE AUDIT */

ALTER TABLE visits DROP CONSTRAINT visits_pkey;
ALTER TABLE owners ADD COLUMN email VARCHAR(120);
CREATE INDEX visits_animal_id_asc ON visits(animal_id ASC);
CREATE INDEX visits_vet_id_asc ON visits(vet_id ASC);
CREATE INDEX visits_date_of_visit_asc ON visits(date_of_visit ASC);
CREATE INDEX owners_email_asc ON owners(email ASC);
