[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap &
[[ -f ~/.Xresources ]] && xrdb -m ~/.Xresources &

polybar &
xbanish &
picom &
xsetroot -cursor_name left_ptr &
xcape -e 'Control_L=Escape' -t 500 &
nitrogen --restore &

[[ -f ~/.ghcup/env ]] && source ~/.ghcup/env

exec ~/.cache/xmonad/xmonad-x86_64-linux
