CREATE DATABASE IF NOT EXISTS patientsdb;
  
USE patientsdb;

DROP TABLE IF EXISTS patients;

CREATE TABLE patients (
  full_name  VARCHAR(255) DEFAULT NULL,
  phone      VARCHAR(255) DEFAULT NULL,
  address    VARCHAR(255) DEFAULT NULL,
  age  VARCHAR(255) DEFAULT NULL,
  gender VARCHAR(255) DEFAULT NULL,
  prescription VARCHAR(255) DEFAULT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (age),
  CONSTRAINT UQ_Patients_phone UNIQUE (phone)
);

DELIMITER //
CREATE PROCEDURE create_and_return(IN full_name VARCHAR(255),  IN phone VARCHAR(255), IN  age VARCHAR(255),IN address VARCHAR(255), IN gender VARCHAR(255), IN prescription VARCHAR(255))
BEGIN
  INSERT INTO patients (full_name, phone, address, age, gender, prescription) VALUES (full_name, phone, address, age, gender, prescription);

  SET @PATIENT_AGE= LAST_INSERT_AGE();

  SELECT * FROM patients WHERE age=@PATIENT_AGE;
END //
DELIMITER ;
