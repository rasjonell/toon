# My dotfiles

> I'm running both MacOS and Void Linux machines, I try to store the most used/required configs here.

## [hyprland](https://github.com/hyprwm/Hyprland)

Hyprland is a dynamic tiling Wayland compositor that also looks good.

> I used to run [i3](https://github.com/i3/i3), but we moved on.

## [yabaii](https://github.com/koekeishiya/yabai)

Yabaii is a tilling window manager for MacOS (it's 🔥 blazingly 🔥 slow)

## [kitty](https://github.com/kovidgoyal/kitty)

The best terminal emulator.

## [NeoVim (btw)](https://neovim.io/)

I use NeoVim btw

## [fish](https://fishshell.com/)

Fish is my go-to shell

### [fisher](https://github.com/jorgebucaran/fisher)

Fisher is a plugin manager for Fish. I've uploaded my plugins at `.fish_plugins`

To install the plugins run:

```fish
for plugin in (cat .fish_plugins); fisher install $plugin; end
```

## Brew

I've uploaded my brew packages list at `.brew_packages`

To install the packages run:

```fish
for package in (cat .brew_packages); brew install $package; end
```

## [tmuxp](https://tmuxp.readthedocs.io/en/latest/) -> [tmuxinator](https://github.com/tmuxinator/tmuxinator)

Tmuxp is a [Tmux](https://github.com/tmux/tmux/wiki) session manager. you can specify your window/pane arangement with a config file and it will start your session as specified.
Checkout my session configs at `tmuxp-sessions/`

> **_NOTE:_** recently I moved to tmuxinator(check out `./.config/tmuxinator`)
