#!/bin/bash

[[ -f /usr/share/bash-completion/bash_completion ]] && . /usr/share/bash-completion/bash_completion

shopt -s autocd
shopt -s histappend
shopt -s checkjobs

alias grep="grep --color=always -i"
alias hd="hexdump --canonical"
alias redshift="redshift -P -O"
alias batstat="watch -n 0.1 cat /sys/class/power_supply/BAT0/status"
alias py="python"
alias gdb="gdb -q"
alias cli="xclip -selection clipboard"
alias tree="tree -C"
alias nc="ncmpcpp -q"
alias objdump="objdump --visualize-jumps -M intel -zw"
alias go="ninja"
alias vi="nvim"
alias ls="exa --color=always"
alias ll="ls -al"
alias mixer="pulsemixer"
alias cat="bat --theme=base16 --paging=never"
alias make="make LLVM=1 -j$(nproc)"
alias cmaker="cmake -DCMAKE_BUILD_TYPE=release --toolchain ~/.toolchain.cmake -GNinja"
alias cmaked="cmake -DCMAKE_BUILD_TYPE=debug --toolchain ~/.toolchain.cmake -GNinja"
alias clear="clear && zwaves && echo"

HISTFIILESIZE=
PS1=$'\[\e[32m\][\[\e[33m\]\u @ \[\e[34m\]\w\[\e[m\]\[\e[32m\]] \[\e[35m\]$\[\e[m\] '

export PATH=$PATH:~/.local/bin:.
export EDITOR="nvim"
export VISUAL="nvim"

export LESS_TERMCAP_mb=$'\e[1;31m'
export LESS_TERMCAP_md=$'\e[1;31m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;32m'

stty werase undef
bind '\C-w:unix-filename-rubout'

[[ ! $TMUX ]] && tmux
zwaves && echo
