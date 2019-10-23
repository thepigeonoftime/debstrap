#!/bin/bash
set -e

### Defaults ###

def_repo="https://github.com/p1g30n/debstrap"
def_stowdir=".dotfiles"
def_locale="en_US.UTF-8"
def_shell="zsh"
txtcolor='\033[0;30m\033[47m'

### Dialogs ###

stowtext="Set local dotfile folder (name only, will be placed in \$HOME) [$def_stowdir]: "
repotext="Set dotfile repository URL to clone from (must be GNU stow compatible) [$def_repo]: "
branchtext="Optional: Set branch to pull from [master]: "
localetext="Generate default locale? [$def_locale] [Y/n]: "
apttext="Upgrade Packages? [Y/n]: "
pkgtext="Install additional packages? (defined in .packages) [Y/n]: "
cmdtext="Run commands? (defined in .commands) [Y/n]: "
stowalltext="Stow all dotfiles? [Y/n]: "
stowroottext="Stow dotfiles for root? [Y/n]: "
shelltext="Change default shell? [$def_shell]: [Y/n]: "

### Functions ###

cecho() {
	# color print function #
	echo -e "${txtcolor}${@}$(tput sgr0)"
	return
}

setopts() {
	# Y/n dialog function #
	read -p "$@" yn </dev/tty
	if [[ ! $yn =~ ^([nN][oO]|[nN])$ ]]; then
		echo true
	fi
}

setinput() {
    # Input dialog function :: ${1}=[default value], ${2}=[validation regex], ${@:3}=[dialog text] #
    unset input
    while [[ -z $input ]]; do
            read -r -p "${@:3}" input </dev/tty
            input=${input:-"${1}"}
            if ! [[ $input =~ ${2} ]]; then
                    input=
            fi
    done
    echo $input
}

### Set Install Options ###

export STOW_DIR=$HOME/$(setinput "$def_stowdir" '^\.|^[a-zA-Z]|^[0-9]' "$stowtext")
repo_url=$(setinput "$def_repo" '^(http|https)://' "$repotext")
branch=$(setinput "master" '.' "$branchtext")

set_locale=$(setopts "$localetext")
# upgrade_pkgs=$(setopts "$apttext")
# pkg_install=$(setopts "$pkgtext")
run_commands=$(setopts "$cmdtext")
stow_dotfiles=$(setopts "$stowalltext")
stow_root=$(setopts "$stowroottext")
change_shell=$(setopts "$shelltext")

### Install ###

# update packages #
# cecho "Updating packages..."
# sudo apt-get update -q

# install dependencies #
# cecho "Installing dependencies..."
# sudo apt-get install -yq git stow $def_shell

# upgrade packages #
if [[ "$upgrade_packages" == true ]]; then
	cecho "Upgrading packages..."
	sudo apt-get dist-upgrade -yq
fi

# configure locales #
if [[ "$set_locale" == true ]]; then
	cecho "Generating locale $def_locale..."
	sudo sed -i "s/^#.$def_locale/$def_locale/" /etc/locale.gen
	sudo locale-gen
fi

# clone dotfile repo #
set +e
cecho "Cloning dotfile repository..."
git clone --branch "$branch" "$repo_url" "$STOW_DIR"
while [ "$?" -ne 0 ]; do
	cecho "[ERROR] There was a problem cloning '$repo_url [$branch]'."
	export STOW_DIR=$HOME/$(setinput "$def_stowdir" '^\.|^[a-zA-Z]|^[0-9]' "$stowtext")
	repo_url=$(setinput "$def_repo" '^(http|https)://' "$repotext")
	branch=$(setinput "master" '.' "$branchtext")
	git clone --branch "$branch" "$repo_url" "$STOW_DIR"
done
set -e

# load packages and commands into vars #
pkgs=$(<$STOW_DIR/.packages)
cmds=$(<$STOW_DIR/.commands)

# install packages #
if [[ "$pkg_install" == true && ! -z "{$pkgs}" ]]; then
	cecho "Installing packages defined in .packages..."
	sudo apt-get install -yq ${pkgs}
fi

# run commands #
set +e
if [[ "$run_commands" == true && ! -z "{$cmds}" ]]; then
	cecho "Running commands defined in .commands..."
	while read -r line
	do
		eval ${line}
	done<<<${cmds}
fi
set -e

# collect dotfile folders
dotfiles=$(find "$STOW_DIR" -maxdepth 1 -type d -not -name "\.*" -not -name "\_*" -printf '%f ')
conffiles=$(find "$STOW_DIR" -maxdepth 1 -type d -not -name "\.*" -name "\_*" -printf '%f ')

# stow dotfiles #
if [[ "$stow_dotfiles"  == true && ! -z "${dotfiles}" ]]; then
	cecho "Stowing $dotfiles in $STOW_DIR ..."
	stow -d "$STOW_DIR" $dotfiles --no-folding
	if [[ ! -z "${conffiles}" ]]; then
		cecho "Stowing global conf files in: $conffiles ..."
		sudo -E stow -d "$STOW_DIR" -t / $conffiles --no-folding
	fi
	if [[ "$stow_root" == true ]]; then
		cecho "Stowing $dotfiles to /root/ ..."
		sudo -E stow -d "$STOW_DIR" -t /root/ $dotfiles --no-folding
	fi
fi

# change default shell #
if [[ "$change_shell" == true ]]; then
	cecho "Changing default shell ..."
	chsh -s $(which "$def_shell") $(whoami)
	exec "$def_shell"
fi
