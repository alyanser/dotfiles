[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap &
[[ -f ~/.Xresources ]] && xrdb -m ~/.Xresources

xbanish &
nitrogen --restore &
picom --experimental-backends &
bash ~/.config/polybar/launch.sh &
xiccd &

xcape -e 'Super_L=Tab' -t 500
xcape -e 'Control_L=Escape' -t 500

exec ~/.cache/xmonad/xmonad-x86_64-linux
