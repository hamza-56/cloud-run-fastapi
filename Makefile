NAME = your_project_name

## Build locally
build:
	docker build -t $(NAME) .

## Run locally
run:
	docker run --rm -p 8080:8080 -e PORT=8080 --name "$(NAME)" $(NAME)

## Build and run locally
up: build run

## Remove existing containers
down:
	docker container rm -f $(NAME)

## Open container shell
shell:
	docker exec -it $(NAME) /bin/bash

## Deploy service to Cloud Run
deploy:
	gcloud builds submit

## Clean the generated/compiles files
clean:
	echo "nothing to clean ..."
