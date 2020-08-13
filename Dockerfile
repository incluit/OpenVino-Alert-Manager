FROM python:3.8-slim

RUN apt-get update
RUN apt-get install -y curl

RUN pip3 install pyzmq

RUN pip3 install Flask

ADD . /app
WORKDIR /app


# Flask Port
EXPOSE 5000

# Zmq Sub Server
EXPOSE 4444

RUN ["chmod", "+x", "scripts/process.sh"]

CMD ["scripts/process.sh"]
