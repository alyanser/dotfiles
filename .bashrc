#!/bin/bash

shopt -s globstar
shopt -s autocd

set completition-ignore-case on

function asm(){
	objdump -M intel --visualize-jumps --special-syms -zwd $1 > $1.s
}

function clip(){
	cat $1 | xclip -selection clipboard
}

stty werase \^H # makes control+backspace remove the entire word

alias cmaker="cmake -DCMAKE_BUILD_TYPE=release --toolchain ~/.toolchain.cmake -GNinja"
alias cmaked="cmake -DCMAKE_BUILD_TYPE=debug --toolchain ~/.toolchain.cmake -GNinja"
alias go="ninja -j4"
alias f="find / 2> /dev/null | grep -i"
alias ls="ls --color=always"
alias grep="grep --color=always -i"
alias ll="ls -Al --color=always"
alias tree="lsd --tree --icon=never"
alias p="ps aux | grep -i"
alias pc="proxychains"
alias pg="pgrep -i"
alias pa="pulseaudio-ctl"
alias code="vscodium"
alias vi="nvim"
alias hexdump="hexdump --canonical"
alias red="redshift -P -O"
alias top="htop"
alias batstat="watch -n 0.1 cat /sys/class/power_supply/BAT0/status"
alias py="python"
alias ghidra="_JAVA_AWT_WM_NONREPARENTING=1 ghidra"
alias gdb="gdb -q"

export PATH=$PATH:~/.local/bin
export PS1="\[\e[33m\]\w\[\e[m\]\[\e[36m\] \[\e[33m\]❯\[\e[31m\]❯\[\e[32m\]❯ \[\e[m\]"
export EDITOR=nvim
export VISUAL=vscodium

[[ -f ~/.ghcup/env ]] && source ~/.ghcup/env

[[ ! $TMUX ]] && tmux
