import csv
import sqlite3
import pandas as p

from flask import Flask, request, jsonify

app = Flask(__name__)


@app.route('/app/patientsidemsgstore', methods=['GET'])
def bookappointmentvalue():
    d = {}
    d['valid'] = True
    doctorname = str(request.args['doctorname'])
    print(doctorname)
    updatemsg = str(request.args['updatemsg'])
    print(updatemsg)
    data = p.read_csv("../counter/tempologinacc.csv")
    counter = data.get('account')[0]
    print(counter)
    conn = sqlite3.connect("../apisection/hamro skin care.db")
    c = conn.cursor()
    c.execute("Select p_name from RegisterPatients where p_email=:email ", {"email": counter})
    patientnamne = c.fetchall()[0][0]
    if(updatemsg!=""):
        c.execute("Insert into MessageSendByPatient(patient_name,doctor_name,message,sendby) values(:patientname,:doctorname,:message,:sendby)",
              {'patientname':patientnamne,"doctorname":doctorname,"message":updatemsg,"sendby":patientnamne})
    c.execute("Select * from MessageSendByPatient where patient_name=:patientname and doctor_name=:doctorname", {"patientname": str(patientnamne),'doctorname':str(doctorname)})
    data=c.fetchall()
    l = []
    lst = []
    for a in range(len(data)):
        l.append(data[a][3])
        if data[a][4] == str(patientnamne):
            print('you')
            l.append('(You)')
        else:
            print(data[a][4])
            l.append(data[a][4])
        # l.append(data[a][4])
    # l.append(data[a][3])
        lst.append(l)
        l = []
    conn.commit()
    conn.close()
    print(lst)
    d['msg']=lst
    response = jsonify(d)
    response.headers.add("Access-Control-Allow-Origin", "*")
    return response


if __name__ == "__main__":
    app.run(port=19000, host='0.0.0.0', debug=True)
