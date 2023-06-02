#!/bin/bash

[[ -f /usr/share/bash-completion/bash_completion ]] && . /usr/share/bash-completion/bash_completion

shopt -s autocd
shopt -s histappend
shopt -s checkjobs

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
alias cmaker="cmake -GNinja --toolchain ~/.toolchain.cmake -DCMAKE_BUILD_TYPE=Release"
alias cmaked="cmake -GNinja --toolchain ~/.toolchain.cmake -DCMAKE_BUILD_TYPE=Debug"
alias make='make -j6'
alias diff="diff --color=always"
alias mixer="pulsemixer"
alias clear='clear; zwaves'

function mk(){
	[[ -f Makefile ]] && make || ninja
}

function zwaves(){
	f=3 b=4

	for j in f b; do
		for i in {0..7}; do
			printf -v $j$i %b "\e[${!j}${i}m"
		done
	done

	for i in {0..7}; do
		printf -v fbright$i %b "\e[9${i}m"
	done

	bld=$'\e[1m'
	rst=$'\e[0m'
	inv=$'\e[7m'

cat << EOF
 $f1▀■▄ $f2▀■▄ $f3▀■▄ $f4▀■▄ $f5▀■▄ $f6▀■▄
  $bld$fbright1▀■▄ $fbright2▀■▄ $fbright3▀■▄ $fbright4▀■▄ $fbright5▀■▄ $fbright6▀■▄$rst

EOF
}

function __prompt_command__(){
	local status="$?"

	local reset_col='\[\e[0m\]'
	local red='\[\e[0;31m\]'
	local green='\[\e[0;32m\]'
	local orange='\[\e[1;33m\]'
	local blue='\[\e[1;34m\]'
	local purple='\[\e[0;35m\]'

	PS1="${orange}(\u "

	if [[ $status != 0 ]]; then
		PS1+="${red}@"
	else
		PS1+="${green}@"
	fi

	PS1+=" ${blue}\w${orange})"

	if [[ $status != 0 ]]; then
		PS1+="${red}"
	else
		PS1+="${green}"
	fi

	PS1+=" $"
	PS1+="${reset_col} "
}

PROMPT_COMMAND=__prompt_command__
HISTFILESIZE=
HISTSIZE=

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

nerdfetch && echo
