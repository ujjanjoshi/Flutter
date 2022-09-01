import csv
import sqlite3
import pandas as p

from flask import Flask, request, jsonify

app = Flask(__name__)


@app.route('/app/bookaccpet', methods=['GET'])
def bookappointmentvalue():
    d = {}
    doctorname=str(request.args['doctorname'])
    times = str(request.args['time'])
    dates = str(request.args['date'])
    changedec=str(request.args['changedec'])
    print(doctorname,times,dates)
    if(changedec=="accept"):
        conn = sqlite3.connect("../apisection/hamro skin care.db")
        c = conn.cursor()
        c.execute("Update BookAppointment set status=:status where patient_name=:name or appointmentdate=:date and appointmenttime=:time",{'status':'accepted','name':doctorname,'date':dates,'time':times})
        c.execute("Select doctor_name from BookAppointment where patient_name=:name or appointmentdate=:date and appointmenttime=:time",{'name':doctorname,'date':dates,'time':times})
        doctornames=c.fetchall()[0][0]

        c.execute(
            "Insert into DoctoAppointment(patient_name,doctor_name,appointmenttime,appointmentdate) values(:patient_name,:doctor_name,:appointmenttime,:appointmentdate)",
            {"patient_name":doctorname,"doctor_name": doctornames, "appointmenttime": times,"appointmentdate":dates})
        c.execute("Select * from DoctorMessage where patient_name=:patientname and doctor_name=:doctorname",
                  {"patientname": doctorname, "doctorname": doctornames})
        # print(len(c.fetchall())==1)
        if(len(c.fetchall())!=1):
            c.execute(
                "Insert into PatientsDetails(patient_name,doctor_name) values(:patient_name,:doctor_name)",
                {"patient_name": doctorname, "doctor_name": doctornames})
            c.execute(
                "Insert into DoctorMessage(patient_name,doctor_name,message) values(:patient_name,:doctor_name,:message)",
                {"patient_name": doctorname, "doctor_name": doctornames,"message": "you can now send the message"})
            c.execute(
                "Insert into PatientMessage(patient_name,doctor_name,message) values(:patient_name,:doctor_name,:message)",
                {"patient_name": doctorname, "doctor_name": doctornames, "message": "Your requested has been accepted\nyou can now send the message"})
        conn.commit()
        conn.close()
        d['valid'] = True
    else:
        conn = sqlite3.connect("../apisection/hamro skin care.db")
        c = conn.cursor()
        c.execute(
            "Update BookAppointment set status=:status where patient_name=:name or appointmentdate=:date and appointmenttime=:time",
            {'status': 'rejected', 'name': doctorname, 'date': dates, 'time': times})
        conn.commit()
        conn.close()
        d['valid'] = True
    #     d['valid'] = True
    # else:
    #     d['valid'] = False

    response = jsonify(d)
    response.headers.add("Access-Control-Allow-Origin", "*")
    return response


if __name__ == "__main__":
    app.run(port=9000, host='0.0.0.0', debug=True)
