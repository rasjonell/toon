# My dotfiles

## [fish](https://fishshell.com/)

Fish is a smart and user-friendly command line
shell

### [fisher](https://github.com/jorgebucaran/fisher)

Fisher is a plugin manager for Fish. I've uploaded my plugins at `.fish_plugins`

To install the plugins run:

```fish
for plugin in (cat .fish_plugins); fisher install $plugin; end
```

## [tmuxp](https://tmuxp.readthedocs.io/en/latest/)

Tmuxp is a Tmux session manager. you can specify your window/pane arangement with a config file and it will start your session as specified.
Checkout my session configs at `tmuxp-sessions`
