# debstrap

 ###### dotfile boostrap for Debian based systems using GNU stow
  
### Installation

##### Manual / Dotfiles only
* Install packages ```git``` and ```stow```
* clone repository to a dotfile folder in $HOME
* cd into the folder and stow dotfiles from there

##### Using Install.sh

Read ```install.sh```, download, optionally change defaults, and run.  
The script asks for a git repository (+ optional branch) with a GNU stow compatible folder structure to clone from, installs necessary dependencies and then walks you through a set of possible actions:

* configure default locale
* upgrade packages
* install packages defined in ```.packages``` (one per line or space delimited)
* run commands defined in ```.commands``` (one per line)
* stow all dotfiles in repository
* stow dotfiles for root user
* change default shell


*Optional one-liner:*  

```bash -c "$(wget -qO- https://raw.githack.com/p1g30n/debstrap/master/install.sh)"```

*(use at own risk)*

