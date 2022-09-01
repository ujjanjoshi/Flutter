# from apisection.holdotp import Holdotp
import sqlite3
import csv
import pandas as p
class GetRegisterData:
    def getregisterdata(usernames, status, address, dateofbirth, age, gender, email,password):

        print(usernames, status, address, dateofbirth, age, gender, email)
        f = open('../counter/recentregt.csv', 'w', newline="")
        writer = csv.writer(f)
        if(status=="Doctor"):
            writer.writerow(['usernames', 'status', 'address', 'dateofbirth', 'age', 'gender', 'email','password'])
            writer.writerow(["Dr."+usernames, status, address, dateofbirth, age, gender, email,password])
        else:
            writer.writerow(['usernames', 'status', 'address', 'dateofbirth', 'age', 'gender', 'email', 'password'])
            writer.writerow([usernames, status, address, dateofbirth, age, gender, email, password])
        f.close()

        conn = sqlite3.connect("../apisection/hamro skin care.db")
        c = conn.cursor()
        if(password!=""):
            print('sent to database')
            if(status=="Doctor"):
                data = p.read_csv("../counter/doctorregistercounter.csv")
                counter = int(data.get('Count')[0])
                counter = counter + 1
                f = open('../counter/doctorregistercounter.csv', 'w', newline="")
                writer = csv.writer(f)
                writer.writerow(['Count'])
                writer.writerow(str(counter))
                f.close()
                c.execute("Insert into RegisterDoctor values(:id,:usernames,:status,:address,:dateofbirth,:age,:gender,:email,:password)", {"id":"D"+str(counter),"usernames":usernames, "status":status,"address":address, "dateofbirth":dateofbirth, "age":age,"gender":gender, "email":email, "password":password})
                c.execute("Insert into Login values(:id,:usernames,:password)", {"id": "D1", "usernames": email, "password": password})
            else:
                data = p.read_csv("../counter/patientregistercounter.csv")
                print(type(data.get('Count')[0]))
                counter = int(data.get('Count')[0])
                counter = counter + 1
                f = open('../counter/patientregistercounter.csv', 'w', newline="")
                writer = csv.writer(f)
                writer.writerow(['Count'])
                writer.writerow(str(counter))
                f.close()
                c.execute("Insert into RegisterPatients values(:id,:usernames,:status,:address,:dateofbirth,:age,:gender,:email,:password)", {"id":"P"+str(counter),"usernames":usernames, "status":status,"address":address, "dateofbirth":dateofbirth, "age":age,"gender":gender, "email":email, "password":password})
                c.execute("Insert into Login values(:id,:usernames,:password)",
                          {"id": "P1", "usernames": email, "password": password})
        conn.commit()
        conn.close()
