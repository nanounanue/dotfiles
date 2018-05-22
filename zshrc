## Setting tmux
ZSH_TMUX_AUTOSTART=true

export DEFAULT_USER="$USER"

# Environment
source ~/dotfiles/env

# Alias
source ~/dotfiles/aliases


# Sourcing fonts
source ~/.fonts/*.sh

# Show OS info when opening a new terminal
neofetch

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


# Themes
#antigen theme geometry-zsh/geometry
#antigen theme tylerreckart/odin odin.zsh-theme
#antigen theme https://github.com/denysdovhan/spaceship-zsh-theme spaceship
#antigen theme tylerreckart/hyperzsh hyperzsh.zsh-theme

# crunch
# kardan
# alien-minimal
#antigen theme agnoster 
#antigen theme blinks
## antigen theme steeef


## Theme

# Font mode for powerlevel9k
POWERLEVEL9K_MODE='awesome-fontconfig'

POWERLEVEL9K_PROMPT_ON_NEWLINE=false
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true

POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=4

POWERLEVEL9K_TIME_FORMAT="%D{%H:%M %d.%m.%Y}"

POWERLEVEL9K_STATUS_VERBOSE=false

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(status context dir newline vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(virtualenv background_jobs time)
#POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(icons_test)

DISABLE_AUTO_TITLE="true"

antigen theme bhilburn/powerlevel9k powerlevel9k

antigen apply


