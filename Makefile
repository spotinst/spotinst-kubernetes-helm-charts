.DEFAULT_GOAL := help
.EXPORT_ALL_VARIABLES:

##@ Development

HELM         := helm
HELM_VERSION := $(shell $(HELM) version --short)
HELM_SCRIPTS := $(CURDIR)/scripts

.PHONY: release
release: test package index ## Execute test, package and index

.PHONY: index
index: ## Generate an index file using helm
	@sh -c "'$(HELM_SCRIPTS)/helm-index.sh'"

.PHONY: package
package: ## Package all charts into a versioned chart archive files
	@sh -c "'$(HELM_SCRIPTS)/helm-package.sh'"

.PHONY: test
test: ## Test a chart by render templates locally
	@sh -c "'$(HELM_SCRIPTS)/helm-test.sh'"

##@ Utility

.PHONY: todo
todo: ## Show to-do items per file
	@grep \
		--exclude-dir=vendor \
		--exclude-dir=.idea \
		--text \
		--color \
		-nRo \
		-E 'TODO.*' \
		.

.PHONY: help
help: ## Display this help
	@awk 'BEGIN {FS = ":.*##"; printf "Usage: make \033[36m<target>\033[0m\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)
