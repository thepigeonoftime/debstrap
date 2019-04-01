#
# User configuration sourced by interactive shells
#
# zmodload zsh/zprof

# Define zim location
export ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim

# Start zim
[[ -s ${ZIM_HOME}/init.zsh ]] && source ${ZIM_HOME}/init.zsh

source $HOME/.oh-my-zsh/plugins/jump/jump.plugin.zsh
source $HOME/.oh-my-zsh/plugins/git/git.plugin.zsh
source $HOME/.oh-my-zsh/plugins/sudo/sudo.plugin.zsh

alias attmux="tmux attach-session -t"
alias killmux="tmux kill-session -t"
alias listmux="tmux list-sessions"
alias mux="tmux new-session -s"
alias namemux="tmux rename-session -t"

alias l="ls -la --color=auto"
alias rip="~/.cargo/bin/rg -C5 --no-ignore -iuu"
alias rg="~/.cargo/bin/rg --no-ignore -iuu"

alias stow="stow --no-folding"
alias vim="nvim"

f() { find ./ -name $1 }
fm() { find ./ -name \*$1\* }
fr() { find / -name $1 }
fdir() { find ./ -name $1 -type d }
fdr() { find / -name $1 -type d }
fmdir() { find ./ -name \*$1\* -type d }

export LC_CTYPE="en_US.utf8"
export LANG="en_US.utf8"
export LC_ALL="en_US.UTF-8"


# POWERLEVEL9K_MODE='awesome-patched'
# POWERLEVEL9K_PROMPT_ON_NEWLINE=true
# POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status time dir_writable ip custom_wifi_signal ram_joined load )
# POWERLEVEL9K_DISABLE_RPROMPT=true
# RPROMPT="%{%}"
# POWERLEVEL9K_SHORTEN_DIR_LENGTH=1

POWERLEVEL9K_CONTEXT_TEMPLATE='%n'
POWERLEVEL9K_MODE="nerdfont-complete"
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='white'
POWERLEVEL9K_BATTERY_CHARGING='yellow'
POWERLEVEL9K_BATTERY_CHARGED='green'
POWERLEVEL9K_BATTERY_DISCONNECTED='$DEFAULT_COLOR'
POWERLEVEL9K_BATTERY_LOW_THRESHOLD='10'
POWERLEVEL9K_BATTERY_LOW_COLOR='red'
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=''
POWERLEVEL9K_BATTERY_ICON='\uf1e6 '
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{014}\u2570%F{cyan}\uF460%F{073}\uF460%F{109}\uF460%f "
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='yellow'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='yellow'
POWERLEVEL9K_VCS_UNTRACKED_ICON='?'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status time dir_writable load)
POWERLEVEL9K_RAM_ELEMENTS=(ram_free)
OWERLEVEL9K_TIME_FORMAT="%D{\uf017 %H:%M \uf073 %d/%m/%y}"
POWERLEVEL9K_TIME_BACKGROUND='white'
POWERLEVEL9K_RAM_BACKGROUND='yellow'
POWERLEVEL9K_LOAD_CRITICAL_BACKGROUND="white"
POWERLEVEL9K_LOAD_WARNING_BACKGROUND="white"
POWERLEVEL9K_LOAD_NORMAL_BACKGROUND="white"
POWERLEVEL9K_LOAD_CRITICAL_FOREGROUND="red"
POWERLEVEL9K_LOAD_WARNING_FOREGROUND="yellow"
POWERLEVEL9K_LOAD_NORMAL_FOREGROUND="black"
POWERLEVEL9K_LOAD_CRITICAL_VISUAL_IDENTIFIER_COLOR="red"
POWERLEVEL9K_LOAD_WARNING_VISUAL_IDENTIFIER_COLOR="yellow"
POWERLEVEL9K_LOAD_NORMAL_VISUAL_IDENTIFIER_COLOR="green"
POWERLEVEL9K_HOME_ICON=''
POWERLEVEL9K_HOME_SUB_ICON=''
POWERLEVEL9K_FOLDER_ICON=''
POWERLEVEL9K_STATUS_VERBOSE=true
POWERLEVEL9K_STATUS_CROSS=true

# zprof
