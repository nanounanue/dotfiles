## Setting tmux
ZSH_TMUX_AUTOSTART=true

export DEFAULT_USER="$USER"

# Environment
source ~/dotfiles/env

# Alias
source ~/dotfiles/aliases


# Sourcing fonts
source ~/.fonts/devicons-regular.sh
source ~/.fonts/fontawesome-regular.sh
source ~/.fonts/pomicons-regular.sh
source ~/.fonts/octicons-regular.sh

# Show OS info when opening a new terminal
#neofetch

##############################
##
## Antigen
##
##############################

source ~/software/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found
antigen bundle colored-man-pages

antigen bundle docker
antigen bundle dirhistory
antigen bundle git-extras
antigen bundle tmux
antigen bundle httpie
antigen bundle jsontools
antigen bundle pep8
antigen bundle pyenv
antigen bundle python
antigen bundle web-search

# Themes
#antigen bundle tylerreckart/odin
#antigen bundle tylerreckart/hyperzsh


# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting

#antigen bundle mafredri/zsh-async
#antigen bundle marszall87/lambda-pure

DISABLE_AUTO_TITLE="true"

# antigen theme crunch
antigen theme steeef

antigen apply

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
