FROM openvino/ubuntu18_dev:2020.3

# Basics
USER root
RUN apt-get update
RUN apt-get install -y git nano htop build-essential cmake gnutls-dev pkg-config

# Install ZQM lib
WORKDIR /root
RUN git clone https://github.com/zeromq/libzmq
WORKDIR /root/libzmq/build
RUN cmake ..
RUN make -j4 install

# Install cppzmq
WORKDIR /root
RUN git clone https://github.com/zeromq/cppzmq
WORKDIR /root/cppzmq/build
RUN cmake ..
RUN make -j4 install

WORKDIR /src
ADD zmqproxy.cpp /src
RUN g++ zmqproxy.cpp -o zmqproxy /usr/local/lib/libzmq.a -pthread 2> /dev/null
