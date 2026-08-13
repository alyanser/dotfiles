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
set -x CC clang
set -x CXX clang++
set -x CMAKE_TOOLCHAIN /home/staz/.release-toolchain.cmake

alias config="nvim ~/.config/hypr/hyprland.lua"
alias fconfig="nvim ~/.config/fish/config.fish"
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
alias fd="fd --hidden -I"
alias vibrance="hyprshade on vibrance"
alias night="hyprshade on night"
alias cdf='cd "$(dirname "$_")"'
alias df='duf'
alias kall="killall"
alias bat="bat --theme=Catppuccin\ Frappe"
alias rist="ristretto"
alias rmnt="rclone mount gdrive: ~/gdrive --vfs-cache-mode writes --rc --daemon"
alias rumnt="fusermount -u ~/gdrive"
alias gdu="gdu -c"

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

function fish_prompt_redraw --on-event fish_prompt
	commandline -f repaint
end

function __disown_all --on-event fish_exit
	disown (jobs -p)
end

zoxide init fish | source

set -gx PATH "/home/staz/.local/bin" $PATH

set --global fish_color_valid_path green  # overrides to blue when it IS a valid path
