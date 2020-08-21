FROM python:3.8-slim

RUN apt-get update && apt-get -y upgrade && apt-get autoremove

RUN apt-get install -y --no-install-recommends \
        build-essential \
        curl \
        zip unzip \
        git \
        gcc \
        make \
        cmake \
        cmake-gui\
        cmake-curses-gui \
        libssl-dev \
        sudo
RUN curl -s "https://get.sdkman.io" | bash
RUN /bin/bash -c "source /root/.sdkman/bin/sdkman-init.sh && sdk install java"

RUN pip3 install pyzmq

RUN pip3 install Flask

ADD . /app
WORKDIR /app


# Flask Port
EXPOSE 5000

# Zmq Sub Server
EXPOSE 3333

RUN ["chmod", "+x", "scripts/process.sh"]

CMD ["scripts/process.sh"]
