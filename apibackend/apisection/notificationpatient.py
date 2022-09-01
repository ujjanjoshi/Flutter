import csv
import sqlite3
import pandas as p

from flask import Flask, request, jsonify

app = Flask(__name__)


@app.route('/app/notifypatient', methods=['GET'])
def notifydoctorvalue():
    d = {}
    data = p.read_csv("../counter/tempologinacc.csv")
    curntusr = str(data.get('account')[0])
    print(curntusr)
    conn = sqlite3.connect("../apisection/hamro skin care.db")
    c = conn.cursor()
    c.execute("Select p_name from RegisterPatients where p_email=:email",{'email':curntusr})
    data=c.fetchall()[0][0]
    print(data)
    d['user'] = data
    c.execute("Select * from bookappointment where patient_name=:patientname and status=:status or status=:statuss",
              {'patientname': curntusr, 'status': 'accepted','statuss':'rejected'})
    data = c.fetchall()
    # print(data)
    print("Your request has been accepted!!\nYou have an appointment with\n" + data[0][2] + " on " + data[0][
        4] + " between " + data[0][3])

    l=[]
    lst=[]
    for a in range(len(data)):
        # msg="Your request has been accepted!!\nYou have an appointment with\n" + data[a][2] + " on " + data[a][
        #     4] + " between " + data[a][3]
        l.append(data[a][2])
        l.append(data[a][4])
        l.append(data[a][3])
        l.append(data[a][5])
        lst.append(l)
        l=[]
    print(lst)

    if(len(lst)==0):
        d['list']='nomore'
    else:
        d['list']=lst
    # l = []
    # lst=[]
    # lstfinal=[]
    # for a in range(len(data)):
    #     pemail = data[a][1]
    #     c.execute("Select p_name from RegisterPatients where p_email=:email", {'email': pemail})
    #     l.append(c.fetchall()[0][0])
    #     l.append(data[a][4])
    #     l.append(data[a][3])
    #     lst.append(l)
    #     l=[]
    #
    # print(len(lst))

    response = jsonify(d)
    response.headers.add("Access-Control-Allow-Origin", "*")
    return response


if __name__ == "__main__":
    app.run(port=10000, host='0.0.0.0', debug=True)
