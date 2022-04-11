#/usr/bin/env bash

while [[ $(pgrep polybar) ]];do
	killall polybar
	sleep 1
done

polybar -r logobar &
polybar -r workspaces &
polybar -r date &
polybar -r cpubar &
polybar -r membar &
polybar -r windowbar &
