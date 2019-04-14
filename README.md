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