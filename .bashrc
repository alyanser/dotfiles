#!/bin/bash

shopt -s globstar
shopt -s autocd

set completition-ignore-case on
set show-all-if-ambiguous on

function mcd(){
	mkdir -p $1 && cd $1
}

function asm(){
	objdump -M intel --visualize-jumps --special-syms -zwd $1 > $1.s && vscodium $1.s
}

function clip(){
	cat $1 | kitty +kitten clipboard
}

function backup(){
	cp $1 $1.bak -rf
}

stty werase \^H # makes control+backspace remove the entire word

alias cmaker="cmake -DCMAKE_BUILD_TYPE=release --toolchain ~/.toolchain.cmake -GNinja"
alias cmaked="cmake -DCMAKE_BUILD_TYPE=debug --toolchain ~/.toolchain.cmake -GNinja"
alias go="ninja"
alias f="find / 2> /dev/null | grep -i"
alias ls="ls --color=always"
alias grep="grep --color=always -i"
alias ll="lsd -Al --icon=never"
alias tree="lsd --tree --icon=never"
alias p="ps aux | grep -i"
alias pc="proxychains"
alias pg="pgrep -i"
alias pa="pulseaudio-ctl"
alias icat="kitty +kitten icat"
alias kdiff="kitty +kitten diff"
alias code="vscodium"
alias vi="nvim"
alias hexdump="hexdump --canonical"
alias red="redshift -P -O"
alias top="htop"
alias battery="watch -n 0.1 cat /sys/class/power_supply/BAT0/status"

export PATH=$PATH:~/.local/bin
export PS1="\[\e[33m\]\u -- \[\e[34m\]\w\[\e[m\]\[\e[36m\] > \[\e[m\]"
export EDITOR=nvim
export VISUAL=vscodium

pfetch
