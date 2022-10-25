#!/bin/bash

NOLOCKDIR="$HOME/.cache/swayidle/nolock"
SELF="${BASH_SOURCE[0]}"

case $1 in
start)	
	# swayidle has problem on multi timeout
	swayidle -w \
		timeout "$2" "bash ${SELF} suspend" \
		before-sleep "bash ${SELF} lock_screen" \
		timeout "$3" "bash ${SELF} suspend_when_lock"
	;;
suspend)
	[[ -f "${NOLOCKDIR}" ]] || systemctl suspend
	;;
lock_screen)
	([[ -f "${NOLOCKDIR}" ]] && pgrep -x gtklock) || gtklock -d
	;;
# when screen is locked, close it sooner
suspend_when_lock)
	pgrep -x gtklock && bash "${SELF}" lock_screen
	;;
esac
