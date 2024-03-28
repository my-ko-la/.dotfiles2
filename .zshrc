# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="half-life"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions web-search sudo copypath copyfile copybuffer dirhistory history jsontools macos)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#/fcloud-tools/zsh-kubectl-prompt/kubectl.zsh

autoload -U colors; colors
#
# Jumping around common directories
alias cdh="cd ~"
alias cdm="cd ~/misc"
alias cdo="cd ~/personal/ocaml"
alias cdp="cd ~/personal"

# Configs
alias cdnv="nvim ~/.config/nvim/init.lua"
alias cdzh="nvim ~/.zshrc"
alias runz="run ~/.zshrc"

# CL utils
alias c="clear"
alias cl="clear && l"
alias run="source"
alias nv="nvim"
alias nvd="nvim"

# git
alias gitd="GIT_EXTERNAL_DIFF=difft git diff"
alias gith="GIT_EXTERNAL_DIFF=difft git show HEAD --ext-diff"
alias gitdog="git log --oneline --graph --decorate --all"
alias gitlo="git log --oneline"

# Other
alias cddoc="cd ~/personal/docs"

# Personal scripts
alias fman="compgen -c | fzf | xargs man"
alias opencf="sudo vim ~/nixos/configuration.nix"
alias openhf="sudo vim ~/nixos/home.nix"
alias w="warp-terminal &"
alias bcxx="ls *.cpp | entr -c -r make run"
alias gom="go run main.go"
alias godemon="nodemon --watch './**/*.go' --signal SIGTERM --exec 'go' run main.go"
alias serve="python3 -m http.serve"

wget_site() {
  wget --recursive --page-requisites --html-extension --convert-links --restrict-file-names=windows --domains $1 --no-parent --adjust-extension --mirror $2
}

rebuild() {
	sudo nixos-rebuild switch --flake ~/nixos/$1
}

# opam configuration
[[ ! -r /Users/mykola.brechko/.opam/opam-init/init.zsh ]] || source /Users/mykola.brechko/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

[ -f "/Users/mykola.brechko/.ghcup/env" ] && source "/Users/mykola.brechko/.ghcup/env" # ghcup-env

printf '\eP$f{"hook": "SourcedRcFileForWarp", "value": { "shell": "zsh" }}\x9c'
