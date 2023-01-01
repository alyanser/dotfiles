[[ $(tty) == '/dev/tty1' && ! $DISPLAY ]] && exec startx 2> /dev/null

[[ -f ~/.bashrc ]] && . ~/.bashrc
