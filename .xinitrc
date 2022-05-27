[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap &
[[ -f ~/.Xresources ]] && xrdb -m ~/.Xresources

xbanish &
nitrogen --restore &
picom --experimental-backends &
polybar & 
xiccd &

xcape -e 'Super_L=Tab' -t 200
xcape -e 'Control_L=Escape' -t 200

exec ~/.cache/xmonad/xmonad-x86_64-linux
