APP_NAME=feedback_mailer
PORT=8080
ENV_FILE=./config.env

build: ## Build container
	docker build -t $(APP_NAME) .

run: ## Run container 
	-docker run --rm --env-file=$(ENV_FILE) -p=$(PORT):$(PORT) --name="$(APP_NAME)" $(APP_NAME)

up: build run

