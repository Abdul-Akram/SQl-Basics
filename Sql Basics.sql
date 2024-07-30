-- Create Database
CREATE DATABASE MyDatabase;

-- Create Tables
CREATE TABLE Student_details (
    student_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(50),
    Age INT,
    DOB DATE,
    Address VARCHAR(100)
);

-- Alter Table
ALTER TABLE Student_details ADD COLUMN email VARCHAR(100);
ALTER TABLE Student_details DROP COLUMN email;
ALTER TABLE Student_details MODIFY COLUMN Age INT NOT NULL;

-- Insert Into
INSERT INTO Student_details (student_name, Age, DOB, Address) 
VALUES ("Akram", 20, "2003-01-01", "Coimbatore");

-- Select Clause
SELECT * FROM Student_details;
SELECT student_name FROM Student_details;

-- Where Clause
SELECT * FROM Student_details WHERE Age > 18;

-- Update Statement
UPDATE Student_details SET Age = 21 WHERE student_name = "Akram";

-- Delete Statement
DELETE FROM Student_details WHERE student_name = "Ram";

-- Order By Clause
SELECT * FROM Student_details ORDER BY Age DESC;

-- Group By Clause
SELECT Age, COUNT(*) FROM Student_details GROUP BY Age;

-- Having Clause
SELECT Age, COUNT(*) FROM Student_details GROUP BY Age HAVING COUNT(*) > 1;

-- Inner Join
CREATE TABLE Course_details (
    course_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(50) NOT NULL,
    course_duration INT CHECK (course_duration > 0),
    course_fee DECIMAL(10, 2),
    UNIQUE (course_name)
);

INSERT INTO Course_details (course_name, course_duration, course_fee) 
VALUES ("Computer Science", 4, 50000.00);

SELECT Student_details.student_name, Course_details.course_name
FROM Student_details
INNER JOIN Course_details ON Student_details.student_id = Course_details.course_id;

-- Left Join
SELECT Student_details.student_name, Course_details.course_name
FROM Student_details
LEFT JOIN Course_details ON Student_details.student_id = Course_details.course_id;

-- In Operator
SELECT * FROM Student_details WHERE Age IN (18, 21, 22);

-- Between Operator
SELECT * FROM Student_details WHERE Age BETWEEN 18 AND 22;

-- Like and Wildcards
SELECT * FROM Student_details WHERE student_name LIKE 'A%';

-- Aggregate Functions
SELECT COUNT(*) FROM Student_details;
SELECT AVG(Age) FROM Student_details;
SELECT SUM(Age) FROM Student_details;
SELECT MAX(Age) FROM Student_details;
SELECT MIN(Age) FROM Student_details;

-- Distinct Clause
SELECT DISTINCT Age FROM Student_details;

-- Limit Clause
SELECT * FROM Student_details LIMIT 5;

-- Drop and Truncate
TRUNCATE TABLE Student_details;
DROP TABLE Student_details;

-- Not Operator
SELECT * FROM Student_details WHERE NOT Age > 18;
