FROM ubuntu

RUN apt update &&  apt upgrade -y
RUN apt update &&  apt install -y nano python3

RUN apt install -y ntpdate rsyslog netcat
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install tzdata
RUN ln -fs /usr/share/zoneinfo/America/Santiago /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata
ENV TZ=America/Santiago

RUN apt upgrade -y
RUN apt clean all && apt update --fix-missing
RUN apt autoremove
RUN apt clean

WORKDIR /home
ADD rsyslog.conf /etc/rsyslog.conf
ADD app.py /home/
CMD /usr/bin/python3 /home/app.py

