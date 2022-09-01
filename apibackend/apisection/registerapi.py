from flask import Flask,request,jsonify
# from apisection.holdotp import  OtpHold
import csv

from databasesection.registerdata import GetRegisterData
from gmailfunction.gmailtry import verifyemail

app=Flask(__name__)
@app.route('/app/register',methods=['GET'])

def registervalue():

    d={}
    name=str(request.args['name'])
    status=str(request.args['status'])
    address=str(request.args['address'])
    dateofbirth=str(request.args['dateofbirth'])
    age=str(request.args['age'])
    gender=str(request.args['gender'])
    email=str(request.args['email'])
    if(name!="" and status!="" and address!=""):
        d['valid']=True
        verifyemail.email_alert("Verificationcode", f"Dear user, your verification code is {str(verifyemail.number)}.\nThank you for choosing Hamro Skin Care App.", email)
        f = open('../counter/otp.csv', 'w', newline="")
        writer = csv.writer(f)
        writer.writerow(['value1','value2','value3','value4'])
        writer.writerow(str(verifyemail.number))
        f.close()
        GetRegisterData.getregisterdata(name, status, address, dateofbirth, age, gender, email,"")
    else:
        d['valid']=False
    response = jsonify(d)
    response.headers.add("Access-Control-Allow-Origin", "*")
    return response

if __name__ == "__main__":
    app.run(host='0.0.0.0',debug=True)