export ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim

[[ -s ${ZIM_HOME}/init.zsh ]] && source ${ZIM_HOME}/init.zsh

source $HOME/.aliases
source $HOME/.functions
source $HOME/.zsh-theme
source $HOME/.exports
source $HOME/.extra

export STOW_DIR=~/.dotfiles
