import smtplib

user = 'XXXXXXXXXXXXX@gmail.com'
password = 'YYYYYYYYYYYYY'
debug=True

sent_from = user
to = ['itsmesanju@gmail.com', 'sanju.softtester@gmail.com']
subject = 'Message from Python Script'
body = 'Test body'

email_text = """\
From: %s
To: %s
Subject: %s

%s
""" % (sent_from, ", ".join(to), subject, body)

#Use SSL or TLS. To use SSL, uncomment line # 22 and comment 26,27 or viceversa for TLS
#SSL Start
#server = smtplib.SMTP_SSL('smtp.gmail.com', 465)
#SSL End

#TLS start
server = smtplib.SMTP('smtp.gmail.com', 587) # Use this for TLS with below line.
server.starttls()
#TLS end

server.set_debuglevel(debug)

server.ehlo()
server.login(user, password)
server.sendmail(sent_from, to, email_text)
server.close()
