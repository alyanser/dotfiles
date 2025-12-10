#!/bin/sh

id=$(hyprctl -j activeworkspace | jq ".id")

rid="r[$id-$id]"

DEFAULT_GAPS_IN=8
DEFAULT_GAPS_OUT=22

gaps_in_current=$(hyprctl workspacerules -j | jq --arg rid "$rid" '[.[] | select(.workspaceString | startswith($rid)) | .gapsIn[0]] | .[0]')
gaps_out_current=$(hyprctl workspacerules -j | jq --arg rid "$rid" '[.[] | select(.workspaceString | startswith($rid)) | .gapsOut[0]] | .[0]')

echo $gaps_in_current

if [ "$gaps_in_current" = "null" ] && [ "$gaps_out_current" = "null" ] || [ "$gaps_out_current" = "$DEFAULT_GAPS_OUT" ]; then
	hyprctl keyword workspace "$rid", gapsin:0, gapsout:0
else
	hyprctl keyword workspace "$rid", gapsin:$DEFAULT_GAPS_IN, gapsout:$DEFAULT_GAPS_OUT
fi
