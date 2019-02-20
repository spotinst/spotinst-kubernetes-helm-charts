#!/usr/bin/env bash

# Base URL of our Helm repository
HELM_REPO_BASE_URL=https://spotinst.github.io/spotinst-kubernetes-helm-charts/archives

function helm_index {
	helm repo index \
		--debug \
		--url $HELM_REPO_BASE_URL \
		./archives

	mv ./archives/index.yaml .
}

function main {
	helm_index
}

main
