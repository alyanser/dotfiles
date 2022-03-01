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

export EDITOR=vscodium
export VISUAL=vim

function mkdircd(){
	mkdir -p $1 && cd $1
}

function asm(){
         [[ -z $1 ]] && echo \*\*\* error : elf not given \*\*\* && return

         if [[ -e $1 ]];then
                  objdump -M intel --visualize-jumps --special-syms -zwd $1 > $1.s && code $1.s
                  return
         fi
         
         echo \*\*\* error : file doesn\'t exist \*\*\*
}

stty werase \^H # makes control+backspace remove the entire word
alias cmaker="cmake -DCMAKE_BUILD_TYPE=release --toolchain ~/.toolchain.cmake -GNinja"
alias cmaked="cmake -DCMAKE_BUILD_TYPE=debug --toolchain ~/.toolchain.cmake -GNinja"
alias go="ninja"
alias f="find / 2> /dev/null | grep -i"
alias cli="kitty +kitten clipboard" 
alias ls="ls --color=always"
alias grep="grep --color=always -i"
alias ll="lsd -Al --icon=never"
alias tree="lsd --tree --icon=never"
alias p="ps aux | grep -i"
alias pc="proxychains"
alias top="htop"
alias pg="pgrep -i"
alias pa="pulseaudio-ctl"
alias kp="kitty +kitten icat"
alias kdiff="kitty +kitten diff"
alias code="vscodium"
alias battery="watch -n 0 cat /sys/class/power_supply/BAT0/status"
alias vi="vim"
export PATH=$PATH:~/.local/bin

# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION

colorscript -r