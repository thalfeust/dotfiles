# Dotfiles

Fully automated deployment of my development environment, based on Ansible.

> This repo is heavily influenced by [TechDufus](https://github.com/TechDufus/dotfiles)'s repo

## Usage

This playbook includes a custom shell script located at bin/dotfiles that initialize the environment and performs a full system upgrade.

```shell
sudo ls && source <(curl -fsSL https://raw.githubusercontent.com/thalfeust/dotfiles/main/bin/dotfiles)
```

> ℹ️ Note: The script clones the repository using the https URL, but changes the remote to a SSH URL, which requires an SSH key

After the first run, the script can be executed using the following command:

```shell
sudo ls && source ~/.dotfiles/bin/dotfiles
```

> ⚠️ Warning: Execution of the script using `source` is mandatory for certain updates to be applied

## Requirements

* Operating System: **Ubuntu**
* Sudo access rights

## Ansible

Ansible is an open-source IT automation tool that simplifies configuration management, application deployment, and task automation across distributed systems.

It is used to deploy the development environment into the localhost machine.

### Sensitive Data

To facilitate deployment, this repository contains a vault with sensitive data, such as the password, etc. See dedicated documentation page.

> Currently, the vault only contains the sudo password, which is used when `become` is set to `true`.

## Windows Terminal specification

Windows Terminal `AtlasEngine` incorrectly renders some NerdFonts glyphs ([Github issue](https://github.com/microsoft/terminal/issues/14022)).
To solve the problem, you can deactivate AtlasEngine :
1. Open Windows Terminal
2. Go to `Settigs` > `Rendering`
3. Deselect **Use the new text renderer ("AtlasEngint")**

## Documentation

* [Ansible](./doc/Ansible.md)
* [Docker container configuration](./doc/DockerContainer.md)
* [Font and Theme documentation](./doc/FontAndTheme.md)
* [Neovim configuration](./doc/NeovimConfiguration.md)

## Resources

### Elijah Manor
* 󰗃 [Zero to IDE with LazyVim](https://www.youtube.com/watch?v=N93cTbtLCIM) 
*  [Dotfiles](https://github.com/elijahmanor/dotfiles/tree/master)

### Chris@Machine
* 󰗃 [Neovim IDE from Scratch - Introduction (100% lua config)](https://www.youtube.com/watch?v=ctH-a-1eUME&list=PLhoH5vyxr6Qq41NFL4GvhFp-WLd5xzIzZ)
* 󰊤 [Neovim-from-scratch](https://github.com/LunarVim/Neovim-from-scratch)

### Dream Of Code
* 󰗃 [Turn VIM into a full featured IDE with only one command](https://www.youtube.com/watch?v=Mtgo-nP_r8Y&list=PL05iK6gnYad1sb4iQyqsim_Jc_peZdNXf)
* 󰗃 [Tmux has forever changed the way I write code.](https://www.youtube.com/watch?v=DzNmUNvnB04)
*  [Tmux dotfiles](https://github.com/dreamsofcode-io/tmux/blob/main/tmux.conf)
*  [Dotfiles](https://github.com/dreamsofautonomy/dotfiles)

### DevOps Toolbox - Omerxx
* 󰗃 [Tmux from scratch to Beast Mode](https://www.youtube.com/watch?v=GH3kpsbbERo)
*  [Dotfiles](https://github.com/omerxx/dotfiles)

### TechDufus
* 󰗃 [Automating your Dotfiles with Ansible: A Showcase](https://www.youtube.com/watch?v=hPPIScBt4Gw)
*  [Dotfiles](https://github.com/TechDufus/dotfiles)

### TheAltF4Stream
* 󰗃 [How To Automate Your Dev Setup](https://www.youtube.com/watch?v=V_Cj_p6se3k)
*  [Dotfiles](https://github.com/ALT-F4-LLC/dotfiles)

### Others
*  [Awesome Tmux - List of helpful tmux links for various tutorials, plugins, and configuration settings](https://github.com/rothgar/awesome-tmux) 
