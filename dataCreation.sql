CREATE DATABASE IF NOT EXISTS college;
 
USE college;

CREATE TABLE categories(
	cat_id int not null auto_increment primary key,
	cat_name varchar(255) not null,
	cat_description text
) ENGINE=InnoDB;
 
CREATE TABLE products(
	prd_id int not null auto_increment primary key,
	prd_name varchar(355) not null,
	prd_price decimal,
	cat_id int not null,
	FOREIGN KEY fk_cat(cat_id)
	REFERENCES categories(cat_id)
	ON UPDATE CASCADE
	ON DELETE RESTRICT
) ENGINE=InnoDB;

CREATE TABLE student( 
	rollNumber INT(8) NOT NULL PRIMARY KEY, 
	email VARCHAR(100) NOT NULL,
	address VARCHAR(250) NOT NULL,
	bloodGroup VARCHAR(5) NOT NULL,
	gender CHAR(1) NOT NULL,
	phone INT(10) NOT NULL,
	cgpa DECIMAL(4,2) NOT NULL,
	name VARCHAR(100) NOT NULL,
	stream VARCHAR(4) NOT NULL
);

CREATE TABLE offering( 
	year INT(5) NOT NULL,
	semester INT(10) NOT NULL,
	courseNumber INT(10) NOT NULL,
	instructorID INT(10) NOT NULL,
	PRIMARY KEY (Semester, Year, Course_Number)
);

CREATE TABLE course(
	`Number` INT(10) NOT NULL,
	`Name` VARCHAR(100) NOT NULL,
	`Credits` INT(2) NOT NULL,
	PRIMARY KEY (`Number`)
);

ALTER TABLE `offering` ADD FOREIGN KEY (`Course_Number`) REFERENCES `course`(`Number`) ON DELETE RESTRICT ON UPDATE RESTRICT; 

CREATE TABLE instructor( 
	ID INT(10) NOT NULL,
	name VARCHAR(100) NOT NULL,
	salary INT(10) NOT NULL,
	gender VARCHAR(10) NOT NULL,
	PRIMARY KEY (`ID`)
); 

CREATE TABLE departmentComposition( 
	`DepartmentNumber` INT(10) NOT NULL,
	`InstructorID` INT(10) NOT NULL,
	PRIMARY KEY (`DepartmentNumber`, `InstructorID`)
); 
