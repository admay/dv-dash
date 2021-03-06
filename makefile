.PHONY: default install lint test run-dev run-prod
.DEFAULT_GOAL := default

help:
	echo "Commands are 'sys-check', 'install', 'lint', 'test', 'run-prod', and 'run-dev'"
	echo "Use `make run-prod` to just start the app or `make` to install deps, run the tests, linting, etc..."

install:
	pip3 install -r requirements.txt

setup-dev: install
	python -m python_githooks

lint:
	flake8 *.py

test:
	PYTHONPATH=./app pytest --verbose --color=yes

run-dev:
	python3 app/app.py -d true

run-prod:
	python3 app/app.py -d false

build-image:
	docker image build -t comm-dash .

run-docker:
	docker run -p 8080:8080 comm-dash

default: install lint test run-dev
