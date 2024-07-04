FROM python:3.10-bullseye

WORKDIR /usr/src/app

COPY . .


RUN apt-get update -y
RUN apt-get install -y python3-pip
RUN apt-get install -y python3
RUN pip3 install -r requirements.txt
RUN pip3 install -r requirements-server.txt

CMD ["gunicorn", "app:app", "0.0.0.0:8000"]


