import sqlite3
conn=sqlite3.connect('hello.db')

conn.commit()
conn.close()