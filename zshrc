# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Add personal scripts.
export PATH=/Users/tom@affinity.co/software/scripts:$PATH
export PYTHONPATH=:$(pwd)/ml-research/search_project_temp

# Make compilers find some homebrew cask-only libraries. 
export LDFLAGS="-L/opt/homebrew/opt/jemalloc/lib"
export CPPFLAGS="-I/opt/homebrew/opt/jemalloc/include"
export LDFLAGS="-L/opt/homebrew/opt/libpq/lib"
export CPPFLAGS="-I/opt/homebrew/opt/libpq/include"
# export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="cloud"

# Start SSH Agent.
{ eval `ssh-agent -s`; ssh-add -A; } &>/dev/null

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

# Load zsh-syntax-highlighting colorscheme.
source ~/.zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# Reload zsh configuration
alias reload="source ~/.zshrc"

# Config stuff
alias vim="nvim"

# Generic utility aliases.
alias cl=clear
alias l="eza -l"
alias agq="ag -Q"
alias agg="ag -g"

# Git stuff.
alias grb="git branch --sort=-committerdate | head -n 10"
alias gcurb="git rev-parse --abbrev-ref HEAD"

# Prettier
# alias prettier="/Users/tom@affinity.co/workspace/affinity/node_modules/prettier/bin-prettier.js"
alias prettier="pnpm prettier-write"

# Not sure what this is.
alias react-component-set

# Affinity specific stuff
alias deploy-scale-dry="aws s3 sync performance_tests/api_tests/dist/ s3://scale-load-tests --sse --delete --dryrun --exclude \"*.csv\" --exclude \"*.json\""
alias deploy-scale-real="aws s3 sync performance_tests/api_tests/dist/ s3://scale-load-tests --sse --delete --exclude \"*.csv\" --exclude \"*.json\""
alias ber="bundle exec ruby"
alias dms="DISABLE_MODEL_SCHEMA=1"

# Pretty print sql.
alias pretty-sql="sql-formatter --config ~/software/sql-formatter/config.json"

# Running stuff on changed files.
alias prettier-changes="git diff --name-only | xargs pnpm prettier-write"
alias rubocop-changes="git diff --name-only | xargs rubocop -A"
alias test-changes="git diff --name-only | grep _test | xargs -L 1 bundle exec ruby"
alias dms-test-changes="git diff --name-only | grep _test | xargs -L 1 bundle exec ruby"

# Running stuff on changed files (staged).
alias prettier-changes-staged="git diff --staged --name-only | xargs pnpm prettier-write"
alias rubocop-changes-staged="git diff --staged --name-only | xargs rubocop -A"
alias test-changes-staged="git diff --staged --name-only | grep _test | xargs -L 1 bundle exec ruby"
alias dms-test-changes-staged="git diff --staged --name-only | grep _test | xargs -L 1 bundle exec ruby"

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Make FZF use fd by default, which is a faster version of find and respects .gitignore
export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# Make FZF tab completion use fd as well.
_fzf_compgen_path() {
  fd --type f . "$1"
}

# FZF Colors (catppuccin-mocha)
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

# Load Affinity's local dev profile.
source ~/workspace/affinity/.profile_dev

# Start rbenv
eval "$(rbenv init -)"

# Start pyenv
eval "$(pyenv init -)"

. /Users/tom@affinity.co/workspace/affinity/.profile_dev
export PATH=/opt/homebrew/opt/openssl@1.1/bin:$PATH

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && . ~/.config/tabtab/zsh/__tabtab.zsh || true
export PATH=/opt/homebrew/opt/openssl@3/bin:$PATH
