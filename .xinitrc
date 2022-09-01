[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap
[[ -f ~/.Xresources ]] && xrdb -m ~/.Xresources

xbanish &
nitrogen --restore &
picom --experimental-backends &
xsetroot -cursor_name left_ptr &
polybar & 
xcape -e 'Control_L=Escape' -t 200

[[ -f ~/.ghcup/env ]] && source ~/.ghcup/env

exec xmonad
