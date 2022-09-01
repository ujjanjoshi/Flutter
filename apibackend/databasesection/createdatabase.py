import sqlite3
conn=sqlite3.connect("../apisection/hamro skin care.db")
c=conn.cursor()
c.execute("""
Create table MessageSendByPatient(
    m_id integer,
    patient_name text,
    doctor_name text,
    msg text
)
""")
conn.commit()
conn.close()
