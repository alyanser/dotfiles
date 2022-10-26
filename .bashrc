#!/bin/bash

[[ -f /usr/share/bash-completion/bash_completion ]] && . /usr/share/bash-completion/bash_completion

shopt -s autocd
shopt -s histappend
shopt -s checkjobs
shopt -s checkhash

stty werase undef
bind '\C-w:unix-filename-rubout'

alias grep="grep --color=always -i"
alias hd="hexdump --canonical"
alias redshift="redshift -P -O"
alias py="python -q"
alias gdb="gdb -q"
alias cli="xclip -selection clipboard"
alias tree="tree -C"
alias ncm="ncmpcpp -q"
alias objdump="objdump --visualize-jumps -M intel -zwd"
alias go="ninja"
alias vi="nvim"
alias ls="exa --color=always"
alias ll="ls -al"
alias cat="bat --theme=base16 --paging=never"
alias cmaker="cmake -DCMAKE_BUILD_TYPE=release -GNinja --toolchain ~/.toolchain.cmake"
alias cmaked="cmake -DCMAKE_BUILD_TYPE=debug -GNinja --toolchain ~/.toolchain.cmake"
alias make="make -j$(nproc)"
alias clear="clear; zwaves; echo"

function __prompt_command__(){
	local status="$?"

	local reset_col='\[\e[0m\]'
	local red='\[\e[0;31m\]'
	local green='\[\e[0;32m\]'
	local orange='\[\e[1;33m\]'
	local blue='\[\e[1;34m\]'
	local purple='\[\e[0;35m\]'

	PS1="${purple}( ${orange}\u${purple}::${blue}\w${purple} )"

	if [[ $status != 0 ]];then
		PS1+="${red} $> ${reset_col}"
	else
		PS1+="${orange} $> ${reset_col}"
	fi
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

pfetch
