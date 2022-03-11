#!/bin/bash

if [ -f /usr/share/bash-completion/bash_completion ]; then
	. /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
	. /etc/bash_completion
fi

iatest=$(expr index "$-" i)

if [[ $iatest > 0 ]]; then bind "set bell-style visible"; fi

shopt -s globstar
shopt -s autocd

PROMPT_COMMAND='history -a'

if [[ $iatest > 0 ]]; then bind "set completion-ignore-case on"; fi
if [[ $iatest > 0 ]]; then bind "set show-all-if-ambiguous On"; fi

export EDITOR=nvim
export VISUAL=vscodium

function mcd(){
	mkdir -p $1 && cd $1
}

function asm(){
	objdump -M intel --visualize-jumps --special-syms -zwd $1 > $1.s && vscodium $1.s
}

stty werase \^H # makes control+backspace remove the entire word
alias cmaker="cmake -DCMAKE_BUILD_TYPE=release --toolchain ~/.toolchain.cmake -GNinja"
alias cmaked="cmake -DCMAKE_BUILD_TYPE=debug --toolchain ~/.toolchain.cmake -GNinja"
alias go="ninja"
alias f="find / 2> /dev/null | grep -i"
alias clipboard="kitty +kitten clipboard"
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
export PATH=$PATH:~/.local/bin

# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION

PS1='\[\e[0;38;5;214m\]\w \[\e[0;38;5;154m\]->> \[\e[0m\]'
pfetch
