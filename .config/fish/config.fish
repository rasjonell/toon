set EDITOR nvim
set theme_color_scheme gruvbox

set -x DISABLE_AUTO_TITLE true

alias vim="nvim"
alias lg="lazygit"
alias cb="git checkout"
alias hearme="tmuxp load $HOME/tmuxp-sessions/hearme.yaml"
alias config="/opt/homebrew/bin/git --git-dir=$HOME/.cfg --work-tree=$HOME"

fish_vi_key_bindings
