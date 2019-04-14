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
	pass

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