import sqlite3
def insrtdb(email,passwrd):
    print(email)
    print(passwrd)
    conn = sqlite3.connect("healthcare.db")
    c = conn.cursor()
    # c.execute("""
    # Create table login (
    # p_id integer,
    # p_email text,
    # p_password text)
    # """
    c.execute("Insert into login values(1,:email,:pass)",{"email": email,"pass" :passwrd})
    c.execute("Select * from login")
    print(c.fetchall())
    conn.commit()
    conn.close()

conn = sqlite3.connect("healthcare.db")
c = conn.cursor()
    # c.execute("""
    # Create table login (
    # p_id integer,
    # p_email text,
    # p_password text)
    # """
    # c.execute("Insert into login values(1,':email',':pass')",{"email":email,"pass":passwrd})
c.execute("Select * from login")
print(c.fetchall())
conn.commit()
conn.close()