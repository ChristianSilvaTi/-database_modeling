CREATE TABLE SPECIALITY (
    speciality_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE DOCTOR (
    doctor_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    gender VARCHAR(20) NOT NULL,
    speciality_id INT NOT NULL,

    FOREIGN KEY (speciality_id)
        REFERENCES SPECIALITY(speciality_id)
);

CREATE TABLE PATIENT (
    patient_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    gender VARCHAR(20) NOT NULL
);

CREATE TABLE PATIENT_PHONE (
    patient_id INT NOT NULL,
    phone VARCHAR(20) NOT NULL,

    PRIMARY KEY (patient_id, phone),

    FOREIGN KEY (patient_id)
        REFERENCES PATIENT(patient_id)
);

CREATE TABLE APPOINTMENT (
    appointment_id INT PRIMARY KEY,
    date DATE NOT NULL,
    time TIME NOT NULL,
    reason VARCHAR(255) NOT NULL,
    status VARCHAR(20) NOT NULL
        CHECK (status IN ('Scheduled', 'Completed', 'Cancelled')),
    doctor_id INT NOT NULL,
    patient_id INT NOT NULL,

    FOREIGN KEY (doctor_id)
        REFERENCES DOCTOR(doctor_id),

    FOREIGN KEY (patient_id)
        REFERENCES PATIENT(patient_id)
);

CREATE TABLE PRESCRIPTION (
    prescription_id INT PRIMARY KEY,
    medication VARCHAR(100) NOT NULL,
    dosage VARCHAR(100) NOT NULL,
    treatment_duration VARCHAR(50) NOT NULL,
    appointment_id INT NOT NULL,

    FOREIGN KEY (appointment_id)
        REFERENCES APPOINTMENT(appointment_id)
);