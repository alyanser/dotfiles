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

function __prompt_command__(){
	local status="$?"

	local reset_col='\[\e[0m\]'
	local red='\[\e[0;31m\]'
	local green='\[\e[0;32m\]'
	local orange='\[\e[1;33m\]'
	local blue='\[\e[1;34m\]'
	local purple='\[\e[0;35m\]'

	PS1="${orange}\u ${purple}@ ${blue}\W"

	if [[ $status != 0 ]];then
		PS1+="${orange} ($status)${red} ﲅ  ${reset_col}"
	else
		PS1+="${green}   ${reset_col}"
	fi
}

PROMPT_COMMAND=__prompt_command__
HISTFILESIZE=

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

[[ ! $TMUX ]] && tmux -2
pfetch
