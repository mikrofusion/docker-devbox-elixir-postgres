run: build
	docker-compose up

build:
	m4 -D __user__=$(USER) Dockerfile.m4 > Dockerfile
	docker build -t $(USER)/docker-devbox-elixir-postgres --build-arg user=$(USER) .

rebuild:
	m4 -D __user__=$(USER) Dockerfile.m4 > Dockerfile
	docker build --no-cache -t $(USER)/docker-devbox-elixir-postgres --pull=true --build-arg user=$(USER) .

clean:
	docker kill $(USER)/docker-devbox-elixir-postgres
	docker rm $(USER)/docker-devbox-elixir-postgres
	docker rmi $(USER)/docker-devbox-elixir-postgres

push:
	docker push $(USER)/docker-docker-devbox-elixir-postgres

publish: rebuild push
