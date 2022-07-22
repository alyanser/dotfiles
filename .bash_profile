[[ $(tty) == '/dev/tty1' && ! $DISPLAY ]] && startx 2&> /dev/null

[[ -f ~/.bashrc ]] && . ~/.bashrc
