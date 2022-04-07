#!/bin/bash

shopt -s autocd
shopt -s histappend
shopt -s checkjobs

function asm(){
	objdump -M intel --visualize-jumps --special-syms -zwd $1 > $1.s
}

function mcd(){
	mkdir $1 && cd $1
}

function bk(){
        cp -rf $1 $1.bak
}

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
alias gdb="gdb -q"
alias cli="xclip -selection clipboard"

PATH=$PATH:~/.local/bin
PS1=$'\[\e[33m\]\u::\[\e[33m\]\w\[\e[m\]\[\e[31m\] -> \[\e[39m\]'
HISTFIILESIZE=5000
PROMPT_COMMAND='history -a; history -r'
export _JAVA_AWT_WM_NONREPARENTING=1

[[ -f ~/.ghcup/env ]] && source ~/.ghcup/env

[[ ! $TMUX ]] && tmux

pfetch
