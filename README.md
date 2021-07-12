My dotfiles
========
( Original by @mathiasbynens )

---

# Install

## Download software

- OSX Settings : `. osx/set-defaults.sh`
- Software : `. osx/bootstrap.sh`
- Config : `. osx/config-logiciels.sh`
- mackup restore

## Terminal 101

- Copy inputrc `rm ~/.inputrc; ln -s ~/websites/htdocs/dotfiles/bash/inputrc ~/.inputrc`
- Copy tmux.conf `rm ~/.tmux.conf; ln -s ~/websites/htdocs/dotfiles/bash/tmux.conf ~/.tmux.conf`
- Copy this into .bash_profile :

```
export PATH="/usr/local/bin:$PATH";
export PATH="/usr/local/sbin:$PATH";

. ~/websites/htdocs/git/dotfiles/bash/config.sh
. ~/websites/htdocs/git/dotfiles/bash/prompt.sh
. ~/websites/htdocs/git/dotfiles/bash/aliases.sh
. ~/websites/htdocs/git/dotfiles/bash/autocomplete.sh
```

## Quick commands

### Disable SSH password auth

```
sudo vim /etc/ssh/sshd_config
ChallengeResponseAuthentication no
PasswordAuthentication no
```

### Sync fonts to Dropbox

```
cd ~/Library;
sudo mv Fonts ~/Dropbox/work;
ln -s ~/Dropbox/work/Fonts;
```

### Sync fonts from Dropbox

```
cd ~/Library;
sudo rm -r Fonts;
ln -s ~/Dropbox/work/Fonts;
```
