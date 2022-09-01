import csv
import sqlite3
import pandas as p

from flask import Flask, request, jsonify

app = Flask(__name__)


@app.route('/app/patientsidemsgstore', methods=['GET'])
def bookappointmentvalue():
    d = {}
    d['valid'] = True
    patientname = str(request.args['doctorname'])
    print(patientname)
    updatemsg = str(request.args['updatemsg'])
    print(updatemsg)
    data = p.read_csv("../counter/tempologinacc.csv")
    counter = data.get('account')[0]
    print(counter)
    conn = sqlite3.connect("../apisection/hamro skin care.db")
    c = conn.cursor()
    c.execute("Select d_name from RegisterDoctor where d_email=:email ", {"email": counter})
    doctorname = c.fetchall()[0][0]
    if(updatemsg!=""):
        c.execute("Insert into MessageSendByPatient(patient_name,doctor_name,message,sendby) values(:patientname,:doctorname,:message,:sendby)",
                  {'patientname':patientname,"doctorname":doctorname,"message":updatemsg,"sendby":doctorname})
    c.execute("Select * from MessageSendByPatient where patient_name=:patientname and doctor_name=:doctorname", {"patientname": str(patientname),'doctorname':str(doctorname)})
    data = c.fetchall()
    print(data)
    ls = []
    lsts = []

    for a in range(len(data)):
        ls.append(data[a][3])
        if data[a][4]==str(doctorname):
            print('you')
            ls.append('(You)')
        else:
            print(data[a][4])
            ls.append(data[a][4])
        lsts.append(ls)
        ls = []
    conn.commit()
    conn.close()
    # print(lst)
    print(lsts)
    d['msg']=lsts
    response = jsonify(d)
    response.headers.add("Access-Control-Allow-Origin", "*")
    return response


if __name__ == "__main__":
    app.run(port=21000, host='0.0.0.0', debug=True)
