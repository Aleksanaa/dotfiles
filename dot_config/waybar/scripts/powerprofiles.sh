#!/bin/bash

UNSELECTED='^(.*)\:$'
SELECTED='^\*[[:blank:]].*:$'
SETNEXT=0
RESULT=""
FIRST=""

while read -r line; do
	if [[ "${line}" =~ ${SELECTED} ]]; then
		SETNEXT=1
	elif [[ "${line}" =~ ${UNSELECTED} ]]; then
		if [ "${SETNEXT}" == 1 ]; then
			RESULT="${BASH_REMATCH[1]}"
			break
		elif [[ -z "${FIRST}" ]]; then
			FIRST="${BASH_REMATCH[1]}"
		fi
	fi
done <<<"$(powerprofilesctl list)"
if [[ -z "${RESULT}" && -n "${FIRST}" ]]; then
	RESULT="${FIRST}"
fi

powerprofilesctl set "${RESULT}"
