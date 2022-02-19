clear
DISABLE_AUTO_TITLE="true"
#autocomplete
autoload -Uz compinit promptinit
compinit
promptinit
setopt COMPLETE_ALIASES
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#history
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS

#theme
zstyle ':completion:*' menu select
PROMPT=" %B%~ -> "

#keybinds
typeset -g -A key
key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"

[[ -n "${key[Home]}"      ]] && bindkey -- "${key[Home]}"       beginning-of-line
[[ -n "${key[End]}"       ]] && bindkey -- "${key[End]}"        end-of-line
[[ -n "${key[Up]}"        ]] && bindkey -- "${key[Up]}"         up-line-or-history
[[ -n "${key[Down]}"      ]] && bindkey -- "${key[Down]}"       down-line-or-history

if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
        autoload -Uz add-zle-hook-widget
        function zle_application_mode_start { echoti smkx }
        function zle_application_mode_stop { echoti rmkx }
        add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
        add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi                                                                                          

#aliases
function dwmrebuild(){
	
	currentdir="$PWD"
	cd ~/.local/src/dwm/
	sudo make clean install
	cd $currentdir

}

alias dwmedit='nvim ~/.local/src/dwm/config.h'
alias sudo='doas'
alias cleanup='sudo pacman -Rs $(pacman -Qqdt)'
alias yay='yay --color=always --sudo doas --sudoflags -- --save'
alias update='yay -Syyu; protonup'
alias ytdlmp3='youtube-dl -x --audio-format mp3 "$1"'
alias sx='startx'
alias pacman='pacman --color=always'
alias btop='btop --utf-force'
alias ls='ls --color=auto'

function decrypt(){
	filename="$(echo $1 | sed 's/.gpg//g')"
	if [ -d != "decrypted/" ]; then
		mkdir decrypted
	fi
	gpg -d $1 > decrypted/$filename
	cd decrypted/
}

export PATH=$HOME"/platform-tools:$PATH"
