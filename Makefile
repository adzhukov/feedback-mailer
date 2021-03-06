APP_NAME=feedback_mailer
HOST_PORT=80
CONTAINER_PORT=8080
ENV_FILE=./config.env

build: ## Build container
	docker build -t $(APP_NAME) .

run: ## Run container 
	-docker run -d --rm --env-file=$(ENV_FILE) -p=$(HOST_PORT):$(CONTAINER_PORT) --name="$(APP_NAME)" $(APP_NAME) 

stop:
	-docker stop $(APP_NAME)

up: build run

