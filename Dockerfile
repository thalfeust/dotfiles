FROM ubuntu:22.04

ENV HOME /home/config

# Do not install suggested dependencies
RUN echo 'APT::Install-Suggests "0";' >> /etc/apt/apt.conf.d/00-docker
RUN echo 'APT::Install-Recommends "0";' >> /etc/apt/apt.conf.d/00-docker

# Package update
RUN DEBIAN_FRONTEND=noninteractive \
	apt-get update

# Installation of Ubuntu packages
RUN apt-get install -y \
	wget \
	zip unzip \
	curl

# Installation of programming packages
RUN apt-get install -y \
	git \
	python3 python3-pip ipython3

# Installation of environment packages
RUN apt-get install -y \
	tmux \
	vim

# Installion of Fira Code Nerd font
RUN mkdir -p $HOME/.fonts
RUN wget "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/FiraCode.zip"
RUN unzip FiraCode.zip -d $HOME/.fonts

# Neovim installation
RUN curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
RUN chmod u+x nvim.appimage
RUN ./nvim.appimage --appimage-extract
RUN ./squashfs-root/AppRun --version
RUN ln -s /squashfs-root/AppRun /usr/bin/nvim_exe
RUN rm nvim.appimage

# Copy of dotfiles
COPY .bash* $HOME
COPY .config $HOME/.config

# Tmux configuration
RUN git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
RUN ~/.tmux/plugins/tpm/bin/install_plugins

# Neovim configuration
COPY ./nvim /usr/bin/
RUN chmod +x /usr/bin/nvim

# Git configuration
RUN git config --global core.editor "vim"
RUN git config --global core.commentChar '%'