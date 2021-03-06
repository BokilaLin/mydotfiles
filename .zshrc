# Path to your oh-my-zsh installation.
export ZSH=/Users/Bokila/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
    ZSH_THEME="kphoen"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE=""

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
    export UPDATE_ZSH_DAYS=1

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
    ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
    COMPLETION_WAITING_DOTS="true"

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
plugins=(tmux django git-extras zsh-syntax-highlighting Z zsh-completions colored-man-pages )  

# User configuration

export PATH="/Users/Bokila/.gem/ruby/2.2.2/bin:/Users/Bokila/.rubies/ruby-2.2.2/lib/ruby/gems/2.2.0/bin:/Users/Bokila/.rubies/ruby-2.2.2/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# PYTHONPATH
export PYTHONPATH=$PYTHONPATH:Users/Bokila/Code/djangoproject/

# Pip settings
export PIP_REQUIRE_VIRTUALENV=true

# Use pip globally
gpip() {
    PIP_REQUIRE_VIRTUALENV="" pip "$@"
}
gpip3() {
    PIP_REQUIRE_VIRTUALENV="" pip3 "$@"
}

# You may need to manually set your language environment
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
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

# enable command line tool with postgres.app  
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.5/bin

# chruby
source /usr/local/share/chruby/chruby.sh
# all stuff below is optional
source /usr/local/share/chruby/auto.sh
#default ruby
chruby ruby-2.2.2

# setting for virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/virtualenvswrapperproject
source /usr/local/bin/virtualenvwrapper.sh

# add Apple Appearance to Commandline 
archey -c

#add alias to enable identify easily 
alias ls='ls -GFh'

#Alias for brew cask
alias cask="brew cask"

#Alias for Tmux
alias tx="tmux"

# Alias for vim mode
alias sov="set -o vi"

# Alias for nvim
alias vim="nvim"
# Alias lolcat to cat
alias cat="lolcat"

#mkdir and cd
function mkcd() { mkdir -p "$@" && cd "$_"; }

source /usr/local/opt/autoenv/activate.sh

# enable hidden file in fzf
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh # load fzf shell extension
