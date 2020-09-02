docker-build:
	docker build -t docker-zmq-pub .
	cd  ./src/proxy && docker build . -t zmq:v1

docker-run:
	docker run -d --name docker-pub-server --network host -t docker-zmq-pub
	docker run -d --network host --restart unless-stopped --name zmqproxy -v $$PWD:/bin ubuntu:20.04 /bin/zmqproxy

docker-stop:
	docker stop docker-pub-server
	docker stop zmqproxy

docker-remove:
	docker rm docker-pub-server
	docker rm zmqproxy
