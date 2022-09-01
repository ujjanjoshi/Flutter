import smtplib
import random
from email.message import EmailMessage
class verifyemail:
    number=random.randint(1000, 9999)

    def email_alert(subject,body,to):
        # print(number)
        msg= EmailMessage()
        msg.set_content(body)
        msg['subject']=subject
        msg['to']= to


        user="joshiujjan52@gmail.com"
        msg['from']=user
        password="qgcnxtdlxfnyxfhb"
        server= smtplib.SMTP("smtp.gmail.com",587)
        server.starttls()
        server.login(user, password)
        server.send_message(msg)
        server.quit()

# if __name__=='__main__':
#     print(verifyemail.number)
#     verifyemail.email_alert("this","hello","ujjanjoshi02@gmail.com");
#     print(verifyemail.number)