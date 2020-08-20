docker-build:
	docker build -t docker-zmq-pub .

docker-run: 
	docker run -d --name docker-pub-server --network host -t docker-zmq-pub

docker-stop:
	docker stop docker-pub-server

docker-remove:
	docker rm docker-pub-server
