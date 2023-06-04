# Set up the prompt

autoload -Uz promptinit
promptinit
prompt adam1

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 8000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=8000
SAVEHIST=8000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

#add k alias for kubectl
autoload bashcompinit && bashcompinit # https://jessicadeen.com/fixed-az-completion10-command-not-found-complete/
#autoload -Uz compinit # https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/#optional-kubectl-configurations-and-plugins
#compinit
source <(kubectl completion zsh)
alias k=kubectl # helpful alias
complete -F __start_kubectl k

# Linux antigen file
#source /usr/share/zsh-antigen/antigen.zsh
source ~/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Load the theme
antigen theme https://github.com/denysdovhan/spaceship-zsh-theme spaceship

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
#antigen bundle heroku
antigen bundle pip
antigen bundle golang
antigen bundle docker
#antigen bundle lein
antigen bundle command-not-found
#antigen bundle autojump
antigen bundle common-aliases
antigen bundle compleat
antigen bundle git-extras
antigen bundle git-flow
#antigen bundle npm
antigen bundle web-search
antigen bundle z
antigen bundle zsh-users/zsh-history-substring-search ./zsh-history-substring-search.zsh

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# NVM bundle
#export NVM_LAZY_LOAD=true
#antigen bundle lukechilds/zsh-nvm
#antigen bundle Sparragus/zsh-auto-nvm-use

# Tell Antigen that you're done.
antigen apply

# Setup zsh-autosuggestions
source "$HOME/.antigen/bundles/zsh-users/zsh-autosuggestions/zsh-autosuggestions.zsh"

# Load custom aliases
[[ -s "$HOME/.bash_aliases" ]] && source "$HOME/.bash_aliases"

# Installed by fzf install.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export EDITOR=vim
export PATH=$HOME/go/bin:$PATH

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform

export USE_GKE_GCLOUD_AUTH_PLUGIN=True
alias vim=/usr/bin/nvim
