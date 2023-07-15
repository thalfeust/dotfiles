FROM ubuntu:22.04

ENV HOME /home/config

# Do not install suggested dependencies
RUN echo 'APT::Install-Suggests "0";' >> /etc/apt/apt.conf.d/00-docker
RUN echo 'APT::Install-Recommends "0";' >> /etc/apt/apt.conf.d/00-docker

# Package update
RUN DEBIAN_FRONTEND=noninteractive \
	apt-get update

# Installion of Ubuntu packages
RUN apt-get install -y \
	wget \
	zip unzip

# Installion of programming packages
RUN apt-get install -y \
	git \
	python3 python3-pip ipython3

# Installion of environment packages
RUN apt-get install -y \
	tmux \
	vim

# Installion of Fira Code Nerd font
RUN mkdir -p $HOME/.fonts
RUN wget "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/FiraCode.zip"
RUN unzip FiraCode.zip -d $HOME/.fonts

# Copy of dotfiles
COPY .config $HOME/.config

# Tmux configuration
RUN git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
RUN ~/.tmux/plugins/tpm/bin/install_plugins 

# Git configuration
RUN git config --global core.editor "vim"
RUN git config --global core.commentChar '%'