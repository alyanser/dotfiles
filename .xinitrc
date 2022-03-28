[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap &
[[ -f ~/.Xresources ]] && xrdb -m ~/.Xresources

xbanish &
nitrogen --restore &
picom --experimental-backends &
polybar &
dunst &

xcape -e 'Super_L=Tab' -t 250
xcape -e 'Control_L=Escape' -t 250

exec ~/.cache/xmonad/xmonad-x86_64-linux
