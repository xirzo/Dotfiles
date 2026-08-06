
## Installation

> [!NOTE]
> You may need to install some additional programs during installation

Install *GNU stow*

```sh
sudo pacman -S stow
```

then *stow* the directories of configurations you want to use:

```sh
stow <DIR_NAME>
```

if you wish to unlink the configuration, use:

```sh
stow -D <DIR_NAME>
```

### Setup Scripts

automatic icons/emojis/chinese symbols fonts installer:

```sh
./scripts/install_additional_fonts.sh

```

vim building and installation

```sh
./scripts/build_and_install_vim.sh
```

