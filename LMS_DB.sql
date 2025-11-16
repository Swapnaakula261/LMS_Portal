-- use database
create database if not exists LMS_DB;
use LMS_DB;

-- Table: New_user
create table if not exists New_user (
    User_ID varchar(20) primary key,
    User_name varchar(30),
    Password varchar(20),
    Role varchar(20),
    Details varchar(200),
    Course_Details varchar(200),
    Role_ID varchar(20),
    Created_by varchar(20)
);

-- Table: Existed_user
create table if not exists Existed_user (
    User_ID varchar(20) primary key,
    Password varchar(10),
    Role varchar(20)
);

-- Table: Admin_user
create table if not exists Admin_user (
    Admin_id varchar(20) primary key,
    User_ID varchar(20),
    Fullname varchar(30),
    Email varchar(30)
);

-- Table: Student
create table if not exists Student (
    Student_ID varchar(20) primary key,
    User_ID varchar(20),
    Fullname varchar(30),
    Email varchar(30),
    Phone_number varchar(10),
    Date_of_Birth date,
    Enrollment_date date
);

-- Table: Instructor
create table if not exists Instructor (
    Instructor_ID varchar(20) primary key,
    User_ID varchar(20),
    Fullname varchar(30),
    Email varchar(30),
    Phone_number varchar(10),
    Joined_date date,
    Department varchar(20)
);

-- Table: New_course
create table if not exists New_course (
    Course_id varchar(20) primary key,
    Instructor_ID varchar(20),
    Course_name varchar(30),
    Course_Description varchar(200),
    Duration varchar(50),
    size int,
    Start_date date,
    End_date date,
    Credits float,
    created_by varchar(20)
);

-- Table: Courses
create table if not exists Courses (
    Course_id varchar(20) primary key,
    Instructor_ID varchar(20),
    Course_name varchar(30),
    Course_Description varchar(200),
    Duration varchar(50),
    Start_date date,
    End_date date,
    MaterialID varchar(20),
    AssignmentID varchar(20),
    SubmissionID varchar(20),
    Course_status varchar(200)
);

-- Table: Material
CREATE TABLE IF NOT EXISTS Material (
    MaterialID varchar(20) PRIMARY KEY,
    Course_Materials varchar(500),
    AssignmentID varchar(20)
);
-- Table: Assignment
create table if not exists Assignment (
    AssignmentID varchar(20) primary key,
    Assignment varchar(500),
    SubmissionID varchar(20),
    Due_date date
);

-- Table: Submissions
create table if not exists Submissions (
    SubmissionID varchar(20) primary key,
    Submitted_file varchar(200),
    marks float,
    submitted_time date
);

-- all Forign key relations

ALTER TABLE Existed_user
ADD FOREIGN KEY (User_ID) REFERENCES New_user(User_ID);

ALTER TABLE Admin_user
ADD FOREIGN KEY (User_ID) REFERENCES Existed_user(User_ID);

ALTER TABLE Student
ADD FOREIGN KEY (User_ID) REFERENCES Existed_user(User_ID);

ALTER TABLE Instructor
ADD FOREIGN KEY (User_ID) REFERENCES Existed_user(User_ID);

ALTER TABLE New_course
ADD FOREIGN KEY (Instructor_ID) REFERENCES Instructor(Instructor_ID),
ADD FOREIGN KEY (created_by) REFERENCES Admin_user(Admin_id);

ALTER TABLE Courses
ADD FOREIGN KEY (Course_id) REFERENCES New_course(Course_id),
ADD FOREIGN KEY (Instructor_ID) REFERENCES Instructor(Instructor_ID),
ADD FOREIGN KEY (MaterialID) REFERENCES Material(MaterialID),
ADD FOREIGN KEY (AssignmentID) REFERENCES Assignment(AssignmentID),
ADD FOREIGN KEY (SubmissionID) REFERENCES Submissions(SubmissionID);


ALTER TABLE Material
ADD FOREIGN KEY (AssignmentID) REFERENCES Assignment(AssignmentID);

ALTER TABLE Assignment
ADD FOREIGN KEY (SubmissionID) REFERENCES Submissions(SubmissionID);

