Docker source repository for an Ubuntu-based container with my personal configuration.

## Build and Use the Container

1. Build the image:
```shell
podman build . --tag configuration
```
2. Run the container:
```shell
podman run -it --name configuration localhost/configuration:latest
```

## Windows Terminal specification

Windows Terminal `AtlasEngine` incorrectly renders some NerdFonts glyphs ([Github issue](https://github.com/microsoft/terminal/issues/14022)).
To solve the problem, you can deactivate AtlasEngine :
1. Open Windows Terminal
2. Go to `Settigs` > `Rendering`
3. Deselect **Use the new text renderer ("AtlasEngint")**

## Password management

The Dockerfile creates an user named **thalfeust** and set its password. To prevent the password from appearing unencrypted in the code, the image file contains an MD5-based hash of the password.

Procedure to modify the password:
1. Create a hash of the new password:
```shell
openssl passwd -1 "new password"
```
2. Update the Dockerfile line:
```shell
RUN echo 'thalfeust:new hash' | chpasswd -e
```
3. Re-build the image

## Documentation

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