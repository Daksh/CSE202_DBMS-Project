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