-- Table: Enrollment
create table if not exists Enrollment (
    Student_ID varchar(20),
    Course_ID varchar(20),
    primary key (Student_ID, Course_ID),
    foreign key (Student_ID) references Student(Student_ID),
    foreign key (Course_ID) references Courses(Course_id)
);


-- INSERTING DATA


-- New_user
INSERT INTO New_user (User_ID, User_name, Password, Role, Details, Course_Details, Role_ID, Created_by) VALUES
('U001', 'Swapna','admin@123', 'Admin', 'Admin of LMS portal', 'All Courses', 'A01', 'System'),
('U002', 'Joshua', 'stud@123', 'Student', 'Enrolled in Data Analysis and Python Programming', 'Data Analysis, Python Programming', 'S01', 'A01'),
('U003', 'Moksha', 'stud@234', 'Student', 'Enrolled in Web Development and Excel', 'Web Development, Excel', 'S02', 'A01'),
('U004', 'Shravanthi', 'stud@345', 'Student', 'Enrolled in Soft Skills and Python Programming', 'Soft Skills, Python Programming', 'S03', 'A01'),
('U005', 'Sita', 'stud@456', 'Student', 'Enrolled in Data Analysis and Soft Skills', 'Data Analysis, Soft Skills', 'S04', 'A01'),
('U006', 'Madhu', 'stud@567', 'Student', 'Enrolled in Excel and Web Development', 'Excel, Web Development', 'S05', 'A01'),
('U007', 'Pavan', 'inst@111', 'Instructor', 'Teaches Data Analysis', 'Data Analysis', 'I01', 'A01'),
('U008', 'Dinesh', 'inst@222', 'Instructor', 'Teaches Web Development', 'Web Development', 'I02', 'A01'),
('U009', 'Sushmitha', 'inst@333', 'Instructor', 'Teaches Soft Skills', 'Soft Skills', 'I03', 'A01'),
('U010', 'Anitha', 'inst@444', 'Instructor', 'Teaches Python Programming', 'Python Programming', 'I04', 'A01'),
('U011', 'Vijaya', 'inst@555', 'Instructor', 'Teaches Excel', 'Excel', 'I05', 'A01'),
('U012', 'Satya', 'admin@222', 'Admin', 'Handles academic operations', 'All courses', 'A02', 'System'),
('U013', 'Rohit', 'admin@333', 'Admin', 'Handles scheduling and events', 'All Courses', 'A03', 'System'),
('U014', 'Meera', 'admin@444', 'Admin', 'Handles course content management', 'All Courses', 'A04', 'System'),
('U015', 'Kiran', 'admin@555', 'Admin', 'Handles reporting and analytics', 'All Courses', 'A05', 'System'),
('U016', 'Anil', 'inst@666', 'Instructor', 'Teaches AI and ML', 'AI & ML', 'I06', 'A03'),
('U017', 'Sonal', 'inst@777', 'Instructor', 'Teaches Cybersecurity', 'Cybersecurity', 'I07', 'A03'),
('U018', 'Ritika', 'inst@888', 'Instructor', 'Teaches Cloud Computing', 'Cloud Computing', 'I08', 'A04'),
('U019', 'Aditya', 'inst@999', 'Instructor', 'Teaches Java Programming', 'Java Programming', 'I09', 'A04'),
('U020', 'Harsha', 'inst@1010', 'Instructor', 'Teaches Networking', 'Networking', 'I10', 'A05'),
('U021', 'Neha', 'inst@1111', 'Instructor', 'Teaches Database Systems', 'Database Systems', 'I11', 'A05'),
('U022', 'Aarya', 'stud@678', 'Student', 'Enrolled in AI Basics', 'AI Basics', 'S06', 'A03'),
('U023', 'Vikram', 'stud@789', 'Student', 'Enrolled in Cybersecurity Essentials', 'Cybersecurity Essentials', 'S07', 'A03'),
('U024', 'Tanvi', 'stud@890', 'Student', 'Enrolled in AI Basics', 'AI Basics', 'S08', 'A03'),
('U025', 'Rohan', 'stud@901', 'Student', 'Enrolled in Machine Learning', 'Machine Learning', 'S09', 'A03'),
('U026', 'Diya', 'stud@012', 'Student', 'Enrolled in Cybersecurity Essentials', 'Cybersecurity Essentials', 'S10', 'A03'),
('U027', 'Aryan', 'stud@1234', 'Student', 'Enrolled in Cloud Computing', 'Cloud Computing', 'S11', 'A04'),
('U028', 'Megha', 'stud@2345', 'Student', 'Enrolled in Java Programming', 'Java Programming', 'S12', 'A04'),
('U029', 'Ishaan', 'stud@3456', 'Student', 'Enrolled in Advanced Cloud', 'Advanced Cloud', 'S13', 'A04'),
('U030', 'Priya', 'stud@4567', 'Student', 'Enrolled in Cloud Computing', 'Cloud Computing', 'S14', 'A04'),
('U031', 'Ritesh', 'stud@5678', 'Student', 'Enrolled in Java Programming', 'Java Programming', 'S15', 'A04'),
('U032', 'Ananya', 'stud@6789', 'Student', 'Enrolled in Networking Fundamentals', 'Networking Fundamentals', 'S16', 'A05'),
('U033', 'Karthik', 'stud@7890', 'Student', 'Enrolled in Database Systems', 'Database Systems', 'S17', 'A05'),
('U034', 'Sana', 'stud@8901', 'Student', 'Enrolled in Networking Fundamentals', 'Networking Fundamentals', 'S18', 'A05'),
('U035', 'Dev', 'stud@9012', 'Student', 'Enrolled in Database Systems', 'Database Systems', 'S19', 'A05'),
('U036', 'Nisha', 'stud@0123', 'Student', 'Enrolled in Networking Fundamentals', 'Networking Fundamentals', 'S20', 'A05');

