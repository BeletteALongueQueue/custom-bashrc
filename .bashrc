# Terminal couleur 256
export TERM=xterm-256color

# Couleurs ANSI
RED="\[\033[0;31m\]"
GREEN="\[\033[0;32m\]"
YELLOW="\[\033[1;33m\]"
BLUE="\[\033[0;34m\]"
CYAN="\[\033[0;36m\]"
RESET="\[\033[0m\]"

# Afficher la branche Git actuelle
parse_git_branch() {
  git branch 2>/dev/null | grep '^\*' | sed 's/^\* /(/;s/$/)/'
}

# Prompt simple avec utilisateur, chemin et branche
#export PS1="${GREEN}\u@\h${RESET}:${BLUE}\w${YELLOW} \$(parse_git_branch)${RESET} \$ "
# Prompt actuel
export PS1="\[\033[1;35m\]\u \[\033[0;36m\]\w \[\033[1;33m\]\$(parse_git_branch)\[\033[0m\] -> "

# Prompt secondaires
export PS2='> '
export PS3='#? '
export PS4='+'

# Historique
export HISTCONTROL=ignoredups
shopt -s checkwinsize

# Bash completion (si installé)
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# Amélioration readline
bind "set completion-ignore-case on"
bind "set bell-style none"
bind "set show-all-if-ambiguous On"

# Couleurs dans commandes
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias diff='diff --color=auto'

# ls avec couleurs
alias ls='ls --color=auto'
alias ll='ls -lh --color=auto'
alias la='ls -la --color=auto'
alias lla='ls -lah --color=auto'
alias lsd='ls -l | grep "^d"'

# cat avec batcat si dispo
if command -v batcat &>/dev/null; then
    alias cat='batcat --paging=never --style=plain'
else
    alias cat='cat'
fi

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ~='cd ~'
alias q='exit'

# Divers
alias f='find . -iname'
alias g='grep -i'
alias ducks='du -cksh * | sort -rn | head -11'
alias top='top -o cpu'
alias m='more'
alias df='df -h'

# IP
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="hostname -I | cut -d' ' -f1"

# Git
alias gs='git status'
alias gd='git diff | cat'
alias gl='git pull'
alias gp='git push'
alias gb='git branch'
alias gba='git branch -a'
alias gcb='git checkout -b'
alias gc='git commit -am'
alias gco='git checkout'
alias undopush='git push -f origin HEAD^:master'


# Sauvegarde de chemins
if [ ! -f ~/.dirs ]; then touch ~/.dirs; fi
alias show='cat ~/.dirs'
save () {
    sed "/!$/d" ~/.dirs > ~/.dirs1
    mv ~/.dirs1 ~/.dirs
    echo "$@"=\"$(pwd)\" >> ~/.dirs
    source ~/.dirs
}
source ~/.dirs
shopt -s cdable_vars

# Perso
alias ebash='nano ~/.bashrc'
alias opt='cd /opt'
alias cl='clear'
alias fullupdate='sudo apt update && sudo apt upgrade -y'
