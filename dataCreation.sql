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

/*Adding values to  courses */

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

/*Adding values to  instructor */

INSERT INTO `instructor` (`ID`, `name`, `salary`, `gender`) 
VALUES (
	NULL, 
	'Vikram Goyal', 
	'3000000', 
	'M'
);

INSERT INTO `instructor` (`ID`, `name`, `salary`, `gender`) 
VALUES (
	NULL, 
	'Debajyoti Bera', 
	'6000000', 
	'M'
);

INSERT INTO `instructor` (`ID`, `name`, `salary`, `gender`) 
VALUES (
	NULL, 
	'Raj Ayyar', 
	'1300000', 
	'M'
);

/*Adding values to  student */

INSERT INTO `student`(
    `rollNumber`,
    `email`,
    `address`,
    `bloodGroup`,
    `gender`,
    `phone`,
    `cgpa`,
    `name`,
    `stream`
)
VALUES(
    '2017111',
    'Vinayak17111@iiitd.ac.in',
    'IIITD Boys hostel',
    'O+',
    'M',
    '8926215277',
    '8.4',
    'Vinayak',
    'CSE'
);

INSERT INTO `student`(
    `rollNumber`,
    `email`,
    `address`,
    `bloodGroup`,
    `gender`,
    `phone`,
    `cgpa`,
    `name`,
    `stream`
)
VALUES(
    '2017030',
    'chirag17030@iiitd.ac.in',
    'IIITD Boys hostel',
    'O-',
    'M',
    '9816357465',
    '9.5',
    'Chirag',
    'CSE'
);

INSERT INTO `student`(
    `rollNumber`,
    `email`,
    `address`,
    `bloodGroup`,
    `gender`,
    `phone`,
    `cgpa`,
    `name`,
    `stream`
)
VALUES(
    '2017110',
    'sudhanshu17110@iiitd.ac.in',
    'IIITD Boys hostel',
    'B+',
    'M',
    '8826215977',
    '7.5',
    'Sudhanshu',
    'CSE'
);

/*Adding values to  department*/


INSERT INTO `department`(`num`, `name`, `hodID`)
VALUES(
	'CSE', 
	'Computer Science', 
	'1001'
);

INSERT INTO `department`(`num`, `name`, `hodID`)
VALUES(
    'SSH',
    'Social Science and Humanities',
    '1003'
);

/*Adding values to  departmentcomposition */

INSERT INTO `departmentcomposition`(`departmentNumber`, `instructorID`)
VALUES(
	'CSE', 
	'1001'
);

INSERT INTO `departmentcomposition`(`departmentNumber`, `instructorID`)
VALUES(
	'SSH', 
	'1003'
);

INSERT INTO `departmentcomposition`(`departmentNumber`, `instructorID`)
VALUES(
	'CSE', 
	'1002'
);