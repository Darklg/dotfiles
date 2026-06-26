#!/bin/sh

DOTFILES_ALIAS_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd );

function chromereload(){
    echo "- Reloading Current Chrome Tab";
    osascript "${DOTFILES_ALIAS_DIR}/chrome-reload-url.applescript";
    echo "- Tab is reloaded";
}

# Functions
function mkdircd () { mkdir -p "$@" && eval cd "\"\$$#\""; }

# Directory
alias ls='ls -Gh';
alias ll='ls -l';
alias la='ls -a';
alias lla='ls -al';
alias ..='cd ..';
alias ...='cd ../..';
alias ....='cd ../../..';
alias .....='cd ../../../..';
alias hosts='sudo vim /etc/hosts';

# Alias Apache
alias apachereboot='sudo /Applications/MAMP/Library/bin/httpd -k restart';

# Utilities
# Quick Webserver
alias serv='open http://0.0.0.0:1234 && python -m SimpleHTTPServer 1234';

# Files
alias clean='find . -iname ".DS_Store" -delete && dot_clean .';

# Paste clipboard in new vim window | apple.stackexchange.com/a/1533
alias pavi='pbpaste | vim -';

# Alias Services Web
alias ip='dig +short myip.opendns.com @resolver1.opendns.com'

# Dates
alias now='date +"%T';
alias nowdate='date +"%d-%m-%Y"';
alias settime='sudo ntpdate -u time.apple.com';

# reboot / halt / poweroff
alias reboot='sudo /sbin/reboot';
alias poweroff='sudo /sbin/poweroff';
alias halt='sudo /sbin/halt';
alias shutdown='sudo /sbin/shutdown';
alias suspend='/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend'
alias faisdodo="osascript -e 'tell application \"System Events\" to sleep'";
alias screenshotnow="screencapture -x ~/Dropbox/screenshot-current-1.jpg ~/Dropbox/screenshot-current-2.jpg ~/Dropbox/screenshot-current-3.jpg";
alias stopscreen="pmset displaysleepnow";

# Alias Git
alias ga='git add -u . && git add .'
alias gfoire='git reset --hard HEAD && git submodule foreach --recursive git reset --hard HEAD'
alias gitput='git stash && git pull && git push --all && git stash apply && git stash drop'
alias gl='git log --pretty=format:"%Cred• %h%Creset%C(yellow)%d%Creset %Cgreen(%cr) %C(bold blue)<%an>%Creset%n%s" --max-count=15 --reverse --date=short'
alias gs='git status -s && git fetch'
alias gitrmws='git add -u . && git add . && git diff -U0 -w --no-color | git apply --cached --ignore-whitespace --unidiff-zero | git stash save --keep-index --include-untracked'
alias ghpages='git checkout gh-pages && git rebase master && git checkout master';
alias giti='git gc && git pull --rebase && git push --all';
alias gitisub='git pull --recurse-submodules && git submodule update --recursive';
alias gitexp='git archive --format zip --output ../export.zip master && echo "Export ok !"';

function gitimerge(){
    if [[ "${1}" == "" || "${2}" == "" ]];then
        echo 'Usage : gitimerge feature-branch-name staging-branch';
        return 0;
    fi;
    echo "Merging branch ${1} into ${2}.";
    read -p "Type enter to continue or anything else to stop:" _continue_gitimerge
    if [[ "${_continue_gitimerge}" != '' ]];then
        echo '- Merge stopped';
        return 0;
    fi;
    git checkout "${1}" \
        && git pull \
        && git checkout "${2}" \
        && git pull \
        && git merge "${1}" \
        && git push \
        && git checkout "${1}";
    echo '- Merge done !';
}
function gitrmsubmodule () {
    if [[ "${1: -1}" == '/' ]];then
        echo "- Submodule path should not end with a '/'.";
        return 0;
    fi;
    if [[ -z "${1}" ]]; then
        echo "- Missing argument ! You should specify a submodule folder.";
        return 0;
    fi;
    if [[ ! -d "${1}" ]]; then
        echo "- The module ${1} does not exists";
        return 0;
    fi;
    git config -f .gitmodules --remove-section submodule.${1};
    git config -f .git/config --remove-section submodule.${1};
    git add .gitmodules;
    git rm --cached ${1};
    rm -rf .git/modules/${1};
    git commit -m "Git - Remove submodule ${1}";
}

# Thanks to
# - http://www.cyberciti.biz/tips/bash-aliases-mac-centos-linux-unix.html

###################################
## IA
###################################

_DOTFILE_CALL_SUMMARY_PROMPT="Tu es chargé de résumer un transcript de call en français.

Produis uniquement un document Markdown final.
N’ajoute aucune balise XML, aucun commentaire, aucune explication sur ta méthode, aucun texte hors du Markdown.

## Objectif

Résume le transcript de call en identifiant les sujets abordés.

Le call peut contenir plusieurs sujets distincts. Pour chaque sujet :

* crée une section dédiée ;
* regroupe les points clés associés ;
* ajoute des zooms spécifiques si un point mérite plus de détail ;
* liste les décisions liées au sujet, lorsqu’il y en a ;
* rattache les actions au bon sujet ou à la bonne personne lorsque c’est possible.

Si une information ne peut pas être clairement rattachée à un sujet, place-la dans une section “Points transverses” ou “Actions générales”.

## Format attendu

Le résultat doit suivre cette structure Markdown :

<format_attendu>
---

project_name: Nom du projet
participants:
- Intervenant 1
- Intervenant 2
start: 2025-11-05 - 11:00
end: 2025-11-05 - 12:00
---

# Titre du call

## Sujet 1

* Point clé 1
* Point clé 2
* Point clé 3

### Zoom sur fonctionnalité ou point spécifique

* Détail utile 1
* Détail utile 2

### Décisions

* Décision 1
* Décision 2

## Sujet 2

* Point clé 1
* Point clé 2

### Décisions

* Décision 1

## Points transverses

* Point qui concerne plusieurs sujets
* Information générale non rattachée à un sujet précis

## Actions à faire

### Personne 1

* Tâche 1
* Tâche 2

### Personne 2

* Tâche 3

### Plusieurs personnes

* Tâche commune

### Actions générales

* Action non rattachée clairement à une personne
</format_attendu>

## Règles importantes

* Ne reproduis pas les noms de sections d’exemple s’ils ne correspondent pas au contenu réel du call.
* Ne crée pas de décisions ou d’actions si elles ne sont pas présentes dans le transcript.
* Garde les titres en français.
";


claude_summarize_call() {
    local file="$1"
    if [[ -z "$file" || ! -f "$file" ]]; then
        echo "Usage: claude_summarize_call <file>" >&2
        return 1
    fi

    claude -p "$_DOTFILE_CALL_SUMMARY_PROMPT" < "$file"
}

qwen_summarize_call() {
    local file="$1"
    if [[ -z "$file" || ! -f "$file" ]]; then
        echo "Usage: qwen_summarize_call <file>" >&2
        return 1
    fi

    ollama run qwen3:14b "$_DOTFILE_CALL_SUMMARY_PROMPT" < "$file"
}
