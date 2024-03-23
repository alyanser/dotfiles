[[ $(tty) == '/dev/tty1' && ! $DISPLAY ]] && exec ~/.local/bin/hyprland

[[ -f ~/.bashrc ]] && . ~/.bashrc
