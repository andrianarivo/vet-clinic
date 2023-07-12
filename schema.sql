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