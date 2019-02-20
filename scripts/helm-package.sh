#!/usr/bin/env bash

function helm_package {
	chart=$1
	version=$(cat $chart/Chart.yaml | grep appVersion | awk -F':' '{print $2}')

	helm package \
		--debug \
		--app-version $version \
		--destination ./archives \
		$chart
}

function main {
	export -f helm_package

	find ./charts/ \
		-mindepth 1 \
		-maxdepth 1 \
		-type d \
		-exec bash -c 'helm_package "$0"' {} \;
}

main
