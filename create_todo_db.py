import sqlite3 as db
conn = db.connect('todo.db') # Warning: this file is created in the current directory

conn.close()