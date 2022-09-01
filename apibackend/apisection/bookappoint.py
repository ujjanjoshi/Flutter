import csv
import sqlite3
import pandas as p

from flask import Flask, request, jsonify

app = Flask(__name__)


@app.route('/app/bookappointment', methods=['GET'])
def bookappointmentvalue():
    d = {}
    doctorname=str(request.args['doctorname'])
    times = str(request.args['time'])
    dates = str(request.args['date'])
    print(doctorname,times,dates)
    if(doctorname!="" and times!="" and dates!=""):
        data = p.read_csv("../counter/bookappcounter.csv")
        counter = int(data.get('Count')[0])
        counter = counter + 1
        f = open('../counter/bookappcounter.csv', 'w', newline="")
        writer = csv.writer(f)
        writer.writerow(['Count'])
        writer.writerow(str(counter))
        f.close()
        data = p.read_csv("../counter/tempologinacc.csv")
        patientname = str(data.get('account')[0])
        conn = sqlite3.connect("../apisection/hamro skin care.db")
        c = conn.cursor()
        c.execute("Insert into BookAppointment values(:id,:patient_name,:doctor_name,:appointmenttime,:appointmentdate,:status)",
                  {"id": "B"+str(counter), "patient_name":patientname,"doctor_name": doctorname, "appointmenttime": times,"appointmentdate":dates,"status":"requested"})
        conn.commit()
        conn.close()
        d['valid'] = True
    else:
        d['valid'] = False
    response = jsonify(d)
    response.headers.add("Access-Control-Allow-Origin", "*")
    return response


if __name__ == "__main__":
    app.run(port=1000, host='0.0.0.0', debug=True)
