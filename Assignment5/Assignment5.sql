/********************************************************
* This script creates the database named assignment_5 
*********************************************************/

DROP DATABASE IF EXISTS assignment_5;
CREATE DATABASE assignment_5;
USE assignment_5;

-- create the tables for the database
CREATE TABLE students (
  student_id        INT            PRIMARY KEY   AUTO_INCREMENT,
  student_name      VARCHAR(255)   NOT NULL,
  student_address   VARCHAR(255),
  student_email     VARCHAR(255),
  student_major     VARCHAR(255)
);

CREATE TABLE classes (
  student_id         INT            NOT NULL,
  classes            VARCHAR(255)   NOT NULL,
  
  CONSTRAINT classes_fk_students
    FOREIGN KEY (student_id)
    REFERENCES students (student_id)
);

-- Insert data into the tables
INSERT INTO students (student_id, student_name, student_address, student_email, student_major) VALUES
(1, 'john jones', '124 Main St.', 'Joe@school.edu', 'Programming and Development'),
(2, 'sue smith', '345 Second St.', 'Sue@school.edu', 'Programming and Development'),
(3, 'nick foyar', '45 York Road', 'Nick@school.edu', 'Networking'), 
(4, 'andy andrews', '600 5th Ave.', 'Andy@school.edu', 'Networking'),
(5, 'david dutch', '11 behind you road', 'DutchIT@school.edu', 'Networking'),
(6, 'tilly slugthorn', 'center of universe', 'Slugs@school.edu', 'Soul Consumption'), 
(7, 'scramble bump', '780 scramble ave.', 'Scramble@school.edu', 'Chilvary');

INSERT INTO classes (student_id, classes) VALUES
(1, 'IT1025'),
(1, 'MATH1200'),
(1, 'IT1050'),
(2, 'IT1025'),
(2, 'IT1050'),
(2, 'IT 2351'),
(3, 'IT1025'),
(4, 'IT1025'),
(4, 'IT1050'),
(5, 'IT1025'),
(5, 'IT1050'),
(6, 'IT1025'),
(6, 'MATH1200'),
(7, 'IT1025'),
(7, 'IT1050'),
(7, 'IT 2351');

-- Create a user named mgs_user
CREATE USER IF NOT EXISTS mgs_user@localhost
IDENTIFIED BY 'pa55word';

-- Grant privileges to that user
GRANT SELECT, INSERT, UPDATE, DELETE
ON mgs.*
TO mgs_user@localhost;