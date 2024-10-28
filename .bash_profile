[[ $(tty) == '/dev/tty1' && ! $DISPLAY ]] && exec ~/.local/bin/exec-hyprland

[[ -f ~/.bashrc ]] && . ~/.bashrc
