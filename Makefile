SHELL := /bin/bash
.PHONY: help

help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

clean: ## Cleanup tmp files
	@find . -type f -name '*.pyc' -delete 2>/dev/null
	@find . -type d -name '__pycache__' -delete 2>/dev/null
	@find . -type f -name '*.DS_Store' -delete 2>/dev/null

submodule-update: ## git submodule foreach git submodule update
	git submodule sync
	git submodule foreach git submodule update
	git submodule status --recursive
