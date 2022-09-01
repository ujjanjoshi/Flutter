from flask import Flask,request,jsonify
import pandas as p

from databasesection.registerdata import GetRegisterData

app=Flask(__name__)
@app.route('/app/registerpassword',methods=['GET'])

def registervalue():
    d={}
    password=str(request.args['password'])
    if(password!="" ):
        d['valid']=True
        data = p.read_csv("../counter/recentregt.csv")
        # usernames, status, address, dateofbirth, age, gender, email, password
        indx1 = str(data.get('usernames')[0])
        indx2 = str(data.get('status')[0])
        indx7 = str(data.get('address')[0])
        indx3 = str(data.get('dateofbirth')[0])
        indx4 = str(data.get('age')[0])
        indx5 = str(data.get('gender')[0])
        indx6 = str(data.get('email')[0])
        GetRegisterData.getregisterdata(indx1, indx2,indx7, indx3, indx4, indx5, indx6, password)
    else:
        d['valid']=False
    response = jsonify(d)
    response.headers.add("Access-Control-Allow-Origin", "*")
    return response

if __name__ == "__main__":
    app.run(port=4000,host='0.0.0.0',debug=True)