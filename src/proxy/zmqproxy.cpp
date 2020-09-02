#include <zmq.hpp>

int main (int argc, char *argv[])
{
    zmq::context_t context(1);

    //  Socket facing clients
    zmq::socket_t frontend (context, ZMQ_XSUB);
    frontend.bind("tcp://*:3333");

    //  Socket facing services
    zmq::socket_t backend (context, ZMQ_XPUB);
    backend.bind("tcp://*:4444");

    //  Start the proxy
    zmq::proxy(static_cast<void*>(frontend),
               static_cast<void*>(backend), nullptr);
    return 0;
}
