set EDITOR nvim
set fish_greeting
set -x DISABLE_AUTO_TITLE true

fish_add_path /opt/homebrew/bin
fish_add_path $HOME/.nvm/versions/node/v16.16.0/bin
fish_add_path /opt/local/bin
fish_add_path /Applications/Postgres.app/Contents/Versions/latest/bin
fish_add_path $HOME/.local/bin

set --export ANDROID $HOME/Library/Android;
set --export ANDROID_HOME $ANDROID/sdk;
set -gx PATH $ANDROID_HOME/tools $PATH;
set -gx PATH $ANDROID_HOME/tools/bin $PATH;
set -gx PATH $ANDROID_HOME/platform-tools $PATH;
set -gx PATH $ANDROID_HOME/emulator $PATH

set --export JAVA_HOME /Applications/Android\ Studio.app/Contents/jre/Contents/Home;
set -gx PATH $JAVA_HOME/bin $PATH;
set -gx PATH $HOME/.cargo/bin $PATH;

set -gx SDKROOT /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX12.3.sdk

alias vim="lvim"
alias lg="lazygit"
alias cb="git checkout"
alias xlib="tmuxp load $HOME/tmuxp-sessions/xlib.yaml"
alias radio="tmuxp load $HOME/tmuxp-sessions/as-radio.yaml"
alias matchify="tmuxp load $HOME/tmuxp-sessions/matchify.yaml"
alias config="/opt/homebrew/bin/git --git-dir=$HOME/.cfg --work-tree=$HOME"

fish_vi_key_bindings

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ;
set -gx PATH $HOME/.cabal/bin $PATH /Users/rasjonell/.ghcup/bin # ghcup-env

set -gx tide_elixir_icon 🧪
set -gx _tide_right_items node elixir aws
