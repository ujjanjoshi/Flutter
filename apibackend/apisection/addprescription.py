import csv
import sqlite3
import pandas as p

from flask import Flask, request, jsonify

app = Flask(__name__)


@app.route('/app/addprescription', methods=['GET'])
def addprescriptionvalue():
    d = {}
    doctorname = str(request.args['doctorname'])
    patientname = str(request.args['patientname'])
    dates = str(request.args['dates'])
    prescriptiontitle=str(request.args['prescriptiontitle'])
    prescriptions = str(request.args['prescriptions'])
    print(doctorname,patientname,dates,prescriptions)
    # data = p.read_csv("../counter/tempologinacc.csv")
    # curntusr = str(data.get('account')[0])
    # print(curntusr)
    conn = sqlite3.connect("../apisection/hamro skin care.db")
    c = conn.cursor()
    c.execute("Insert into prescription(patient_name,doctor_name,appointmentdate,prescriptiontitle,prescription) values(:patientname,:doctoname,:appointmentdate,:ptitle,:prescription)",
              {'patientname':patientname,'doctoname':doctorname,'appointmentdate':dates,'prescription':prescriptions,'ptitle':prescriptiontitle})
    c.execute("Delete from DoctoAppointment where patient_name=:patientname and appointmentdate=:date and doctor_name=:doctorname",
              {'patientname': patientname, 'doctorname': doctorname, 'date': dates})
    conn.commit()
    response = jsonify(d)
    response.headers.add("Access-Control-Allow-Origin", "*")
    return response


if __name__ == "__main__":
    app.run(port=12000, host='0.0.0.0', debug=True)
