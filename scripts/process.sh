#!/bin/bash

# turn on bash's job control
set -m

# Start the server process and put it in the background
python /app/src/server/zmqserver.py &

# Start the client process
python /app/src/client/zmqclient.py