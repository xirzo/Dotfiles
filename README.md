
<p align="center">
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/758f9a9b-cfac-43eb-b82b-3c89cff4ee77" />
</p>


<p align="center">
<img width="1920" height="1080" alt="pic" src="https://github.com/user-attachments/assets/879efdd2-4777-4291-8470-11b93b6625d3" />
</p>

## Installation

Clone with submodules:

```sh
git clone --recursive https://github.com/xirzo/Dotfiles.git
```

Install *GNU stow*

### Fedora

```sh
sudo dnf install stow
```

### Arch

```sh
sudo pacman -S stow
```

Then *stow* the directories of configurations you want to use:

> [!WARNING]
> After doing `stow steam`, do an `update-desktop-database ~/.local/share/applications`

```sh
stow <DIR_NAME>
```

As *vim* is a _gitsubmodule_ is should be used as so:

```sh
stow -d "$PWD/vim" -t "$HOME" vim
```

If you wish to unlink the configuration, use:

```sh
stow -D <DIR_NAME>
```

## XDG oh-my-zsh

Dotfiles use XDG paths, so one is set for *oh-my-zsh*, do `stow zsh` before installing it!
