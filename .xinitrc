[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap
[[ -f ~/.Xresources ]] && xrdb -m ~/.Xresources

polybar & 
xbanish &
picom --experimental-backends &
xsetroot -cursor_name left_ptr &
xcape -e 'Control_L=Escape' -t 500 &
nitrogen --restore &

[[ -f ~/.ghcup/env ]] && source ~/.ghcup/env

exec xmonad