-- Existed_user
INSERT INTO Existed_user (User_ID, Password, Role) VALUES
('U001', 'admin@123', 'Admin'),('U002', 'stud@123', 'Student'),('U003', 'stud@234', 'Student'),
('U004', 'stud@345', 'Student'),('U005', 'stud@456', 'Student'),('U006', 'stud@567', 'Student'),
('U007', 'inst@111', 'Instructor'),('U008', 'inst@222', 'Instructor'),('U009', 'inst@333', 'Instructor'),
('U010', 'inst@444', 'Instructor'),('U011', 'inst@555', 'Instructor'),('U012', 'admin@222', 'Admin'),
('U013', 'admin@333', 'Admin'),('U014', 'admin@444', 'Admin'),('U015', 'admin@555', 'Admin'),
('U016', 'inst@666', 'Instructor'),('U017', 'inst@777', 'Instructor'),('U018', 'inst@888', 'Instructor'),
('U019', 'inst@999', 'Instructor'),('U020', 'inst@1010', 'Instructor'),('U021', 'inst@1111', 'Instructor'),
('U022', 'stud@678', 'Student'),('U023', 'stud@789', 'Student'),('U024', 'stud@890', 'Student'),
('U025', 'stud@901', 'Student'),('U026', 'stud@012', 'Student'),('U027', 'stud@1234', 'Student'),
('U028', 'stud@2345', 'Student'),('U029', 'stud@3456', 'Student'),('U030', 'stud@4567', 'Student'),
('U031', 'stud@5678', 'Student'),('U032', 'stud@6789', 'Student'),('U033', 'stud@7890', 'Student'),
('U034', 'stud@8901', 'Student'),('U035', 'stud@9012', 'Student'),('U036', 'stud@0123', 'Student');

-- Admin_user
INSERT INTO Admin_user (Admin_id, User_ID, Fullname, Email) VALUES
('A01', 'U001', 'Swapna Akula', 'swapna.admin@example.com'),
('A02', 'U012', 'Satya Medidha', 'satya.admin@example.com'),
('A03', 'U013', 'Rohit Sharma', 'rohit.admin@example.com'),
('A04', 'U014', 'Meera Rao', 'meera.admin@example.com'),
('A05', 'U015', 'Kiran Kumar', 'kiran.admin@example.com');

