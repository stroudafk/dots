# dotfiles

## Stow
This version control tree is designed with Stow in mind. It can be used without, though it involves a lot of manual copying and syncing to facilitate changes and to get things working as intended.

### Installation
Install [Stow](https://www.gnu.org/software/stow/manual/stow.html) using your package manager.

**NixOS**
```pkgs.stow```

**Mac**
```brew install stow```

### Set up
Clone the repository in your $HOME directory:
```
> git clone https://github.com/stroudafk/dots
> cd $HOME/dots
> stow . # will create symlinks to the dot files within this repository
```

## Contributing
Remember that Stow will propagate your $HOME file tree according to the file tree defined in this repository.

For example, a directory at the root level of this repo named `henlo` will cause the directory `$HOME/henlo` to be populated with corresponding symlinks.

If you need any directories or files to be ignored, I have overriden the default [.stow-global-ignore](https://www.gnu.org/software/stow/manual/html_node/Types-And-Syntax-Of-Ignore-Lists.html) with .stow-local-ignore, which contains all of the default ignore properties in addition to instructions to ignore the `archive` directory, as I think it may be neat to peek into the config I used throughout college.
