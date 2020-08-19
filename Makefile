docker-build:
	docker docker build -t docker-zmq-pub .

docker-run: 
	docker docker run -d --name docker-pub-server -p 5000:5000 -p 4444:4444 -t docker-zmq-pub

docker-stop:
	docker stop docker-pub-server

docker-remove:
	docker rm docker-pub-server
