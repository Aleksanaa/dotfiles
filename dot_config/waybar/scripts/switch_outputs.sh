#!/bin/bash

CURRENT_SINK="$(pactl get-default-sink)"
SINK_REGEX='^[[:digit:]]*[[:blank:]]([^ [:blank:]]*)[[:blank:]]'
SETNEXT=0
FIRST=""
RESULT=""

while read -r line; do
	if [[ "${line}" =~ ${SINK_REGEX} ]]; then
		current="${BASH_REMATCH[1]}"
		if [[ "${current}" =~ ${CURRENT_SINK} ]]; then
			SETNEXT=1
		elif [[ -z "${FIRST}" ]]; then
			FIRST="${current}"
		elif [[ "${SETNEXT}" == 1 ]]; then
			RESULT="${current}"
		fi
	fi
done <<<"$(pactl list short sinks)"

if [[ -z "${RESULT}" ]]; then
	RESULT="${FIRST}"
fi

pactl set-default-sink "${RESULT}"

