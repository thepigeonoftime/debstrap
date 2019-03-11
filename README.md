### debstrap

###### dotfile boostrap for Debian based systems using GNU stow
_____


##### Usage
The script asks for a git repository (+ optional branch) with a GNU stow compatible folder structure to clone from, installs necessary dependencies and then walks you through a set of possible actions:

* configure default locale
* upgrade packages
* install packages defined in ```.packages``` (one per line or space delimited)
* run commands defined in ```.commands``` (one per line)
* stow all dotfiles in repository
* stow dotfiles for root user
* change default shell


##### Installation
Read install.sh, download, optionally change defaults, run.

Alternative one-liner:  

```source <(curl -s https://raw.githubusercontent.com/p1g30n/dotstrap/master/install.sh)```  
  
(use at own risk)