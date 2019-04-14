import mysql.connector as mysql
from os import system, name 

def clear(): 
	if name == 'nt': # for windows 
		system('cls') 
	else: # for mac and linux
		system('clear') 
		
def createDB():
	db = mysql.connect(
		host = "localhost",
		user = "root"
	)
	# Cursor is used to execute MySQL Commands
	cursor = db.cursor()

	cursor.execute("SHOW DATABASES")
	databases = cursor.fetchall()
	if [item for item in databases if 'college' in item] == []:
		cursor.execute("CREATE DATABASE college")
		print('"college" Database successfully created :)')
	else:
		print('"college" Database already exists!')
	input("Press Enter to continue...")

def createTables():
	db = mysql.connect(
		host = "localhost",
		user = "root"
	)
	# Cursor is used to execute MySQL Commands
	cursor = db.cursor()

	#add a check for tables if they already exist or not

    adding_student_table = "CREATE TABLE College.Student ( RollNumber INT(8) NOT NULL , Email VARCHAR(100) NOT NULL , Address VARCHAR(100) NOT NULL , BloodGroup VARCHAR(100) NOT NULL , Gender VARCHAR(100) NOT NULL , Phone INT(10) NOT NULL , CGPA INT(10) NOT NULL , Name VARCHAR(100) NOT NULL , Stream VARCHAR(100) NOT NULL , PRIMARY KEY (RollNumber)) ENGINE = InnoDB;"
    cursor.execute(adding_student_table)
    print('"Student" table successfully created :)')

    adding_offering_table = "CREATE TABLE college.Offering ( Year INT(5) NOT NULL , Semester INT(10) NOT NULL , Course_Number INT(10) NOT NULL , Instructor_ID INT(10) NOT NULL , PRIMARY KEY (Semester, Year, Course_Number)) ENGINE = InnoDB;"
	cursor.execute(adding_offering_table)
    print('"Offering" table successfully created :)')

    adding_Instructor_table="CREATE TABLE `college`.`Instructor` ( `ID` INT(10) NOT NULL , `Name` VARCHAR(100) NOT NULL , `Salary` INT(10) NOT NULL , `Gender` VARCHAR(10) NOT NULL , PRIMARY KEY (`ID`)) ENGINE = InnoDB; "
	cursor.execute(adding_Instructor_table)
	print('"Instructor" table successfully created :)')

	adding_DeptComp_table="CREATE TABLE `college`.`DepartmentComposition` ( `DepartmentNumber` INT(10) NOT NULL , `InstructorID` INT(10) NOT NULL , PRIMARY KEY (`DepartmentNumber`, `InstructorID`)) ENGINE = InnoDB; "
	cursor.execute(adding_DeptComp_table)
	print('"DepartmentComposition" table successfully created :)')

	adding_Dept_table="CREATE TABLE `college`.`Department` ( `Number` INT NOT NULL , `Name` INT NOT NULL , `HOD_ID` INT NOT NULL , PRIMARY KEY (`Number`)) ENGINE = InnoDB;"
	cursor.execute(adding_Dept_table)
	print('"Department" table successfully created :)')

	adding_Course_table="CREATE TABLE `college`.`Course` ( `Number` INT(10) NOT NULL , `Name` VARCHAR(100) NOT NULL , `Credits` INT(2) NOT NULL , PRIMARY KEY (`Number`)) ENGINE = InnoDB;"
	cursor.execute(adding_Course_table)
	print('"Course" table successfully created :)')

	adding_Enrollments_table="CREATE TABLE `college`.`Enrollments` ( `Student_RollNumber` INT(10) NOT NULL , `Offering_Year` INT(5) NOT NULL , `Offering_Semester` INT(10) NOT NULL , `Course_Number` INT(10) NOT NULL , `Grade` VARCHAR(10) NOT NULL , `Student_Semester` INT(10) NOT NULL , PRIMARY KEY (`Student_RollNumber`, `Offering_Year`, `Offering_Semester`, `Course_Number`)) ENGINE = InnoDB;"
	cursor.execute(adding_Enrollments_table)
	print('"Enrollments" table successfully created :)')
	

def addData():
	pass

if __name__ == '__main__':
	choice = 1
	while choice != 0:
		clear()
		print('1. Create the "college" Database') 
		print('2. Create all the Relations(Tables)')
		print('3. Add Data to the Tables')
		print('0. Exit')
		print('Enter your choice: ',end='')
		choice = int(input())
		print()
		
		if choice == 1:
			createDB()
		elif choice == 2:
			createTables()
		elif choice == 3:
			addData()
		elif choice == 0:
			break
		else:
			print('Please enter a valid choice! :)')