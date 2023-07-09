FROM ubuntu:22.04

ENV HOME /home/config

# Do not install suggested dependencies
RUN echo 'APT::Install-Suggests "0";' >> /etc/apt/apt.conf.d/00-docker
RUN echo 'APT::Install-Recommends "0";' >> /etc/apt/apt.conf.d/00-docker

# Package update
RUN DEBIAN_FRONTEND=noninteractive \
	apt-get update

# Installing programming packages
RUN apt-get install -y \
	git \
	python3 python3-pip ipython3

# Installing environment packages
RUN apt-get install -y \
	tmux \
	vim

# Copy of dotfiles
COPY .config $HOME/.config

# Tmux configuration
RUN git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
RUN ~/.tmux/plugins/tpm/bin/install_plugins