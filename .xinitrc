[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

xmodmap ~/.Xmodmap &
xbanish &
nitrogen --restore &
picom --experimental-backends &
xiccd &

xcape -e 'Alt_L=Tab'
xcape -e 'Alt_R=backslash'
xcape -e 'Control_L=Escape'
xcape -e 'Shift_L=Shift_L|7' -t 250

exec xmonad
