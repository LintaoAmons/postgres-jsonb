build-image:
	docker build -t postgres-demo .

run:
	docker run --name postgres-demo -p 5432:5432 postgres-demo

push:
	docker push

prepare-db: build-image
	docker-compose up -d
