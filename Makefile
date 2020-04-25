help:          ## Show this help.
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

setup:         ## Create the virtial environment to run this project
	python3 -m venv ~/.nano-devops-05

env:           ## List the environment versions
	which python3
	python3 --version
	which pytest
	which pylint

lint:          ## Check the validity of the project files
	hadolint Dockerfile
	pylint --load-plugins pylint_flask --disable=R,C app/*.py

test:          ## Run the tests for this prject
	@cd tests; pytest -vv --cov-report term-missing --cov=web test_*.py

install:       ## Install the required imports for this project
	pip install -r requirements.txt

docker-build:  ## Build the docker image and list available docker images
	docker build -t maweeks/nano-devops-05 .
	docker image ls

docker-upload: ## Upload the docker image to AWS
	$(aws ecr get-login --no-include-email --region us-east-1)
	docker tag nano-devops-05:latest 119841056280.dkr.ecr.us-east-1.amazonaws.com/nano-devops-05:latest
	docker push 119841056280.dkr.ecr.us-east-1.amazonaws.com/nano-devops-05

start-api:     ## Run the python application locally
	python web.py

all: install lint test
