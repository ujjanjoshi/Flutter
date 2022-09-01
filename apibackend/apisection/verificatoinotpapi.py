from flask import Flask,request,jsonify
import pandas as p

valuess=""
apps=Flask(__name__)
@apps.route('/app/verifyotp',methods=['GET'])
def notifrequvalue():
    d={}
    valuec1=str(request.args['value1'])
    valuec2=str(request.args['value2'])
    valuec3=str(request.args['value3'])
    valuec4=str(request.args['value4'])
    data = p.read_csv("../counter/otp.csv")
    value1 = str(data.get('value1')[0])
    value2 = str(data.get('value2')[0])
    value3 = str(data.get('value3')[0])
    value4 = str(data.get('value4')[0])
    if(valuec1==value1 and valuec2==value2 and valuec3==value3 and valuec4==value4):
        d['valids']=True
        print(value2)
    response = jsonify(d)
    response.headers.add("Access-Control-Allow-Origin", "*")
    return response

if __name__ == "__main__":
    apps.run(port=3000,host='0.0.0.0',debug=True)