-- Student
INSERT INTO Student (Student_ID, User_ID, Fullname, Email, Phone_number, Date_of_Birth, Enrollment_date) VALUES
('S01', 'U002', 'Joshua', 'joshua@gmail.com', '9876543210', '2002-06-15', '2024-07-01'),
('S02', 'U003', 'Moksha', 'moksha@gmail.com', '9876543211', '2003-02-20', '2024-07-02'),
('S03', 'U004', 'Shravanthi', 'shravanthi@gmail.com', '9876543212', '2001-11-08', '2024-07-03'),
('S04', 'U005', 'Sita', 'sita@gmail.com', '9876543213', '2002-09-25', '2024-07-04'),
('S05', 'U006', 'Madhu', 'madhu@gmail.com', '9876543214', '2003-04-10', '2024-07-05'),
('S06', 'U022', 'Aarya Sharma', 'aarya@gmail.com', '9876543215', '2003-01-05', '2024-08-01'),
('S07', 'U023', 'Vikram Singh', 'vikram@gmail.com', '9876543216', '2002-03-12', '2024-08-01'),
('S08', 'U024', 'Tanvi Mehta', 'tanvi@gmail.com', '9876543217', '2003-05-22', '2024-08-02'),
('S09', 'U025', 'Rohan Kumar', 'rohan@gmail.com', '9876543218', '2002-07-15', '2024-08-02'),
('S10', 'U026', 'Diya Rao', 'diya@gmail.com', '9876543219', '2003-09-08', '2024-08-03'),
('S11', 'U027', 'Aryan Verma', 'aryan@gmail.com', '9876543220', '2002-11-25', '2024-08-05'),
('S12', 'U028', 'Megha Singh', 'megha@gmail.com', '9876543221', '2003-12-10', '2024-08-05'),
('S13', 'U029', 'Ishaan Gupta', 'ishaan@gmail.com', '9876543222', '2002-06-18', '2024-08-06'),
('S14', 'U030', 'Priya Sharma', 'priya@gmail.com', '9876543223', '2003-02-25', '2024-08-06'),
('S15', 'U031', 'Ritesh Kumar', 'ritesh@gmail.com', '9876543224', '2002-04-30', '2024-08-07'),
('S16', 'U032', 'Ananya Reddy', 'ananya@gmail.com', '9876543225', '2003-03-12', '2024-08-08'),
('S17', 'U033', 'Karthik Rao', 'karthik@gmail.com', '9876543226', '2002-01-28', '2024-08-08'),
('S18', 'U034', 'Sana Verma', 'sana@gmail.com', '9876543227', '2003-07-19', '2024-08-09'),
('S19', 'U035', 'Dev Sharma', 'dev@gmail.com', '9876543228', '2002-09-14', '2024-08-09'),
('S20', 'U036', 'Nisha Gupta', 'nisha@gmail.com', '9876543229', '2003-06-05', '2024-08-10');

-- Instructor
INSERT INTO Instructor (Instructor_ID, User_ID, Fullname, Email, Phone_number, Joined_date, Department) VALUES
('I01', 'U007', 'Pavan', 'pavan.inst@example.com', '9876500001', '2024-01-10', 'Data Science'),
('I02', 'U008', 'Dinesh', 'dinesh.inst@example.com', '9876500002', '2024-01-12', 'Web Development'),
('I03', 'U009', 'Sushmitha', 'sushmitha.inst@example.com', '9876500003', '2024-01-14', 'Soft Skills'),
('I04', 'U010', 'Anitha', 'anitha.inst@example.com', '9876500004', '2024-01-16', 'Programming'),
('I05', 'U011', 'Vijaya', 'vijaya.inst@example.com', '9876500005', '2024-01-18', 'Data Tools'),
('I06', 'U016', 'Anil Verma', 'anil.inst@example.com', '9876500010', '2024-07-01', 'AI & ML'),
('I07', 'U017', 'Sonal Gupta', 'sonal.inst@example.com', '9876500011', '2024-07-02', 'Cybersecurity'),
('I08', 'U018', 'Ritika Singh', 'ritika.inst@example.com', '9876500012', '2024-07-03', 'Cloud Computing'),
('I09', 'U019', 'Aditya Sharma', 'aditya.inst@example.com', '9876500013', '2024-07-04', 'Java Programming'),
('I10', 'U020', 'Harsha Reddy', 'harsha.inst@example.com', '9876500014', '2024-07-05', 'Networking'),
('I11', 'U021', 'Neha Mehta', 'neha.inst@example.com', '9876500015', '2024-07-06', 'Database Systems');


-- New_course

