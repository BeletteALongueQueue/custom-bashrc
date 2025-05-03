# Custom `.bashrc` Configuration (WSL Kali)

---

## 🧱 Terminal Environment Setup

- **Terminal type**:  
  `export TERM=xterm-256color` enables 256-color support in your terminal (important for rich-color prompts and tools like `ls`, `grep`, etc.).

- **CLI Colors**:  
  `CLICOLOR=1` and `GREP_COLORS` ensure colorized output for commands like `grep`.

---

## 🎨 Color Variables

These are ANSI escape sequences stored in variables to make your prompt and scripts more readable.

```bash
RED="\[\033[0;31m\]"
GREEN="\[\033[0;32m\]"
YELLOW="\[\033[1;33m\]"
BLUE="\[\033[0;34m\]"
CYAN="\[\033[0;36m\]"
PURPLE="\[\033[0;35m\]"
RESET="\[\033[0m\]"
```

---

## 🔧 Prompt (PS1) Customization

prompt includes:
- **Username**
- **Current directory**
- **Current Git branch** (if inside a Git repository)
- Colored output (purple for user, blue for directory, yellow for branch)

```bash
export PS1="${PURPLE}\u${RESET}:${BLUE}\w${YELLOW}\$(parse_git_branch)${RESET} → "
```

Git branch detection:
```bash
parse_git_branch() {
  git branch 2>/dev/null | grep '^\*' | sed 's/^\* / /'
}
```

---

## 🛠️ Useful Aliases

### Navigation
```bash
alias ..='cd ..'
alias ...='cd ../..'
alias ~='cd ~'
alias q='exit'
```

### File & Directory Listing
```bash
alias ls='ls --color=auto'
alias ll='ls -lh --color=auto'
alias la='ls -la --color=auto'
alias lla='ls -lah'
alias lsd='ls -l | grep "^d"'
```

### File Info
```bash
alias df='df -h'
alias ducks='du -cksh * | sort -rn | head -11'
```

### Search
```bash
alias g='grep -i'
alias f='find . -iname'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
```

### Text Viewing
```bash
alias m='more'
alias cat='batcat --paging=never --style=plain' # if available
```

---

## 📦 Git Shortcuts

```bash
alias gs="git status"
alias gd="git diff | mate"
alias gl="git pull"
alias gp="git push"
alias gb="git branch"
alias gba="git branch -a"
alias gcb="git checkout -b"
alias gc="git commit -am"
alias gco="git checkout"
alias undopush="git push -f origin HEAD^:master"
```

---

## 🌐 Network / IP Tools

```bash
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip='ipconfig getifaddr en1'
```
