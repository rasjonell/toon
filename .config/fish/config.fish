set EDITOR nvim
set -x DISABLE_AUTO_TITLE true
set fish_greeting

alias vim="nvim"
alias lg="lazygit"
alias cb="git checkout"
alias hearme="tmuxp load $HOME/tmuxp-sessions/hearme.yaml"
alias config="/opt/homebrew/bin/git --git-dir=$HOME/.cfg --work-tree=$HOME"

fish_vi_key_bindings
