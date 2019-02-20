.PHONY: all
all: package index ## Execute both package and index

.PHONY: index
index: ## Generate an index file using helm
	@sh -c "'$(CURDIR)/scripts/helm-index.sh'"

.PHONY: package
package: ## Package all charts into a versioned chart archive files
	@sh -c "'$(CURDIR)/scripts/helm-package.sh'"

.PHONY: help
help: ## Print this message
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
	| sort \
	| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-10s\033[0m %s\n", $$1, $$2}'

.DEFAULT_GOAL := help
