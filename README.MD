# 🏥 Sistema de Agendamento de Clínica

🇧🇷 [Português](#-português) | 🇺🇸 [English](#-english)

---

# 🇧🇷 Português

## 📌 Sobre o projeto

Este projeto consiste na modelagem e implementação de uma base de dados relacional para um **Sistema de Agendamento de Clínica Médica**.

O sistema foi desenvolvido para praticar conceitos essenciais de **Engenharia e Modelagem de Dados**, cobrindo o ciclo completo de desenvolvimento:

- Modelo Conceitual (DER / Modelo Entidade-Relacionamento)
- Modelo Lógico (Mapeamento de Cardinais e Chaves)
- Modelo Físico (SQL DDL)
- Chaves Primárias (`PRIMARY KEY`) e Estrangeiras (`FOREIGN KEY`)
- Relacionamentos 1:N
- Atributos Multivalorados
- Restrições de Integridade (`CHECK`, `NOT NULL`)

---

## 🎯 Objetivo

O objetivo é gerir com precisão os fluxos operacionais da clínica, permitindo o controlo de:

- **Especialidades Médicas:** Registo das áreas de atuação da clínica.
- **Médicos:** Associação de cada profissional a uma especialidade e registo de dados pessoais.
- **Pacientes:** Registo de dados pessoais e gestão de múltiplos números de contacto.
- **Consultas:** Agendamento com controlo de data, hora, motivo e estado do atendimento.
- **Prescrições:** Emissão de receitas médicas associadas às consultas realizadas.

---

## 🗂️ Estrutura da Base de Dados

A base de dados é composta por **6 tabelas**:

### 1. `SPECIALITY`
Armazena as especialidades médicas oferecidas pela clínica.
- `speciality_id` — Chave Primária (`INT`)
- `name` — Nome da especialidade (`VARCHAR`)

### 2. `DOCTOR`
Armazena os médicos registados na clínica.
- `doctor_id` — Chave Primária (`INT`)
- `name` — Nome do médico (`VARCHAR`)
- `gender` — Género do médico (`VARCHAR`)
- `speciality_id` — Chave Estrangeira para `SPECIALITY` (`INT`)

### 3. `PATIENT`
Armazena os dados dos pacientes.
- `patient_id` — Chave Primária (`INT`)
- `name` — Nome do paciente (`VARCHAR`)
- `gender` — Género do paciente (`VARCHAR`)

### 4. `PATIENT_PHONE`
Modela o atributo multivalorado de contactos do paciente.
- `patient_id` — Chave Estrangeira para `PATIENT` (`INT`)
- `phone` — Número de telefone (`VARCHAR`)
- **Chave Primária Composta:** `(patient_id, phone)`

### 5. `APPOINTMENT`
Representa as consultas agendadas entre médicos e pacientes.
- `appointment_id` — Chave Primária (`INT`)
- `date` — Data da consulta (`DATE`)
- `time` — Horário da consulta (`TIME`)
- `reason` — Motivo da consulta (`VARCHAR`)
- `status` — Estado da consulta (`VARCHAR` com restrição `CHECK`: `'Scheduled'`, `'Completed'`, `'Cancelled'`)
- `id_doctor` — Chave Estrangeira para `DOCTOR` (`INT`)
- `id_patient` — Chave Estrangeira para `PATIENT` (`INT`)

### 6. `PRESCRIPTION`
Armazena as prescrições médicas geradas a partir de uma consulta.
- `prescription_id` — Chave Primária (`INT`)
- `medication` — Nome do medicamento (`VARCHAR`)
- `dosage` — Dosagem recomendada (`VARCHAR`)
- `treatment_duration` — Duração do tratamento (`VARCHAR`)
- `id_appointment` — Chave Estrangeira para `APPOINTMENT` (`INT`)

---
# 🏥 Medical Clinic Scheduling System

## 📌 About the Project

This project involves the modeling and implementation of a relational database for a **Medical Clinic Scheduling System**.

It was developed to practice fundamental concepts of **Data Engineering and Database Design**, covering the full development lifecycle:

- **Conceptual Model:** Entity-Relationship Diagram (ERD)
- **Logical Model:** Cardinality mapping and key design
- **Physical Model:** SQL DDL script
- **Referential Integrity:** Primary Keys (`PRIMARY KEY`) and Foreign Keys (`FOREIGN KEY`)
- **Advanced Modeling:** 1:N relationships, multivalued attributes, and validation constraints (`CHECK`)

---

## 🎯 Objectives

Accurately model operational workflows to manage:

- 🩺 **Specialties:** Registration of medical practice fields.
- 👨‍⚕️ **Doctors:** Association of each medical professional with a specialty and personal data registration.
- 👤 **Patients:** Management of patient records and multiple contact phone numbers.
- 📅 **Appointments:** Scheduling with date, time, reason, and status tracking.
- 💊 **Prescriptions:** Issuance of medical prescriptions tied directly to completed appointments.

---

## 🗂️ Database Schema

The database consists of **6 tables**:

### 1. `SPECIALITY`
Stores medical specialties offered by the clinic.
- `speciality_id` — Primary Key (`INT`)
- `name` — Specialty name (`VARCHAR`)

### 2. `DOCTOR`
Stores registered doctors.
- `doctor_id` — Primary Key (`INT`)
- `name` — Doctor's name (`VARCHAR`)
- `gender` — Doctor's gender (`VARCHAR`)
- `speciality_id` — Foreign Key referencing `SPECIALITY` (`INT`)

### 3. `PATIENT`
Stores patient data.
- `patient_id` — Primary Key (`INT`)
- `name` — Patient's name (`VARCHAR`)
- `gender` — Patient's gender (`VARCHAR`)

### 4. `PATIENT_PHONE`
Models the multivalued contact attribute for patients.
- `patient_id` — Foreign Key referencing `PATIENT` (`INT`)
- `phone` — Phone number (`VARCHAR`)
- **Composite Primary Key:** `(patient_id, phone)`

### 5. `APPOINTMENT`
Represents scheduled appointments between doctors and patients.
- `appointment_id` — Primary Key (`INT`)
- `date` — Appointment date (`DATE`)
- `time` — Appointment time (`TIME`)
- `reason` — Reason for the visit (`VARCHAR`)
- `status` — Appointment status (`VARCHAR` with `CHECK` constraint: `'Scheduled'`, `'Completed'`, `'Cancelled'`)
- `id_doctor` — Foreign Key referencing `DOCTOR` (`INT`)
- `id_patient` — Foreign Key referencing `PATIENT` (`INT`)

### 6. `PRESCRIPTION`
Stores medical prescriptions generated from an appointment.
- `prescription_id` — Primary Key (`INT`)
- `medication` — Medication name (`VARCHAR`)
- `dosage` — Recommended dosage (`VARCHAR`)
- `treatment_duration` — Duration of treatment (`VARCHAR`)
- `id_appointment` — Foreign Key referencing `APPOINTMENT` (`INT`)


## 💻 Script SQL (DDL)

```sql
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
    id_doctor INT NOT NULL,
    id_patient INT NOT NULL,

    FOREIGN KEY (id_doctor)
        REFERENCES DOCTOR(doctor_id),

    FOREIGN KEY (id_patient)
        REFERENCES PATIENT(patient_id)
);

CREATE TABLE PRESCRIPTION (
    prescription_id INT PRIMARY KEY,
    medication VARCHAR(100) NOT NULL,
    dosage VARCHAR(100) NOT NULL,
    treatment_duration VARCHAR(50) NOT NULL,
    id_appointment INT NOT NULL,

    FOREIGN KEY (id_appointment)
        REFERENCES APPOINTMENT(appointment_id)
);