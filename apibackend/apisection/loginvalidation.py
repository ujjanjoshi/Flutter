import csv
import sqlite3

from flask import Flask, request, jsonify

app = Flask(__name__)


@app.route('/app/loginvalidation', methods=['GET'])
def loginvalidationvalue():
    d = {}
    email = str(request.args['email'])
    password = str(request.args['password'])
    conn = sqlite3.connect("../apisection/hamro skin care.db")
    c = conn.cursor()
    c.execute("Select * from login where l_name=:username", {'username': email})
    data = c.fetchall()
    print(data)
    if email != "" and password != "":
        if (data != []):
            datas = data[0]
            if (email == datas[1] and password == datas[2]):
                d['valid'] = True
                f = open('../counter/tempologinacc.csv', 'w', newline="")
                writer = csv.writer(f)
                writer.writerow(['account'])
                writer.writerow([str(email)])
                f.close()
                d['id'] = data[0]
        else:
            d['valid'] = False
            d['id'] = ""
    else:
        d['valid'] = False
        d['id'] = ""
    response = jsonify(d)
    response.headers.add("Access-Control-Allow-Origin", "*")
    return response


if __name__ == "__main__":
    app.run(port=2000, host='0.0.0.0', debug=True)
