CREATE TABLE patients ( id INT GENERATED ALWAYS AS IDENTITY, name VARCHAR(255) NOT NULL, date_of_birth DATE NOT NULL, PRIMARY KEY(id));


CREATE TABLE medical_histories ( id INT GENERATED ALWAYS AS IDENTITY, admitted_at TIMESTAMP, patient_id INT NOT NULL, status VARCHAR(20), PRIMARY KEY(id), FOREIGN KEY (patient_id) REFERENCES patients (id) ON DELETE CASCADE);

/* patient_id */

CREATE TABLE invoices ( id INT GENERATED ALWAYS AS IDENTITY, total_amount DECIMAL, generated_at TIMESTAMP, payed_at TIMESTAMP, medical_history_id INT, PRIMARY KEY (id), FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id));

/* medical_history_id */


CREATE TABLE treatments ( id INT GENERATED ALWAYS AS IDENTITY, type VARCHAR(20), name VARCHAR(20), PRIMARY KEY(id));

CREATE TABLE invoice_items ( id INT GENERATED ALWAYS AS IDENTITY, unit_price DECIMAL, quantity INT, total_price DECIMAL, invoice_id INT, treatment_id INT, PRIMARY KEY(id), FOREIGN KEY (invoice_id) REFERENCES invoices(id), FOREIGN KEY (treatment_id) REFERENCES treatments(id));

/* invoice_id , treatment_id */


CREATE TABLE medical_treatment ( id INT GENERATED ALWAYS AS IDENTITY, medical_histories_id INT, treatments_id INT, PRIMARY KEY(id), FOREIGN KEY (medical_histories_id) REFERENCES medical_histories(id), FOREIGN KEY (treatments_id) REFERENCES treatments(id));

/* medical_histories_id  ,  treatments_id */




