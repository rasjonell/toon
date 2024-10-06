set EDITOR lvim
set fish_greeting
set -x DISABLE_AUTO_TITLE true

fish_add_path /opt/homebrew/bin
fish_add_path $HOME/.nvm/versions/node/v20.10.0/bin
fish_add_path /opt/local/bin
fish_add_path /Applications/Postgres.app/Contents/Versions/latest/bin
fish_add_path $HOME/.local/bin
fish_add_path /opt/homebrew/opt/llvm/bin

set --export JAVA_HOME /Library/Java/JavaVirtualMachines/zulu-11.jdk/Contents/Home

set --export ANDROID $HOME/Library/Android;
set --export ANDROID_HOME $ANDROID/sdk;
set -gx PATH $ANDROID_HOME/tools $PATH;
set -gx PATH $ANDROID_HOME/tools/bin $PATH;
set -gx PATH $ANDROID_HOME/platform-tools $PATH;
set -gx PATH $ANDROID_HOME/emulator $PATH
set -gx PATH $JAVA_HOME/bin $PATH;
set -gx PATH $HOME/.cargo/bin $PATH;

set --universal nvm_default_version v20.10.0

alias vim="lvim"
alias lg="lazygit"
alias cb="git checkout"
alias aws-whoami="aws sts get-caller-identity"
alias p2p="tmuxp load $HOME/tmuxp-sessions/p2p.yaml"
alias art="tmuxp load $HOME/tmuxp-sessions/art.yaml"
alias xlib="tmuxp load $HOME/tmuxp-sessions/xlib.yaml"
alias blog="tmuxp load $HOME/tmuxp-sessions/blog.yaml"
alias korio="tmuxp load $HOME/tmuxp-sessions/korio.yaml"
alias wdpro="tmuxp load $HOME/tmuxp-sessions/wdpro.yaml"
alias radio="tmuxp load $HOME/tmuxp-sessions/as-radio.yaml"
alias deeznuts="tmuxp load $HOME/tmuxp-sessions/deeznuts.yaml"
alias matchify="tmuxp load $HOME/tmuxp-sessions/matchify.yaml"
alias deezcussions="tmuxp load $HOME/tmuxp-sessions/deezcussions.yaml"
alias config="/opt/homebrew/bin/git --git-dir=$HOME/.cfg --work-tree=$HOME"

fish_vi_key_bindings

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ;
set -gx PATH $HOME/.cabal/bin $PATH /Users/rasjonell/.ghcup/bin # ghcup-env
set -gx COINMARKETCAP_API_KEY "683bc384-5951-43dc-8858-27356ade148d"

set -gx tide_elixir_icon 🧪
set -gx tide_eth_icon 💰
set -gx _tide_right_items node elixir aws
fish_add_path /Users/rasjonell/.spicetify

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# pnpm
set -gx PNPM_HOME "/Users/rasjonell/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

rvm default
