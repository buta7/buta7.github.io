MAKEFLAGS += --warn-undefined-variables
SHELL := /bin/bash
.SHELLFLAGS := -eu -o pipefail -c
.DEFAULT_GOAL := run

# all targets are phony
.PHONY: $(shell egrep -o ^[a-zA-Z_-]+: $(MAKEFILE_LIST) | sed 's/://')

# .env
ifneq ("$(wildcard ./.env)","")
  include ./.env
endif

BUILD_DIR=build

run: ## Run server
	@lektor server -h 0.0.0.0

build: ## Build static html files
	@lektor build --output-path=${BUILD_DIR}

deploy: build ## Deploy on github
	@sh ./deploy.sh

help: ## Print this help
	@echo 'Usage: make [target]'
	@echo ''
	@echo 'Targets:'
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z0-9_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)
