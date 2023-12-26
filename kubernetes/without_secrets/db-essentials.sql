CREATE DATABASE IF NOT EXISTS patientsdb;

USE patientsdb;

DROP TABLE IF EXISTS patients;

CREATE TABLE patients (
  id         BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  first_name VARCHAR(255) DEFAULT NULL,
  father_name  VARCHAR(255) DEFAULT NULL,
  phone      VARCHAR(255) DEFAULT NULL,
  address    VARCHAR(255) DEFAULT NULL,
  age  VARCHAR(255) DEFAULT NULL,
  gender VARCHAR(255) DEFAULT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  CONSTRAINT UQ_Patients_phone UNIQUE (phone)
);

DELIMITER //
CREATE PROCEDURE create_and_return(IN first_name VARCHAR(255), IN father_name VARCHAR(255),
                  IN phone VARCHAR(255), IN age VARCHAR(255), IN address VARCHAR(255), IN gender VARCHAR(255))
BEGIN
  INSERT INTO patients(first_name, father_name,  phone, address, age, gender) VALUES (first_name, father_name,  phone, address, age, gender);

  SET @PATIENT_ID = LAST_INSERT_ID();

  SELECT * FROM patients WHERE id=@PATIENT_ID;
END //
DELIMITER ;
