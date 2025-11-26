FROM python:3.12
LABEL authors='Arne Schauf, Ben Kepner <u6bkep@gmail.com>'

ADD requirements.txt /opt/requirements.txt
RUN pip install -r /opt/requirements.txt

VOLUME /srv/bepasty
ENV BEPASTY_CONFIG /srv/bepasty/bepasty.conf
ENV PYTHONUNBUFFERED 0
ENV LISTEN_IP [::]
ENV LISTEN_PORT 5000
EXPOSE 5000

WORKDIR /opt

ADD start.sh /opt/start.sh
ADD bepasty.conf /opt/bepasty.conf
ADD wsgi.py /opt/wsgi.py
RUN chmod 550 /opt/start.sh

CMD ["./start.sh"]
