set fish_greeting
set -gx EDITOR lvim
set -x DISABLE_AUTO_TITLE true

set -gx PYTHONPATH /home/rasjonell/.local/lib/python3.12/site-packages

fish_add_path $HOME/.nvm/versions/node/v20.10.0/bin
fish_add_path $HOME/.local/bin
fish_add_path /usr/lib/ruby/gems/3.3.0/bin
fish_add_path $HOME/.local/share/gem/ruby/3.3.0/bin
fish_add_path /home/rasjonell/.spicetify
fish_add_path /var/lib/flatpak/exports/bin
fish_add_path $HOME/go/bin
fish_add_path $GOPATH/bin

set --universal nvm_default_version v20.10.0

alias lg="lazygit"
alias mux="tmuxinator"
alias aws-whoami="aws sts get-caller-identity"

fish_vi_key_bindings

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME
set -gx PATH $HOME/.cabal/bin $PATH /Users/rasjonell/.ghcup/bin # ghcup-env
set -gx COINMARKETCAP_API_KEY 683bc384-5951-43dc-8858-27356ade148d

set -gx GBM_BACKEND nvidia-drm
set -gx __GLX_VENDOR_LIBRARY_NAME nvidia
set -gx LIBVA_DRIVER_NAME nvidia
set -gx __GL_SYNC_DISPLAY_DEVICE DP-1
set -gx __GL_VRR_ALLOWED 1
set -gx __GL_SYNC_TO_VBLANK 1


set -gx tide_elixir_icon 🧪
set -gx tide_eth_icon 💰
set -gx _tide_right_items node elixir aws
fish_add_path /Users/rasjonell/.spicetify

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# pnpm
set -gx PNPM_HOME /Users/rasjonell/Library/pnpm
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

set -gx PYENV_ROOT "$HOME/.pyenv"
if not string match -q -- $PYENV_ROOT $PATH
  set -gx PATH "$PYENV_ROOT/bin" $PATH
end

eval "$(pyenv init -)"
