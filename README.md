# Dotfiles

## Installation

To get started with this setup, make a clean archlinux installation, you need to install:

_pipewire, NetworkManager, ... (TODO: add full configuration)_


Follow these steps:

1. Install git and clone the repository:

```sh
sudo pacman -S git
git clone https://github.com/xirzo/Dotfiles ~/.dotfiles
```

2. Use the installation script

```sh
cd ~/.dotfiles
sudo chmod +x ./install.sh
./install.sh
```


## Emacs EAF

```sh
cd ~/.config/emacs/site-lisp/emacs-application-framework
```

Choose most of packages, as first time I chose only essential nothing
worked... still needs tweaking:

```sh
./install-eaf.py
```

(TODO: make  '.oh-my-zsh' with custom theme a git submodule)
(TODO: add language layout, sound, mute status to i3status or i3blocks) 
(TODO: vpn via shortcuts)
(TODO: bluetooth via shortcuts)
