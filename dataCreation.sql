CREATE DATABASE IF NOT EXISTS college;
 
USE college;

CREATE TABLE student( 
	rollNumber INT(8) NOT NULL PRIMARY KEY, 
	email VARCHAR(100) NOT NULL,
	address VARCHAR(250) NOT NULL,
	bloodGroup VARCHAR(4) NOT NULL,
	gender CHAR(1) NOT NULL,
	phone VARCHAR(10) NOT NULL,
	cgpa DECIMAL(4,2) NOT NULL,
	name VARCHAR(100) NOT NULL,
	stream VARCHAR(4) NOT NULL				
);

CREATE TABLE course(
	num CHAR(6) NOT NULL,
	name VARCHAR(100) NOT NULL,
	credits INT(1) NOT NULL,
	PRIMARY KEY (num)
);

CREATE TABLE instructor( 
	ID INT(4) NOT NULL AUTO_INCREMENT,
	name VARCHAR(100) NOT NULL,
	salary INT(10) NOT NULL,
	gender CHAR(1) NOT NULL,
	PRIMARY KEY (ID)
); 
ALTER TABLE instructor AUTO_INCREMENT=1001;

CREATE TABLE offering( 
	year INT(4) NOT NULL,
	semester INT(1) NOT NULL,
	courseNumber CHAR(6) NOT NULL,
	instructorID INT(4) NOT NULL,
	FOREIGN KEY (courseNumber) REFERENCES course(Num) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (instructorID) REFERENCES instructor(ID) ON DELETE CASCADE ON UPDATE CASCADE,
	PRIMARY KEY (semester, year, courseNumber)
);

CREATE TABLE enrollments(
	studentRollNumber INT(8) NOT NULL,
	offeringSemester INT(1) NOT NULL,
	courseNumber CHAR(6) NOT NULL,
	grade DECIMAL(4,2) NOT NULL,
	studentSemester INT(1) NOT NULL,
	FOREIGN KEY (studentRollNumber) REFERENCES student(rollNumber) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (offeringSemester) REFERENCES offering(semester) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (courseNumber) REFERENCES offering(courseNumber) ON DELETE CASCADE ON UPDATE CASCADE,
	PRIMARY KEY (studentRollNumber, offeringSemester, courseNumber)
);

CREATE TABLE department(
	num CHAR(3) NOT NULL,
	name VARCHAR(100) NOT NULL,
	hodID INT(4) NOT NULL,
	FOREIGN KEY (hodID) REFERENCES instructor(ID) ON DELETE CASCADE ON UPDATE CASCADE,
	PRIMARY KEY(num)
);

CREATE TABLE departmentComposition( 
	departmentNumber CHAR(3) NOT NULL,
	instructorID INT(4) NOT NULL,
	FOREIGN KEY (departmentNumber) REFERENCES department(num) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (instructorID) REFERENCES instructor(ID) ON DELETE CASCADE ON UPDATE CASCADE,
	PRIMARY KEY (departmentNumber, instructorID)
); 

-->Adding values to COURSES

INSERT INTO `course`(`num`, `name`, `credits`)
VALUES(
	'CSE100', 
	'Computer Networks', 
	'4'
);

INSERT INTO `course`(`num`, `name`, `credits`)
VALUES(
    'CSE232',
    'Analysis and Design of Algorithms ',
    '4'
);

INSERT INTO `course`(`num`, `name`, `credits`)
VALUES(
    'MTH100',
    'Linear Algebra',
    '4'
);

INSERT INTO `course`(`num`, `name`, `credits`)
VALUES(
    'CSB130',
    'Introduction to Quantitative Biology',
    '4'
);

INSERT INTO `course`(`num`, `name`, `credits`)
VALUES(
    'SSH104',
    'Critical Thinking',
    '4'
);

-->Adding values to COURSES
