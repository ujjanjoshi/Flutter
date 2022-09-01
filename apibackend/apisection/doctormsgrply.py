import csv
import sqlite3
import pandas as p

from flask import Flask, request, jsonify

app = Flask(__name__)


@app.route('/app/patientsidemsg', methods=['GET'])
def bookappointmentvalue():
    d = {}
    # print("connected")
    d['valid'] = True
    data = p.read_csv("../counter/tempologinacc.csv")
    counter = data.get('account')[0]
    print(counter)
    conn = sqlite3.connect("../apisection/hamro skin care.db")
    c = conn.cursor()
    c.execute("Select p_name from RegisterPatients where p_email=:email ",{"email":counter})
    patientnamne=c.fetchall()[0][0]
    print(patientnamne)

    c.execute("Select * from PatientMessage where patient_name=:patientname",{"patientname":str(patientnamne)})
    data=c.fetchall()
    l = []
    lst = []
    for a in range(len(data)):
        l.append(data[a][2])
        # l.append(data[a][4])
    # l.append(data[a][3])
        lst.append(l)
        l = []
    conn.commit()
    conn.close()
    print(lst)
    d['name']=lst
    response = jsonify(d)
    response.headers.add("Access-Control-Allow-Origin", "*")
    return response


if __name__ == "__main__":
    app.run(port=18000, host='0.0.0.0', debug=True)
