# CatppuccinI3Dotfiles

🎨 My setup dotfiles

## Introduction

Welcome to my personal dotfiles repository! This repository contains configuration files and scripts to set up my preferred development environment.

## Dependencies

- 📜 [fixed dmenu](https://github.com/enkore/j4-dmenu-desktop)
- 🖼️ feh
- 🎛️ polybar
- 🖥️ i3wm
- 💻 oh-my-posh
- 🔤 Iosevka Nerd Font
- 📋 xclip
- 📸 maim
- 👻 ghostty
- 🐱 ~kitty~

## Installation

To get started with this setup, follow these steps:

1. Clone the repository:

   ```sh
   git clone https://github.com/xirzo/CatppuccinI3Dotfiles.git
   cd CatppuccinI3Dotfiles
   ```

2. Install the dependencies listed above using your package manager.
3. Symlink the configuration files to their respective locations. For example:

   ```sh
   stow CatppuccinI3Dotfiles/i3
   stow CatppuccinI3Dotfiles/polybar
   stow CatppuccinI3Dotfiles/ghostty
   ```

4. Restart your window manager or reboot your system to apply the changes.

## Usage

Once the installation is complete, you can start using the customized environment. Here are most needed keybindings:

- `Mod + Enter`: Open a new terminal.
- `Mod + D`: Launch dmenu for application selection.
- `Mod + Shift + Q`: Close the focused window.
- `Mod + [1-9]`: Switch to the corresponding workspace.
