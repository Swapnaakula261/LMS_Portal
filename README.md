📚 Learning Management System (LMS) – Database Project

This repository contains the SQL schema, ER diagram, and sample data insertion scripts for a basic Learning Management System (LMS). The project demonstrates database design concepts such as table creation, primary keys, foreign key relationships, and sample data population.

📁 Repository Contents
File	Description
LMS_DB.sql	Complete SQL script containing database creation, tables, foreign keys, and data insertion.
Swapna_LMS.drawio	ER Diagram illustrating relationships between all tables in the LMS database.
🗄️ Database Overview

The LMS database is designed to manage:

Users (Admins, Students, Instructors)

Courses & course content

Assignments and submissions

Student enrollments

Materials associated with courses

The database follows a clear relational model using primary keys, foreign keys, and junction tables for many-to-many relationships.

🧱 Database Schema Summary
1. User Management Tables

New_user – Stores all basic user information.

Existed_user – Login credentials for system users.

Admin_user – Admin-specific details.

Student – Student profiles.

Instructor – Instructor profiles.

2. Course Management Tables

New_course – Courses created by admins.

Courses – Courses with learning materials, assignments, and submissions.

Material – Course material (PDFs, notes, docs, etc.)

Assignment – Assignments linked to submissions.

Submissions – Student submissions and marks.

3. Enrollment

Enrollment – Many-to-many relationship between Students and Courses.

🔗 Foreign Key Relationships

Some important relationships include:

Existed_user.User_ID → New_user.User_ID

Admin_user.User_ID → Existed_user.User_ID

Student.User_ID → Existed_user.User_ID

Instructor.User_ID → Existed_user.User_ID

New_course.Instructor_ID → Instructor.Instructor_ID

Courses.Course_id → New_course.Course_id

Courses.MaterialID → Material.MaterialID

Courses.AssignmentID → Assignment.AssignmentID

Assignment.SubmissionID → Submissions.SubmissionID

Enrollment(Student_ID, Course_ID) creating many-to-many join

These relationships ensure referential integrity and proper linking of LMS components.

📝 How to Use
1. Import the Database

Run the full SQL script:

source LMS_DB.sql;


OR manually:

CREATE DATABASE LMS_DB;
USE LMS_DB;


Then execute the table creation and data insertion statements.

📊 ER Diagram

The ER diagram (stored in Swapna_LMS.drawio) visualizes how all entities relate:

One-to-Many relationship between Instructor → Courses

One-to-Many between Course → Material, Assignment, Submission

Many-to-Many between Student ↔ Courses through the Enrollment table

One-to-One relationships for login credentials between New_user, Existed_user

🧪 Sample Data Included

The SQL script includes:

36 Users

20 Students

11 Instructors

5 Admins

14 Courses

Assignments, Submissions, and Materials for each course

Enrollment records mapping students to courses

This provides a ready-to-test database environment.

🎯 Purpose of This Project

This LMS database can be used for:

SQL practice

Understanding database modelling

Backend integration projects

Academic assignments

Learning ER diagrams and constraints
