export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
  fd
  git
  nvm
  zsh-vi-mode
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

alias vim="nvim"
alias lg="lazygit"
alias cb="git checkout"
alias hearme="tmuxp load ~/tmuxp-sessions/hearme.yaml"
alias config="/opt/homebrew/bin/git --git-dir=$HOME/.cfg --work-tree=$HOME"

export DISABLE_AUTO_TITLE='true'
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"
export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools

