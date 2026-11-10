# University Student Information Management System

## Project Overview

The University Student Information Management System is a relational database project developed using MySQL and phpMyAdmin. The system is designed to manage student records, courses, course registration, examination results, and fee payments.

## Objectives

The project demonstrates:

- Relational database design
- Database normalization up to Third Normal Form (3NF)
- Primary and foreign keys
- Stored procedures
- Triggers
- Views
- Indexing
- Database security and user privileges
- Database backup and recovery

## Database Modules

The system contains the following main modules:

1. Student Management
2. Course Management
3. Course Registration
4. Examination Management
5. Fee Management

## Database Tables

The database contains seven main tables:

- `departments`
- `students`
- `courses`
- `registrations`
- `examinations`
- `results`
- `fees`

## Advanced Database Features

### Stored Procedure

A stored procedure named `GetStudentDetails` retrieves student information using an admission number.

### Trigger

A trigger named `CheckMarksBeforeInsert` prevents examination marks outside the valid range of 0 to 100 from being inserted.

### View

The `student_examination_results` view combines student, course, examination, and result information to display examination results.

### Index

An index is created on the `last_name` column of the `students` table to improve student record searches.

### Database Security

Different MySQL users and privileges were created to demonstrate database access control, including administrator and lecturer roles.

### Backup and Recovery

The database was exported as an SQL backup file and successfully restored into a separate database to demonstrate recovery.

## Technologies Used

- MySQL
- XAMPP
- phpMyAdmin
- SQL

## Project Structure

```text
University-Student-Management-System/
│
├── database/
│   └── university_student_management.sql
│
└── README.md
```

## Author

Hannah Ndungu

Kirinyaga University
Bachelor of Information Technology
