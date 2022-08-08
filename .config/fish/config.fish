set EDITOR nvim
set -x DISABLE_AUTO_TITLE true
set fish_greeting

fish_add_path /opt/homebrew/bin
fish_add_path $HOME/.nvm/versions/node/v16.16.0/bin
fish_add_path /opt/local/bin
fish_add_path /Applications/Postgres.app/Contents/Versions/latest/bin

alias vim="nvim"
alias lg="lazygit"
alias cb="git checkout"
alias hearme="tmuxp load $HOME/tmuxp-sessions/hearme.yaml"
alias xlib="tmuxp load $HOME/tmuxp-sessions/xlib.yaml"
alias config="/opt/homebrew/bin/git --git-dir=$HOME/.cfg --work-tree=$HOME"

fish_vi_key_bindings
