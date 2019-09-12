export ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim

[[ -s ${ZIM_HOME}/init.zsh ]] && source ${ZIM_HOME}/init.zsh

source $HOME/.oh-my-zsh/plugins/jump/jump.plugin.zsh
source $HOME/.oh-my-zsh/plugins/git/git.plugin.zsh
source $HOME/.oh-my-zsh/plugins/sudo/sudo.plugin.zsh

source $HOME/.aliases
source $HOME/.functions
source $HOME/.zsh-theme
source $HOME/.exports
source $HOME/.extra

