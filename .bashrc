# ALIASES

alias gh="history|grep"
alias ff="fastfetch"
alias upd="sudo pacman -Syu"
alias cd="z"
alias ..="z .."
alias ls="eza --color=always --icons=always --grid  --long --no-time --no-user --no-permissions "
alias cmatrix="cmatrix -C blue"
alias lavat="lavat -c blue"
alias clocktemp="clocktemp -tf 12 -tu c -df dd/mm -s true -c blue -b default"
alias off="~/.config/hypr/scripts/monitor-switch.sh"
alias on="~/.config/hypr/scripts/monitor-on.sh"

# BAT THEME

export BAT_THEME=Nord

# STARSHIP

eval "$(starship init bash)"
export STARSHIP_CONFIG=~/.config/starship/starship.toml

# ZOXIDE

export PATH=/usr/local/bin:$PATH
eval "$(zoxide init bash)"

# FASTFETCH ON STARTUP

fastfetch
