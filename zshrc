# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="spaceship"
DEFAULT_USER="nanounanue"   ## Added for the agnoster theme, so it can hide the name saving screen space

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git docker  dirhistory git-extras tmux httpie jsontools pip pep8 pyenv python web-search aws)

ZSH_TMUX_AUTOSTART=true

source $ZSH/oh-my-zsh.sh

# User configuration
export PATH="$HOME/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"

# Alias que uso
. ~/dotfiles/aliases


export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"

## Pyenv
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"


# Spark
export SPARK_HOME="$HOME/software/spark"

# Scala
export SCALA_HOME="$HOME/software/scala-2.11.7"

export TERM=xterm-256color

export PATH="$SPARK_HOME/bin:$SCALA_HOME/bin:$PATH"

