#!/usr/bin/env bash

function helm_package() {
	chart_dir="$1"
	chart_name="$(basename "${chart_dir}")"

	echo "==> Packaging chart: ${chart_name}"
	${HELM} package \
		--debug \
		--destination ./archives \
		${chart_dir}
}

function main() {
	export -f helm_package

	find ./charts/ \
		-mindepth 1 \
		-maxdepth 1 \
		-type d \
		-exec bash -c 'helm_package "$0"' {} \;
}

main
