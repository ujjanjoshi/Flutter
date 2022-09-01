import csv
import sqlite3
import pandas as p

from flask import Flask, request, jsonify

app = Flask(__name__)


@app.route('/app/appointmentschedule', methods=['GET'])
def appointmentschedulevalue():
    d = {}
    data = p.read_csv("../counter/tempologinacc.csv")
    curntusr = str(data.get('account')[0])
    print(curntusr)
    conn = sqlite3.connect("../apisection/hamro skin care.db")
    c = conn.cursor()
    c.execute("Select d_name from RegisterDoctor where d_email=:email",
              {'email': curntusr})
    data = c.fetchall()[0][0]
    d['doctorname']=data
    c.execute("Select * from DoctoAppointment where doctor_name=:name",
              {'name': data})
    data = c.fetchall()
    l=[]
    lst=[]
    for a in range(len(data)):
        l.append(data[a][1])
        l.append(data[a][3])
        l.append(data[a][4])
        lst.append(l)
        l=[]
    d['list']=lst
    # print(data[0][1])
    response = jsonify(d)
    response.headers.add("Access-Control-Allow-Origin", "*")
    return response


if __name__ == "__main__":
    app.run(port=11000, host='0.0.0.0', debug=True)
