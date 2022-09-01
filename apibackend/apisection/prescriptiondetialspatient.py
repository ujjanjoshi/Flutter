import csv
import sqlite3
import pandas as p

from flask import Flask, request, jsonify

app = Flask(__name__)


@app.route('/app/prescriptiondetialspatient', methods=['GET'])
def addprescriptionvalue():
    d = {}
    data = p.read_csv("../counter/tempologinacc.csv")
    curntusr = str(data.get('account')[0])
    print(curntusr)
    conn = sqlite3.connect("../apisection/hamro skin care.db")
    c = conn.cursor()
    c.execute("Select p_name from RegisterPatients where p_email=:email", {'email': curntusr})
    data = c.fetchall()[0][0]
    print(data)
    d['patientname'] = data
    c.execute("Select * from Prescription where patient_name=:name",
              {'name': data})
    data = c.fetchall()
    l = []
    lst = []
    for a in range(len(data)):
        l.append(data[a][3])
        l.append(data[a][4])
        s=data[a][5]
        l.append(s)
        lst.append(l)
        l = []
    print(lst)
    d['list'] = lst
    response = jsonify(d)
    response.headers.add("Access-Control-Allow-Origin", "*")
    return response


if __name__ == "__main__":
    app.run(port=15000, host='0.0.0.0', debug=True)
