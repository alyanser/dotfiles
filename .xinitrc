[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

xmodmap ~/.Xmodmap &
xbanish &
nitrogen --restore &
picom --experimental-backends &
xiccd &

xcape -e 'Alt_L=Tab' -t 250
xcape -e 'Control_L=Escape' -t 250

exec xmonad 
