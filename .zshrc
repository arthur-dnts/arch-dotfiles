
#  ▄████  ▄▄▄▄▄ ▄▄  ▄▄ ▄▄▄▄▄ ▄▄▄▄   ▄▄▄  ▄▄    
# ██  ▄▄▄ ██▄▄  ███▄██ ██▄▄  ██▄█▄ ██▀██ ██    
#  ▀███▀  ██▄▄▄ ██ ▀██ ██▄▄▄ ██ ██ ██▀██ ██▄▄▄ 

HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

zstyle :compinstall filename "/home/arthur/.zshrc"

autoload -Uz compinit
compinit
# End of lines added by compinstall
                                         
# █████▄ ▄▄    ▄▄ ▄▄  ▄▄▄▄ ▄▄ ▄▄  ▄▄  ▄▄▄▄ 
# ██▄▄█▀ ██    ██ ██ ██ ▄▄ ██ ███▄██ ███▄▄ 
# ██     ██▄▄▄ ▀███▀ ▀███▀ ██ ██ ▀██ ▄▄██▀ 
                                         
# DOWNLOAD ZINIT PLUGIN MANAGER
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

#SOURCE/LOAD ZINIT
source "${ZINIT_HOME}/zinit.zsh"

# PLUGINS
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab
zinit light zsh-users/zsh-completions

# LOAD COMPLETIONS
autoload -U compinit && compinit

# ZSTYLES
zstyle ":completion:*" matcher-list "m:{a-z}={A-Za-z}"
zstyle ":completion:*" menu no
zstyle ':fzf-tab:complete:*:*' fzf-preview 'eza --color=always $realpath'
                                                               
# ██ ▄█▀ ▄▄▄▄▄ ▄▄ ▄▄ ▄▄▄▄  ▄▄ ▄▄  ▄▄ ▄▄▄▄  ▄▄ ▄▄  ▄▄  ▄▄▄▄  ▄▄▄▄ 
# ████   ██▄▄  ▀███▀ ██▄██ ██ ███▄██ ██▀██ ██ ███▄██ ██ ▄▄ ███▄▄ 
# ██ ▀█▄ ██▄▄▄   █   ██▄█▀ ██ ██ ▀██ ████▀ ██ ██ ▀██ ▀███▀ ▄▄██▀ 

bindkey -e
bindkey "^p" history-search-backward
bindkey "^n" history-search-forward

# ▄████▄ ▄▄    ▄▄  ▄▄▄   ▄▄▄▄ ▄▄▄▄▄  ▄▄▄▄ 
# ██▄▄██ ██    ██ ██▀██ ███▄▄ ██▄▄  ███▄▄ 
# ██  ██ ██▄▄▄ ██ ██▀██ ▄▄██▀ ██▄▄▄ ▄▄██▀ 

alias gh="history | grep"
alias upd="sudo pacman -Syu"
alias ff="fastfetch"
alias bat="bat --color=always --theme=gruvbox-dark"
alias nfzf='nvim $(fzf -m --preview="bat --color=always {}")'
alias cd="z"
alias ..="z .."
alias ls="eza --color=always --icons=always --grid --long --no-time --no-user --no-permissions"
alias cmatrix="cmatrix -C green"
alias clocktemp="clocktemp -tf 12 -tu c -df dd/mm -s true -lat 0 -lon 0 -c green -b default"
alias off="~/.config/hypr/scripts/monitor-switch.sh"
alias on="~/.config/hypr/scripts/monitor-on.sh"
alias cht='function _cht(){ curl cheat.sh/$1; }; _cht'
# Save the content of a HTML page to read off-line
sp() {
    local url="$1"
    local dir="$HOME/.saved-pages"
    mkdir -p "$dir"
    local filename="${2:-page}.html"
    if rdrview -H "$url" > "$dir/$filename"; then
        echo "$filename saved!"
        w3m "$dir/$filename"
    else
        echo "Failed to save page."
    fi
}
# Load a saved HTML page to read off-line
lp() {
    local filename="$1.html"
    local dir="$HOME/.saved-pages"
    w3m "$dir/$filename"
}
# Browse saved pages with fzf
bp() {
    local dir="$HOME/.saved-pages"

    find "$dir" -name "*.html" \
        | sed "s|$dir/||" \
        | fzf \
        | xargs -I{} w3m "$dir/{}"
}

# ▄█████  ▄▄▄  ▄▄  ▄▄ ▄▄▄▄▄ ▄▄  ▄▄▄▄  ▄▄▄▄ 
# ██     ██▀██ ███▄██ ██▄▄  ██ ██ ▄▄ ███▄▄ 
# ▀█████ ▀███▀ ██ ▀██ ██    ██ ▀███▀ ▄▄██▀ 

# home/.local/bin
export PATH="$HOME/.local/bin:$PATH"

# FZF
source <(fzf --zsh)

# STARSHIP
eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.config/starship/starship.toml

# ZOXIDE
export PATH=/usr/local/bin:$PATH
eval "$(zoxide init zsh)"

# PSP-Dev
export PSPDEV=/opt/pspdev
export PATH=$PATH:$PSPDEV/bin

# FASTFETCH ON STARTUP
fastfetch
