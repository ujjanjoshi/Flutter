import pandas as p
data = p.read_csv("../counter/otp.csv")

print(data.get('value1')[0])
