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

- Copy bash/inputrc to ~/.inputrc
- Copy this into .bash_profile :

```
export PATH="/usr/local/bin:$PATH";
export PATH="/usr/local/sbin:$PATH";

. ~/websites/htdocs/git/dotfiles/bash/config.sh
. ~/websites/htdocs/git/dotfiles/bash/prompt.sh
. ~/websites/htdocs/git/dotfiles/bash/aliases.sh
. ~/websites/htdocs/git/dotfiles/bash/autocomplete.sh
```
