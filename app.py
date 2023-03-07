import os
import time
os.system('rsyslogd')
while True:
    time.sleep(60)
    os.system('> /var/log/syslog.log')

