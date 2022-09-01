import csv
import sqlite3
import pandas as p

from flask import Flask, request, jsonify

app = Flask(__name__)


@app.route('/app/notifydoctor', methods=['GET'])
def notifydoctorvalue():
    d = {}
    data = p.read_csv("../counter/tempologinacc.csv")
    curntusr = str(data.get('account')[0])
    print(curntusr)
    conn = sqlite3.connect("../apisection/hamro skin care.db")
    c = conn.cursor()
    c.execute("Select d_name from Registerdoctor where d_email=:email", {'email': curntusr})
    data = c.fetchall()[0][0]
    print(data)
    c.execute("Select * from bookappointment where doctor_name=:doctorname and status=:status", {'doctorname': data,"status":'requested'})

    data = c.fetchall()
    print(data)
    l = []
    lst=[]
    lstfinal=[]
    for a in range(len(data)):
        pemail = data[a][1]
        c.execute("Select p_name from RegisterPatients where p_email=:email", {'email': pemail})
        l.append(c.fetchall()[0][0])
        l.append(data[a][4])
        l.append(data[a][3])
        lst.append(l)
        l=[]

    print(len(lst))
    if(len(lst)==0):
        d['list']='nomore'
    else:
        d['list']=lst
    response = jsonify(d)
    response.headers.add("Access-Control-Allow-Origin", "*")
    return response


if __name__ == "__main__":
    app.run(port=8000, host='0.0.0.0', debug=True)
