source /etc/profile

# Path to your oh-my-zsh installation.
export ZSH="$HOME"/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="my-murilasso"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git docker compleat encode64 gitfast git-flow npm sprunge sudo wd zsh-completions zsh-autosuggestions autojump)
autoload -U compinit && compinit

zstyle ':completion:*' rehash true

# User configuration

#export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

wwd()
{
  cd `cat ~/.wd`
}

wwd_zle()
{
  wwd
  zle reset-prompt
}

swd()
{
  echo -n "$PWD" > ~/.wd
}

swd_zle()
{
  swd
  zle reset-prompt
}

cd_zle()
{
  cd
  zle reset-prompt
}

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

if which exa > /dev/null 2> /dev/null ; then
  LS="exa --git"
else
  LS="ls --color=auto"
fi

alias  l="$LS --group-directories-first -lbg --ignore-glob='*.[od]'"
alias lt="$LS --group-directories-first -lbg --ignore-glob='*.[od]|vendor|node_modules' -T"
alias ll="$LS --group-directories-first -lbgaa"
alias la='getfattr -dR'
alias ne='emacs -nw'
alias cc='gcc -fmax-errors=8 -Wall -Wextra -ansi -pedantic -Wno-long-long -Og -g'
alias gpp="g++ -Wfatal-errors -Werror -Wall -Wextra -g"
alias wee='weechat-curses'
alias blih='blih -u mathias.bragagia@epitech.eu'
alias uppity='uppity -X -n kanak'
alias v="nvim"
alias tree="tree -C"
alias ssh="TERM=xterm ssh"

alias halt='systemctl poweroff'
alias reboot='systemctl reboot'
alias suspend='systemctl suspend'
alias ':q'='exit'

alias co='docker-compose'
alias cou='docker-compose up'
alias cos='docker-compose start'
alias cor='docker-compose restart'
alias cop='docker-compose stop'

alias dc='docker'
alias dcsta='docker stop $(docker ps -aq)'
alias dcrma='docker rm $(docker ps -aq)'

alias sudo='sudo '
alias pap='passeport'

export PAGER=most
export EDITOR=nvim
export PATH=$PATH":$HOME/.bin/"
# Cordova
export PATH=${PATH}:/Development/adt-bundle/sdk/platform-tools:/Development/adt-bundle/sdk/tools
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools
#Scalingo

if [ -f $HOME/.scalingo ] ; then
  source $HOME/.scalingo
fi

#if which ruby >/dev/null && which gem >/dev/null; then
#  export PATH="$(ruby -rubygems -e 'puts Gem.user_dir')/bin:$PATH"
#fi

export GOPATH=$HOME/Documents/goprojects
export PATH=$PATH:$GOPATH/bin

zle -N wwd_zle
bindkey '^W' wwd_zle

zle -N swd_zle
bindkey '^S' swd_zle

zle -N cd_zle
bindkey '^X' cd_zle
