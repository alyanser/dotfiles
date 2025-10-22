#!/bin/bash

shopt -s autocd histappend checkjobs histreedit nocaseglob

set match-hidden-files off
stty werase undef
stty -ixon
bind '\C-w:unix-filename-rubout'

alias grep="grep --color=always -i"
alias hd="hexdump --canonical"
alias py="python -q"
alias gdb="gdb -q"
alias objdump="objdump --demangle --visualize-jumps -M intel -zwd"
alias vi="nvim"
alias ls="eza --color=always --icons=always --sort=ext -x"
alias ll="ls -al"
alias tree="ls -T"
alias make='make -j$(nproc)'
alias diff="diff --color=always"
alias mixer="pulsemixer"
alias yay="yay --noconfirm"
alias df="df -h"
alias cmaker="cmake -GNinja -DCMAKE_BUILD_TYPE=Release --toolchain ~/.release-toolchain.cmake"
alias cmaked="cmake -GNinja -DCMAKE_BUILD_TYPE=Debug --toolchain ~/.debug-toolchain.cmake"
alias ff="firefox"
alias svi="sudoedit"
alias sunset="hyprsunset -t 2000 &"
alias du="du -h"
alias pgrep="pgrep -i"
alias nc="ncat"
alias qml="qml6"
alias ftp="lftp"
alias rg="rg -i"
# alias clang++="clang++ -fcolor-diagnostics -std=c++26"
# alias clang="clang -fcolor-diagnostics"

function rist() {
	(ristretto "$1" &> /dev/null &)
}

function copy() {
	cat "$1" | wl-copy
}

function path() {
	realpath "$1" | tr -d '\n' | wl-copy
}

function oku() {
	(okular "$1" &> /dev/null &)
}

function citem() {
	(realpath $1 | wl-copy)
}

function psa() {
	ps aux | rg -i "$1"
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
		PS1+=" ${red}$"
	else
		PS1+=" ${green}$"
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
export CMAKE_TOOLCHAIN_FILE=~/.release-toolchain.cmake
export CMAKE_GENERATOR="Ninja"
export LD_LIBRARY_PATH=/lib:/usr/lib:/usr/local/lib

# export CFLAGS="-O3 -DNDEBUG -march=native -mtune=native -fno-omit-frame-pointer -flto=full"
# export CXXFLAGS="$CFLAGS"
# export LDFLAGS="-flto=full -Wl,-s"
export CC="clang"
export CXX="clang++"

unset GDK_BACKEND

export LESS_TERMCAP_mb=$'\e[1;31m'
export LESS_TERMCAP_md=$'\e[1;31m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;32m'

[[ $- != *i* ]] && return

[[ -f /usr/share/bash-completion/bash_completion ]] && . /usr/share/bash-completion/bash_completion
[[ -f ~/.fzf-bash.sh ]] && source ~/.fzf-bash.sh

eval "$(zoxide init --cmd cd bash)"
export WINEPREFIX=~/.wine-gta


alias conf='vi ~/.config/nvim/lua/'
