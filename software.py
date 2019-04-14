import mysql.connector as mysql

db = mysql.connect(
    host = "localhost",
    user = "root"
)

# Cursor is used to execute MySQL Commands
cursor = db.cursor()

cursor.execute("CREATE DATABASE College")