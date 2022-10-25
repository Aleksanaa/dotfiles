#!/bin/bash

NOLOCKDIR="$HOME/.cache/swayidle/nolock"

case $1 in
switchnolock)
	if [[ -f "${NOLOCKDIR}" ]]; then
		rm -rf "${NOLOCKDIR}"
	else
		install -D /dev/null "${NOLOCKDIR}"
	fi
	;;
getnolock)
	while : ; do
		[[ -f "${NOLOCKDIR}" ]] && echo '(•_ゝ•)' || echo '(´_ゝ`)'
		sleep 0.2
	done
	;;
esac
