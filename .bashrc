#!/bin/bash

[[ -f /usr/share/bash-completion/bash_completion ]] && . /usr/share/bash-completion/bash_completion

shopt -s autocd
shopt -s histappend
shopt -s checkjobs
shopt -s histreedit
shopt -s nocaseglob

stty werase undef
bind '\C-w:unix-filename-rubout'

alias grep="grep --color=always -i"
alias hd="hexdump --canonical"
alias redshift="redshift -P -O"
alias py="python -q"
alias gdb="gdb -q"
alias tree="tree -C"
alias ncm="ncmpcpp -q"
alias objdump="objdump --visualize-jumps -M intel -zwd"
alias vi="nvim"
alias ls="exa --color=always"
alias ll="ls -al"
alias make='make -j$(nproc)'
alias diff="diff --color=always"
alias mixer="pulsemixer"

alias cmaker="cmake -GNinja -DCMAKE_BUILD_TYPE=Release --toolchain ~/.release-toolchain.cmake"
alias cmaked="cmake -GNinja -DCMAKE_BUILD_TYPE=Debug --toolchain ~/.debug-toolchain.cmake"

function __prompt_command__(){
	local status="$?"

	local reset_col='\[\e[0m\]'
	local red='\[\e[0;31m\]'
	local green='\[\e[0;32m\]'
	local orange='\[\e[1;33m\]'
	local blue='\[\e[1;34m\]'
	local purple='\[\e[0;35m\]'

	PS1="${purple}(\u "

	if [[ $status != 0 && $status != 130 ]]; then
		PS1+="${red}@"
	else
		PS1+="${green}@"
	fi

	PS1+=" ${blue}\w${purple})"

	if [[ $status != 0 && $status != 130 ]]; then
		PS1+=" ${red}>${orange}>${red}>"
	else
		PS1+=" ${purple}>${orange}>${purple}>"
	fi

	PS1+="${reset_col} "
}

PROMPT_COMMAND=__prompt_command__
HISTFILESIZE=
HISTSIZE=

export PATH=$PATH:~/.local/bin:.
export EDITOR="nvim"
export VISUAL="nvim"
export CC=clang
export CXX=clang++
unset GDK_BACKEND

export LESS_TERMCAP_mb=$'\e[1;31m'
export LESS_TERMCAP_md=$'\e[1;31m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;32m'