INSERT INTO New_course (Course_id, Instructor_ID, Course_name, Course_Description, Duration, size, Start_date, End_date, Credits, created_by) VALUES
('C01','I01','Data Analysis','Introduction to Data Analysis','2 months',50,'2024-07-01','2024-08-31',3.0,'A01'),
('C02','I02','Web Development','Learn HTML, CSS, JS','3 months',40,'2024-07-01','2024-09-30',3.5,'A01'),
('C03','I03','Soft Skills','Communication and Leadership','1 month',30,'2024-07-15','2024-08-15',2.0,'A01'),
('C04','I04','Python Programming','Python basics to advanced','2 months',45,'2024-07-01','2024-08-31',3.0,'A01'),
('C05','I05','Excel','Advanced Excel techniques','1 month',35,'2024-07-01','2024-07-31',2.0,'A01'),
('C06','I06','AI Basics','Introduction to AI','2 months',40,'2024-08-01','2024-09-30',3.0,'A03'),
('C07','I07','Cybersecurity Essentials','Security fundamentals','1 month',30,'2024-08-01','2024-08-31',2.5,'A03'),
('C08','I06','Machine Learning','ML techniques and models','2 months',35,'2024-08-15','2024-10-15',3.5,'A03'),
('C09','I08','Cloud Computing','Cloud platforms and services','2 months',40,'2024-08-01','2024-09-30',3.0,'A04'),
('C10','I09','Java Programming','Java from basics to advanced','3 months',50,'2024-08-01','2024-10-31',3.5,'A04'),
('C11','I08','Advanced Cloud','Advanced cloud architectures','1 month',30,'2024-09-01','2024-09-30',2.5,'A04'),
('C12','I10','Networking Fundamentals','Networking basics and protocols','2 months',35,'2024-08-15','2024-10-15',3.0,'A05'),
('C13','I11','Database Systems','SQL and relational databases','2 months',40,'2024-08-01','2024-09-30',3.0,'A05'),
('C14','I10','Networking Advanced','Advanced networking concepts','1 month',30,'2024-09-01','2024-09-30',2.5,'A05');

-- Submissions

INSERT INTO Submissions (SubmissionID, Submitted_file, marks, submitted_time) VALUES
('S01','S28','100','2024-08-05'),
('S02','WebProj.zip','95','2024-09-10'),
('S03','SoftSkills.ppt','90','2024-08-10'),
('S04','PythonEx.py','98','2024-08-15'),
('S05','ExcelCase.xlsx','92','2024-07-25'),
('S06','AIQuiz.docx','88','2024-09-05'),
('S07','CyberLab.docx','85','2024-08-20'),
('S08','MLProj.zip','97','2024-10-01'),
('S09','CloudLab.pdf','93','2024-09-10'),
('S10','JavaProj.zip','96','2024-10-20'),
('S11','AdvCloud.docx','90','2024-09-25'),
('S12','NetFundLab.pdf','87','2024-10-05'),
('S13','DBSQL.sql','94','2024-09-15'),
('S14','NetAdvLab.pdf','91','2024-09-25'),
('S15','Submission15.pdf','85','2024-08-01'),
('S16','Submission16.pdf','88','2024-08-02'),
('S17','Submission17.pdf','92','2024-08-03'),
('S18','Submission18.pdf','90','2024-08-04'),
('S19','Submission19.pdf','95','2024-08-05'),
('S20','Submission20.pdf','93','2024-08-06'),
('S21','Submission21.pdf','89','2024-08-07'),
('S22','Submission22.pdf','87','2024-08-08'),
('S23','Submission23.pdf','90','2024-08-09'),
('S24','Submission24.pdf','91','2024-08-10'),
('S25','Submission25.pdf','92','2024-08-11'),
('S26','Submission26.pdf','94','2024-08-12'),
('S27','Submission27.pdf','96','2024-08-13'),
('S28','Submission28.pdf','100','2024-08-14'),
('S29','Submission29.pdf','97','2024-08-15');

-- Assignment
INSERT INTO Assignment (AssignmentID, Assignment, SubmissionID, Due_date) VALUES
('A01','Data Analysis Assignment 1','S01','2024-08-05'),
('A02','Web Development Project','S02','2024-09-10'),
('A03','Soft Skills Presentation','S03','2024-08-10'),
('A04','Python Programming Exercise','S04','2024-08-15'),
('A05','Excel Case Study','S05','2024-07-25'),
('A06','AI Basics Quiz','S06','2024-09-05'),
('A07','Cybersecurity Lab','S07','2024-08-20'),
('A08','Machine Learning Project','S08','2024-10-01'),
('A09','Cloud Computing Lab','S09','2024-09-10'),
('A10','Java Programming Project','S10','2024-10-20'),
('A11','Advanced Cloud Assignment','S11','2024-09-25'),
('A12','Networking Fundamentals Lab','S12','2024-10-05'),
('A13','Database SQL Assignment','S13','2024-09-15'),
('A14','Networking Advanced Lab','S14','2024-09-25');

