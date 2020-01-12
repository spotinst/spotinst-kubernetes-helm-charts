#!/usr/bin/env bash

function helm_test() {
	chart_dir="$1"
	chart_name="$(basename "${chart_dir}")"
	chart_values_path="${chart_dir}/values.test.yaml"
	chart_values_arg=""

	if [[ -f "${chart_values_path}" ]]; then
		echo "==> Using test values: ${chart_values_path}"
		chart_values_arg="--values ${chart_values_path}"
	fi

	echo "==> Rendering chart: ${chart_name}"
	${HELM} template \
		--debug \
		${chart_values_arg} \
		${chart_dir}

	echo "==> Linting chart: ${chart_name}"
	${HELM} lint \
		--debug \
		${chart_values_arg} \
		${chart_dir}
}

function main() {
	echo "==> Helm version: ${HELM_VERSION}"
	export -f helm_test

	find ./charts/ \
		-mindepth 1 \
		-maxdepth 1 \
		-type d \
		-exec bash -c 'helm_test "$0"' {} \;
}

main
