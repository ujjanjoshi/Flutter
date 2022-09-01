from flask import Flask,request,jsonify

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
    print(name,status,address,dateofbirth,age,gender,email)
    if(name!="" and status!="" and address!=""):
        d['valid']=True
        verifyemail.email_alert("Verificationcode", "Dear user, your verification code is"+verifyemail.number+".\nThank you for choosing Hamro Skin Care App.", email);
    else:
        d['valid']=False
    response = jsonify(d)
    response.headers.add("Access-Control-Allow-Origin", "*")
    return response

if __name__ == "__main__":
    app.run(host='0.0.0.0',debug=True)