-- Material

INSERT INTO Material (MaterialID, Course_Materials, AssignmentID) VALUES
('M01','Data Analysis Lecture Notes, Datasets','A01'),
('M02','HTML/CSS/JS Tutorials','A02'),
('M03','Communication Skills PDF, Leadership Videos','A03'),
('M04','Python Tutorials, Examples','A04'),
('M05','Excel Functions, Charts, Macros','A05'),
('M06','AI Slides, Exercises','A06'),
('M07','Cybersecurity Basics PDF, Labs','A07'),
('M08','ML Algorithms, Case Studies','A08'),
('M09','Cloud Platforms Docs, Labs','A09'),
('M10','Java Syntax, Projects','A10'),
('M11','Cloud Architectures Slides, Labs','A11'),
('M12','Networking Basics Docs, Labs','A12'),
('M13','Database Tutorials, SQL Scripts','A13'),
('M14','Networking Advanced Labs, Notes','A14');

-- Courses

INSERT INTO Courses (Course_id, Instructor_ID, Course_name, Course_Description, Duration, Start_date, End_date, MaterialID, AssignmentID, SubmissionID, Course_status) VALUES
('C01','I01','Data Analysis','Introduction to Data Analysis','2 months','2024-07-01','2024-08-31','M01','A01','S01','Active'),
('C02','I02','Web Development','Learn HTML, CSS, JS','3 months','2024-07-01','2024-09-30','M02','A02','S02','Active'),
('C03','I03','Soft Skills','Communication and Leadership','1 month','2024-07-15','2024-08-15','M03','A03','S03','Active'),
('C04','I04','Python Programming','Python basics to advanced','2 months','2024-07-01','2024-08-31','M04','A04','S04','Active'),
('C05','I05','Excel','Advanced Excel techniques','1 month','2024-07-01','2024-07-31','M05','A05','S05','Active'),
('C06','I06','AI Basics','Introduction to AI','2 months','2024-08-01','2024-09-30','M06','A06','S06','Active'),
('C07','I07','Cybersecurity Essentials ','Security fundamentals','1 month','2024-08-01','2024-08-31','M07','A07','S07','Active'),
('C08','I06','Machine Learning','ML techniques and models','2 months','2024-08-15','2024-10-15','M08','A08','S08','Active'),
('C09','I08','Cloud Computing','Cloud platforms and services','2 months','2024-08-01','2024-09-30','M09','A09','S09','Active'),
('C10','I09','Java Programming','Java from basics to advanced','3 months','2024-08-01','2024-10-31','M10','A10','S10','Active'),
('C11','I08','Advanced Cloud','Advanced cloud architectures','1 month','2024-09-01','2024-09-30','M11','A11','S11','Active'),
('C12','I10','Networking Fundamentals','Networking basics and protocols','2 months','2024-08-15','2024-10-15','M12','A12','S12','Active'),
('C13','I11','Database Systems','SQL and relational databases','2 months','2024-08-01','2024-09-30','M13','A13','S13','Active'),
('C14','I10','Networking Advanced','Advanced networking concepts','1 month','2024-09-01','2024-09-30','M14','A14','S14','Active');


-- Enrollment

INSERT INTO Enrollment (Student_ID, Course_ID) VALUES
('S01','C01'),('S01','C04'),
('S02','C02'),('S02','C05'),
('S03','C03'),('S03','C04'),
('S04','C01'),('S04','C03'),
('S05','C02'),('S05','C05'),
('S06','C06'),
('S07','C07'),
('S08','C06'),
('S09','C08'),
('S10','C07'),
('S11','C09'),
('S12','C10'),
('S13','C11'),
('S14','C09'),
('S15','C10'),
('S16','C12'),
('S17','C13'),
('S18','C12'),
('S19','C13'),
('S20','C12');

