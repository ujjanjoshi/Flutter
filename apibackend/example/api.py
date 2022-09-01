

from flask import Flask,request,jsonify

from databasetry import insrtdb

app = Flask(__name__)

@app.route('/api',methods = ['GET'])
def returnascii():
    d={}
    inputchr = str(request.args['query'])
    inputchr2 = str(request.args['query2'])
    answer = str(inputchr)
    d['output'] = answer
    answer2= str(inputchr2)
    d['pass']=answer2
    insrtdb(answer,answer2)
    print(d)
    return d

if __name__ == "__main__":
    app.run(port=22000,host='0.0.0.0',debug=True)
