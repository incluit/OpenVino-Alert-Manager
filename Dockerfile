FROM python:3.8-slim

RUN apt-get update && apt-get -y upgrade && apt-get autoremove

RUN apt-get install -y --no-install-recommends \
        build-essential \
        curl \
        zip unzip \
        sudo

RUN pip3 install pyzmq

RUN pip3 install Flask

ADD . /app
WORKDIR /app

RUN ["chmod", "+x", "scripts/process.sh"]

CMD ["scripts/process.sh"]
