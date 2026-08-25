
<p align="center">
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/758f9a9b-cfac-43eb-b82b-3c89cff4ee77" />
</p>


<p align="center">
<img width="1920" height="1080" alt="pic" src="https://github.com/user-attachments/assets/879efdd2-4777-4291-8470-11b93b6625d3" />
</p>


## Installation

Install *GNU stow*

```sh
sudo dns install stow
```

then *stow* the directories of configurations you want to use:

> [!WARNING]
> After doing `stow steam`, do an `update-desktop-database ~/.local/share/applications`

```sh
stow <DIR_NAME>
```

if you wish to unlink the configuration, use:

```sh
stow -D <DIR_NAME>
```

## XDG oh-my-zsh

dotfiles use XDG paths, so one is set for *oh-my-zsh*, do `stow zsh` before installing it!

### Setup Scripts

vim building and installation

```sh
./scripts/build_and_install_vim.sh
```


