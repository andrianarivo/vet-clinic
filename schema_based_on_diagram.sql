CREATE TABLE patients (
	id SERIAL PRIMARY KEY NOT NULL,
	name VARCHAR(255),
	date_of_birth DATE
);

CREATE TABLE invoices (
	id SERIAL PRIMARY KEY NOT NULL,
	total_amount DECIMAL,
	generated_at TIMESTAMP,
	payed_at TIMESTAMP,
	medical_history_id INT
);

CREATE TABLE medical_histories (
	id SERIAL PRIMARY KEY NOT NULL,
	admitted_at TIMESTAMP,
	patient_id INT,
	status VARCHAR(255)
);

CREATE TABLE invoice_items (
	id SERIAL PRIMARY KEY NOT NULL,
	unit_price DECIMAL,
	quantity INT,
	total_price DECIMAL,
	invoice_id INT,
	treatment_id INT
);

CREATE TABLE treatments (
	id SERIAL PRIMARY KEY NOT NULL,
	type VARCHAR(255),
	name VARCHAR(255)
);

CREATE TABLE treatments_histories (
	medical_histories_id INT,
	treatments_id INT,
	PRIMARY KEY (medical_histories_id, treatments_id)
);
