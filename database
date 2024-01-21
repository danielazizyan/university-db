CREATE TABLE Members (
 personal_id int IDENTITY(1,1) PRIMARY KEY,
first_name varchar(20),
last_name varchar(20)
);

CREATE TABLE Students(
student_id int PRIMARY KEY FOREIGN KEY REFERENCES Members(personal_id) ON DELETE
CASCADE,
first_name varchar(20),
last_name varchar(20),
birthdate date
);

CREATE TABLE Grades(
subject_id int,
exam_grade decimal(4,2),
credit tinyint,
student_id int
);

CREATE TABLE Subjects(
subject_id int IDENTITY(1,1) PRIMARY KEY,
subject_name varchar(30),
credit tinyint,
professor_id int FOREIGN KEY REFERENCES Members(personal_id) ON DELETE CASCADE
)

ALTER TABLE Grades
ADD FOREIGN KEY (subject_id)
REFERENCES Subjects(subject_id)
ON DELETE CASCADE;
