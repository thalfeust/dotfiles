FROM ubuntu:23.04

# Creation of a non-root user
RUN useradd thalfeust --create-home
# Hashed password
RUN echo 'thalfeust:$1$NNyHo..o$T3r.ibNMUY49VYuvwAOMy0' | chpasswd -e
RUN usermod -aG sudo thalfeust
ENV HOME /home/thalfeust

ENV DEBIAN_FRONTEND=noninteractive
# Fix tmux colors
ENV TERM xterm-256color

# Do not install suggested dependencies
RUN echo 'APT::Install-Suggests "0";' >> /etc/apt/apt.conf.d/00-docker
RUN echo 'APT::Install-Recommends "0";' >> /etc/apt/apt.conf.d/00-docker

# Package update
RUN	apt-get update

# Installation of Ubuntu packages
RUN apt-get install -y \
	sudo \
	wget \
	zip unzip \
	curl \
	tzdata \
	procps \
	file \
	bat

# Set the timezone
ENV TZ=Europe/Paris
RUN ln -fs /usr/share/zoneinfo/Europe/Paris /etc/localtime

# Installation of programming packages
RUN apt-get install -y \
	git \
	build-essential \
	python3 python3-pip ipython3

# Installation of environment packages
RUN apt-get install -y \
	tmux \
	vim

# Installation of Fira Code Nerd font
RUN mkdir -p $HOME/.fonts
RUN wget "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/FiraCode.zip"
RUN unzip FiraCode.zip -d $HOME/.fonts

# Neovim installation
RUN curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
RUN chmod u+x nvim.appimage
RUN ./nvim.appimage --appimage-extract
RUN ln -s /squashfs-root/AppRun /usr/bin/nvim_exe
RUN rm nvim.appimage

# Neovim configuration
COPY ./nvim /usr/bin/
RUN chmod +x /usr/bin/nvim

# Homebrew installation
RUN git clone https://github.com/Homebrew/brew /home/linuxbrew/.linuxbrew
ENV PATH=/home/linuxbrew/.linuxbrew/bin:$PATH
RUN chown -R thalfeust /home/linuxbrew/.linuxbrew

# Change ownership and permissions of the home directory
RUN chown -R thalfeust:thalfeust /home/thalfeust && chmod -R 755 /home/thalfeust
USER thalfeust
WORKDIR $HOME

# Copy of dotfiles
COPY .bash* $HOME
COPY .config $HOME/.config

# Tmux configuration
RUN git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
RUN $HOME/.tmux/plugins/tpm/bin/install_plugins

# Git configuration
RUN git config --global core.editor "vim"
RUN git config --global core.commentChar '%'

# Bat theme configuration
RUN wget -P "$(bat --config-dir)/themes" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Frappe.tmTheme
RUN bat cache --build