if status is-login
	if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
		exec start-hyprland &> /dev/null 
	end
end

if not status is-interactive
	return
end

set -g fish_greeting ""
set -x EDITOR nvim
set -x VISUAL nvim
set -x CMAKE_GENERATOR "Ninja"

alias ls="eza --color=always --icons=always --sort=ext -x"
alias grep="grep --color=always -i"
alias hd="hexdump --canonical"
alias py="python -q"
alias gdb="gdb -q"
alias objdump="objdump --demangle --visualize-jumps -M intel -zwd"
alias vi="nvim"
alias ls="eza --color=always --icons=always --sort=ext -x"
alias ll="ls -al"
alias tree="ls -T"
alias make='make -j5'
alias diff="diff --color=always"
alias mixer="pulsemixer"
alias yay="yay --noconfirm"
alias cmaker="cmake -GNinja -DCMAKE_BUILD_TYPE=Release --toolchain ~/.release-toolchain.cmake"
alias cmaked="cmake -GNinja -DCMAKE_BUILD_TYPE=Debug --toolchain ~/.debug-toolchain.cmake"
alias ff="firefox"
alias svi="sudoedit"
alias du="du -h"
alias pgrep="pgrep -i"
alias nc="ncat"
alias qml="qml6"
alias ftp="lftp"
alias rg="rg -i"
alias fd="fd --hidden"
alias vibrance="hyprshade on vibrance"
alias night="hyprshade on night"
alias cdf='cd "$(dirname "$_")"'
alias df='duf'
alias kall="killall"
alias bat ="bat --theme=Catppuccin\ Frappe"

function psa
	ps aux | grep $argv | grep -v grep
end

function pushit
	cd ~/shills
	git add .
	git commit -m "non cred update"
	git push
end

function copy
	cat "$argv" | wl-copy
end

complete -c paru -w pacman
