#!/bin/bash

stty -ixon

shopt -s autocd
shopt -s histappend
shopt -s checkjobs

alias cmaker="cmake -DCMAKE_BUILD_TYPE=release --toolchain ~/.toolchain.cmake -GNinja"
alias cmaked="cmake -DCMAKE_BUILD_TYPE=debug --toolchain ~/.toolchain.cmake -GNinja"
alias go="ninja -j4"
alias ls="ls --color=always"
alias grep="grep --color=always -i"
alias ll="ls -Al --color=always"
alias pa="pulseaudio-ctl"
alias code="vscodium"
alias vi="nvim"
alias hd="hexdump --canonical"
alias redshift="redshift -P -O"
alias batstat="watch -n 0.1 cat /sys/class/power_supply/BAT0/status"
alias py="python"
alias gdb="gdb -q"
alias cli="xclip -selection clipboard"
alias tree="tree -C"
alias pg="pgrep -i"
alias objdump="objdump --visualize-jumps -M intel --special-syms -zw"

PS1=$'\[\e[33m\]\u\[\e[31m\]::\[\e[34m\]\w\[\e[m\]\[\e[31m\] $ \[\e[39m\]'
HISTFIILESIZE=
export PAGER=most
export PATH=$PATH:~/.local/bin


[[ ! $TMUX ]] && tmux

[[ -f ~/.ghcup/env ]] && source ~/.ghcup/env
