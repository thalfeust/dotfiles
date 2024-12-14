# Alias definitions
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# PATH
export PATH=$PATH:/home/linuxbrew/.linuxbrew/bin
export PATH=$PATH:$(brew --prefix)/bin
export PATH=$PATH:$HOME/.local/bin

# bash-preexec used by Atuin
[[ -f ~/.bash-preexec.sh ]] && source ~/.bash-preexec.sh

# Atuin
eval "$(atuin init bash)"
