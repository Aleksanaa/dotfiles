#!/bin/bash

LOCATION="$HOME/.config/hypr/background"
HASH=""

start() {
	for l in ${LOCATION}; do
		swaybg --image "${LOCATION}" --mode fill &
		break;
	done
}

stop() {
	pkill swaybg
}

restart() {
	stop; start
}

monitor() {
	new_hash=$(md5sum "${LOCATION}")
	[[ ! $HASH == "${new_hash}" ]] && HASH=${new_hash} && restart
	sleep 3
}

while true; do
	monitor
done
