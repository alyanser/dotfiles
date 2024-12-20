#!/bin/bash

shopt -s autocd
shopt -s histappend
shopt -s checkjobs
shopt -s histreedit
shopt -s nocaseglob
set match-hidden-files off
# shopt -s nocasematch

stty werase undef
bind '\C-w:unix-filename-rubout'

alias grep="grep --color=always -i"
alias hd="hexdump --canonical"
alias py="python -q"
alias gdb="gdb -q"
alias objdump="objdump --demangle --visualize-jumps -M intel -zwd"
alias vi="nvim"
alias ls="eza --color=always --icons=always --sort=ext"
alias ll="ls -al"
alias tree="ls -T"
alias make='make -j$(nproc)'
alias diff="diff --color=always"
alias mixer="pulsemixer"
alias yay="yay --noconfirm"
alias df="df -h"
alias cmaker="cmake -GNinja -DCMAKE_BUILD_TYPE=Release --toolchain ~/.release-toolchain.cmake"
alias cmaked="cmake -GNinja -DCMAKE_BUILD_TYPE=Debug --toolchain ~/.debug-toolchain.cmake"
alias svi="sudoedit"
alias ff="firefox"
alias sunset="hyprsunset -t 2000 &"
alias du="du -h"
alias clang++="clang++ -fcolor-diagnostics -std=c++20"
alias clang="clang -fcolor-diagnostics"
alias prep="cmaker -B build --fresh"
alias dprep="cmaked -B debug-build --fresh"
alias go="cmake --build build"
alias dgo="cmake --build debug-build"

function rist() {
	ristretto "$1" &> /dev/null &
}

function oku() {
	okular "$1" &> /dev/null &
}

function bg() {
	"$@" > /dev/null 2>&1 &
}

function open() {
	xdg-open "$1" &> /dev/null &
}

function cpwd() {
	pwd | wl-copy
}

function psa() {
	ps aux | grep "$1"
}

function mvv() {
	local src="$1"
	local dst="$2"
	local ext="${src##*.}"

	if [[ "$src" == *"."* ]]; then
		mv "$src" "${dst}.${ext}"
	else
		mv "$src" "$dst"
	fi
}

function copy() {
	cat $1 | wl-copy
}

function rid() {
	kill -9 $(pgrep $1)
}

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
		PS1+=" ${red}"
		# PS1+=" ${red}$"
	else
		PS1+=" ${green}"
	fi

	PS1+="${reset_col} "
}

PROMPT_COMMAND=__prompt_command__
export HISTFILESIZE=-1
export HISTSIZE=-1
HISTCONTROL=ignorespace

export PATH=$PATH:~/.local/bin:.
export EDITOR="nvim"
export VISUAL="nvim"
export CC=clang
export CXX=clang++
export CMAKE_TOOLCHAIN_FILE=~/.release-toolchain.cmake
# export CMAKE_TOOLCHAIN_FILE=~/.debug-toolchain.cmake
export LD_LIBRARY_PATH=/lib:/usr/lib:/usr/local/lib

unset GDK_BACKEND

export LESS_TERMCAP_mb=$'\e[1;31m'
export LESS_TERMCAP_md=$'\e[1;31m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;32m'

[[ -f /usr/share/bash-completion/bash_completion ]] && . /usr/share/bash-completion/bash_completion
[[ -f ~/.fzf-bash.sh ]] && source ~/.fzf-bash.sh || true

eval "$(zoxide init --cmd cd bash)"
