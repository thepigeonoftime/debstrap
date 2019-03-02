source "${HOME}/.zgen/zgen.zsh"


if ! zgen saved; then
    echo "Creating a zgen save"
    
    #plugins
    zgen oh-my-zsh

    zgen oh-my-zsh plugins/git
    zgen oh-my-zsh plugins/sudo
    zgen oh-my-zsh plugins/command-not-found
    zgen oh-my-zsh plugins/jump
    #zgen oh-my-zsh plugins/thefuck

    #autoupdate
    zgen load unixorn/autoupdate-zgen


    #syntax highlighting
    zgen load jimmijj/zsh-syntax-highlighting
    zgen load zsh-users/zsh-completions src
    zgen load zsh-users/zsh-history-substring-search
    zgen load tarruda/zsh-autosuggestions

    #themes
    zgen oh-my-zsh themes/agnoster

    zgen save

fi

alias attmux="tmux attach-session -t"
alias killmux="tmux kill-session -t"
alias listmux="tmux list-sessions"
alias mux="tmux new-session -s"
alias namemux="tmux rename-session -t"

alias l="ls -la --color=auto"
alias rip="~/.cargo/bin/rg -C5 --no-ignore -iuu"
alias rg="~/.cargo/bin/rg --no-ignore -iuu"

alias vim="nvim"

f() { find ./ -name $1 }
fm() { find ./ -name \*$1\* }
fr() { find / -name $1 }
fdir() { find ./ -name $1 -type d }
fdr() { find / -name $1 -type d }
fmdir() { find ./ -name \*$1\* -type d }

listtables() { sudo iptables -t nat -L -n -v && sudo iptables -L -v -n | more }
resettables() { sudo iptables-restore < /etc/network/iptables.reset.rules; }
flushtables() {sudo iptables -F && sudo iptables -X && sudo iptables -t nat -F && sudo iptables -t nat -X && sudo iptables -t mangle -F && sudo iptables -t mangle -X && sudo iptables -P INPUT ACCEPT && sudo iptables -P FORWARD ACCEPT && sudo iptables -P OUTPUT ACCEPT}

snitches() { flushtables sudo iptables-restore < /etc/network/iptables.mitm.rules; }
stitches() { flushtables sudo iptables-restore < /etc/network/iptables.up.rules; }

ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=5
ZSH_AUTOSUGGEST_IGNORE_WIDGETS+=bracketed-paste

export LC_CTYPE="en_US.utf8"
export LANG="en_US.utf8"
export LC_ALL="en_US.UTF-8"