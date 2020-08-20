docker-build:
	docker build -t docker-zmq-pub .

docker-run: 
	docker run -d --name docker-pub-server -p 5000:5000 -p 3333:3333 -t docker-zmq-pub

docker-stop:
	docker stop docker-pub-server

docker-remove:
	docker rm docker-pub-server
