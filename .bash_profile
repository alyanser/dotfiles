[[ $(tty) == '/dev/tty1' && ! $DISPLAY ]] && exec bash ~/.local/bin/hyprland

[[ -f ~/.bashrc ]] && . ~/.bashrc
