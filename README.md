# dotfiles

Note to self: considering alternatives to stow, as I had some issues with stow forgetting it had created some symlinks and not understanding the home. Unsure if this was user error or not.

## Composing dots when system configurations are slightly different
Recently, I realized that dotfiles between systems are not entirely identical. For example, tpm on mac requires .zshrc to set environment path, but this breaks the tmux config on linux. I am exploring another method of creating and tracking configurations where you specify the device specific items in one file (ideally the default file location), and specify common, shared items in another file to be sourced in the distinct file. This way, applications can still auto append context specific items to the file (and sometimes common things, which can be moved out manually after verifying symmetry).

Be careful of source and destination (also working directory path) when stowing due to device differences. For example, zsh-mac or zsh-linux?

## Dependencies
1. fzf (for fzf.lua)
2. updated tree sitter parsers (run :TSUpdate , or if that doesn't work, :TSUninstall markdown , then :TSInstall markdown)
    if receiving an error like: `error executing vim.schedule lua callback`
    - You will also need to install lua-language-server, ltex-ls (for md files) with brew (on macos. nixos should handle the dependencies for these on its own)
3. tpm (for tmux plugins)
4. Nix (for lazy-lsp)

---

Below is my methodology for tracking changes to my dotfiles as of 5/27/2025.

You can read about methods to track changes in your dotfiles [here](https://dotfiles.github.io/tutorials/).

In the end, I decided to go with GNU Stow. I am of the opinion that for practical projects, it is best to keep things simple until complexity is required. This opinion influenced me to turn my .config directory into a git repository and then add everything * to the .gitignore, and git add -f explicitly everything that I want to include to avoid tracking things I am not interested in, or contains too much personal information. However, this method means that I would be unable to track anything that exists outside of my dotfiles, like my Hyprland config, my NixOS configuration, and my .zshrc configuration. These caveats led me to search for another solution.

## GNU Stow
This version control tree is designed with Stow in mind. It can be used without, though it involves a lot of manual copying and syncing to facilitate changes and to get things working as intended.

### How it works
When called from the proper directory, Stow will propagate your $HOME file tree with symlinks according to the file tree defined in this repository.

For example, a directory at the root level of this repo named `henlo` will cause the directory `$HOME/henlo` to be populated with corresponding symlinks.

Stow has an option `--dotfiles` to help manage dot files more clearly. This option allows you to prepend dotfile directories (that would be hidden otherwise) with "dot-" instead. This way, you're not dealing with a directory full of hidden files.

For example, a directory at the root level of this repo named `dot-henlo` will cause the directory `$HOME/.henlo` to be populated with corresponding symlinks.

If you need any directories or files to be ignored, I have overriden the default [.stow-global-ignore](https://www.gnu.org/software/stow/manual/html_node/Types-And-Syntax-Of-Ignore-Lists.html) with `.stow-local-ignore`, which contains all of the default ignore properties in addition to instructions to ignore the `archive` directory, as I think it may be neat to peek into the config I used throughout college.

### Installation
Install [Stow](https://www.gnu.org/software/stow/manual/stow.html) using your package manager.
**NixOS**
`pkgs.stow`

**Mac**
`brew install stow`

### Set up
Clone the repository in your $HOME directory:
```
git clone https://github.com/stroudafk/dots
cd $HOME/dots
stow --dotfiles . # will create symlinks to the dot files within this repository
```
This repository uses stow's `--dotfiles` options. This means that a 


## Migrating from .config to dots
Any new application will not be configured to be managed by Stow.

1. First, copy from .config to dots/
    > `cp ~/.config/nvim ~/dots`
2. Then, back up the base configuration.
    > `mv ~/.config/nvim ~/.config/nvim.bak`
3. In `dots/`, run `stow .`
4. Confirm symlink creation
    > `ls ~/.config`
