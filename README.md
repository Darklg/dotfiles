My dotfiles
========
( Original by @mathiasbynens )

---

# Install

## Download software

- OSX Settings : `. set-defaults.sh`
- Software : `. bootstrap.sh`
- Config : `. config-logiciels.sh`

## Terminal 101

- Copy .inputrc
- Copy this into .bash_profile :

```
export PATH="/usr/local/bin:$PATH";
export PATH="/usr/local/sbin:$PATH";

. /Users/kevin/websites/htdocs/git/dotfiles/bash/config.sh
. /Users/kevin/websites/htdocs/git/dotfiles/bash/prompt.sh
. /Users/kevin/websites/htdocs/git/dotfiles/bash/aliases.sh
. /Users/kevin/websites/htdocs/git/dotfiles/bash/autocomplete.sh
```
