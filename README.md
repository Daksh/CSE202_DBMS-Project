## Queries
1. Print the instructor names of courses in which at least one student has a CGPA of more than 8.
> `select instructor.name from student, enrollments, offering, instructor where student.rollNumber = enrollments.studentRollNumber and offering.instructorID = instructor.ID and enrollments.offeringSemester = offering.semester and enrollments.courseNumber = offering.courseNumber and student.cgpa>8 group by instructor.name;`

2. List the Name, Phone Numbers of all the Students of Blood Group B+ who have not taken the offering CSE501
> `SELECT DISTINCT name, phone FROM student,enrollments WHERE student.rollNumber=enrollments.studentRollNumber AND student.bloodGroup='B+' AND student.name NOT IN (SELECT name FROM student,enrollments WHERE student.rollNumber=enrollments.studentRollNumber AND enrollments.courseNumber='CSE501');`

3. List the departments (department name) which have more than 5 course offerings.
> `select course.name, count(*) as offering_count from course, offering where course.num = offering.courseNumber group by course.num having offering_count > 5;`

4. Print the names of students whose CGPA in the 4th semster increased by 10%.

5. In how many course offering were the enrollments of students more than 100 and the instructor was a Male from the Maths department?

6. Ratio of student enrollments in Courses taken by Male Instructors vs Female instructors.

7. How many students in Computer Science stream took 2 Credit courses?
> `select count(distinct(student.rollNumber)) ans from student, enrollments, offering, course where student.rollNumber = enrollments.studentRollNumber and enrollments.offeringSemester = offering.semester and enrollments.courseNumber = offering.courseNumber and course.num = offering.courseNumber and course.credits>2 and student.stream = 'CSE';`

8. In the Summer of 2013 how many students scored a GPA of more than 9 in every course they took.

9. What is the total salary of Female profs who have ever taught batch of more than 50 students.

10. What are the highest number of female students in any stream?
> `select MAX(c) from (select stream, count(*) c from student where gender = 'F' group by stream) as x;`

## Instructions
1. Make sure MySQL is installed on your system and MySQL Server is running
2. MySQL has a `root` user with no password
3. You have the Python package installed
4. You are running on python3 
5. **`mysql < dataCreation.sql`**

## Starting MySQL on Mac
1. `/usr/local/bin/mysql.server start`
2. `mysql -u root`
3. `/usr/local/bin/mysql.server stop`
4. References: [for brew MySQL](https://gist.github.com/nrollr/3f57fc15ded7dddddcc4e82fe137b58e#additional-configuration), I got these commands by manually doing a `find` and checking the results

## Python MySQL
1. `pip3 install mysql-connector-python` [Ref](https://stackoverflow.com/a/42124222/2806163)

## Extras
1. [Checking the disk space used by MySQL Databases](https://dba.stackexchange.com/a/14351)
2. To delete a database: `DROP DATABASE databasename`

## References
1. <https://www.datacamp.com/community/tutorials/mysql-python#IMySQL>
2. <https://stackoverflow.com/questions/2191699/find-an-element-in-a-list-of-tuples>
3. <https://dev.mysql.com/doc/refman/8.0/en/mysql-batch-commands.html>
4. <http://www.mysqltutorial.org/mysql-foreign-key/>