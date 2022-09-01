import sqlite3

import pandas as p
data = p.read_csv("../counter/tempologinacc.csv")
curntusr = str(data.get('account')[0])
print(curntusr)
conn = sqlite3.connect("../apisection/hamro skin care.db")
c = conn.cursor()
c.execute("Select * from bookappointment where patient_name=:patientname and status=:status", {'patientname': curntusr,'status':'accepted'})
data=c.fetchall()
print(data)
print("Your request has been accepted!!\nYou have an appointment with\n"+data[0][2]+" on "+data[0][4]+" between "+data[0][3])

# print()
# data=c.fetchall()
# print(data[0][3])
# l=[]
#
# for a in range(len(data)):
#            pemail=data[a][1]
#            c.execute("Select p_name from RegisterPatients where p_email=:email", {'email': pemail})
#            l.append([c.fetchall()[0][0],data[a][4],data[a][3]])
#
# print(l)
# c.execute("Select d_name from Registerdoctor where d_email=:email", {'email': curntusr})
# data = c.fetchall()[0][0]
# print(data)
