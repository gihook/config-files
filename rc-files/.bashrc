# .bashrc

# User specific environment
PATH="$HOME/.local/bin:$HOME/bin:$PATH"
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# nvm
source /usr/share/nvm/init-nvm.sh

# User specific aliases and functions
alias vim="nvim"
alias ls="exa"
alias ll="exa -l"
alias xclip="xclip -selection clipboard"
alias gco="git branch | fzf | xargs git checkout"

# prompt
prompt_git() {
    local s='';
    local branchName='';

    # Check if the current directory is in a Git repository.
    git rev-parse --is-inside-work-tree &>/dev/null || return;

    # Check for what branch we’re on.
    # Get the short symbolic ref. If HEAD isn’t a symbolic ref, get a
    # tracking remote branch or tag. Otherwise, get the
    # short SHA for the latest commit, or give up.
    branchName="$(git symbolic-ref --quiet --short HEAD 2> /dev/null || \
        git describe --all --exact-match HEAD 2> /dev/null || \
        git rev-parse --short HEAD 2> /dev/null || \
        echo '(unknown)')";

    # Early exit for Chromium & Blink repo, as the dirty check takes too long.
    # Thanks, @paulirish!
    # https://github.com/paulirish/dotfiles/blob/dd33151f/.bash_prompt#L110-L123
    repoUrl="$(git config --get remote.origin.url)";
    if grep -q 'chromium/src.git' <<< "${repoUrl}"; then
        s+='*';
    else
        # Check for uncommitted changes in the index.
        if ! $(git diff --quiet --ignore-submodules --cached); then
            s+='+';
        fi;
        # Check for unstaged changes.
        if ! $(git diff-files --quiet --ignore-submodules --); then
            s+='!';
        fi;
        # Check for untracked files.
        if [ -n "$(git ls-files --others --exclude-standard)" ]; then
            s+='?';
        fi;
        # Check for stashed files.
        if $(git rev-parse --verify refs/stash &>/dev/null); then
            s+='$';
        fi;
    fi;

    [ -n "${s}" ] && s=" [${s}]";

    echo -e "${1}${branchName}${2}${s}";
    }

if tput setaf 1 &> /dev/null; then
    tput sgr0; # reset colors
    bold=$(tput bold);
    reset=$(tput sgr0);
    # Solarized colors, taken from http://git.io/solarized-colors.
    black=$(tput setaf 0);
    blue=$(tput setaf 33);
    cyan=$(tput setaf 37);
    green=$(tput setaf 64);
    orange=$(tput setaf 166);
    purple=$(tput setaf 125);
    red=$(tput setaf 124);
    violet=$(tput setaf 61);
    white=$(tput setaf 15);
    yellow=$(tput setaf 136);
else
    bold='';
    reset="\e[0m";
    black="\e[1;30m";
    blue="\e[1;34m";
    cyan="\e[1;36m";
    green="\e[1;32m";
    orange="\e[1;33m";
    purple="\e[1;35m";
    red="\e[1;31m";
    violet="\e[1;35m";
    white="\e[1;37m";
    yellow="\e[1;33m";
fi;

# Highlight the user name when logged in as root.
if [[ "${USER}" == "root" ]]; then
    userStyle="${red}";
else
    userStyle="${orange}";
fi;

# Highlight the hostname when connected via SSH.
if [[ "${SSH_TTY}" ]]; then
	hostStyle="${bold}${red}";
else
	hostStyle="${yellow}";
fi;

# Set the terminal title and prompt.
PS1="\[\033]0;\W\007\]"; # working directory base name
PS1+="\[${bold}\]\n"; # newline
PS1+="\[${userStyle}\]\u"; # username
PS1+="\[${white}\] at ";
PS1+="\[${hostStyle}\]\h"; # host
PS1+="\[${white}\] in ";
PS1+="\[${green}\]\w"; # working directory full path
PS1+="\$(prompt_git \"\[${white}\] on \[${violet}\]\" \"\[${blue}\]\")"; # Git repository details
PS1+="\n";
PS1+="\[${white}\]\$ \[${reset}\]"; # `$` (and reset color)
export PS1;

PS2="\[${yellow}\]→ \[${reset}\]";
export PS2;

export EDITOR=$(which nvim)

export PATH="$PATH:/home/nikola/.dotnet/tools:/home/nikola/.cargo/bin"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

[[ -f /etc/bash_completion ]] && . /etc/bash_completion

source ~/secrets/environment-variables
