My dotfiles
========
( Original by @mathiasbynens )

---

# Install

## Download software

- OSX Settings : `. set-defaults.sh`
- Software : `. bootstrap.sh`
- Config : `. config-logiciels.sh`
- mackup restore

## Terminal 101

- Copy inputrc `rm ~/.inputrc; cp ~/websites/htdocs/dotfiles/bash/inputrc ~/.inputrc`
- Copy tmux.conf `rm ~/.tmux.conf; cp ~/websites/htdocs/dotfiles/bash/tmux.conf ~/.tmux.conf`
- Copy this into .bash_profile :

```
export PATH="/usr/local/bin:$PATH";
export PATH="/usr/local/sbin:$PATH";

. ~/websites/htdocs/git/dotfiles/bash/config.sh
. ~/websites/htdocs/git/dotfiles/bash/prompt.sh
. ~/websites/htdocs/git/dotfiles/bash/aliases.sh
. ~/websites/htdocs/git/dotfiles/bash/autocomplete.sh
```
