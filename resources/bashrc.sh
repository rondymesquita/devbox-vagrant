# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
  # We have color support; assume it's compliant with Ecma-48
  # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
  # a case would tend to support setf rather than setaf.)
  color_prompt=yes
    else
  color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\W\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# If ~./inputrc doesn't exist yet, first include the original /etc/inputrc so we don't override it
if [ ! -a ~/.inputrc ]; then echo '$include /etc/inputrc' > ~/.inputrc; fi

# Add option to ~/.inputrc to enable case-insensitive tab completion
echo 'set completion-ignore-case On' >> ~/.inputrc

alias opath='subl ~/.bashrc'
alias path='source ~/.bashrc'
alias vpn='sudo expect ~/Documents/pulse_vpn/pulse'
alias vnc1='x11vnc -viewonly -clip 1920x1200+0+0 -passwd "123qwe"'
alias vnc2='x11vnc -viewonly -clip 1440x900+1920+300 -passwd "123qwe"'
alias govet='go vet $(go list ./... | grep -v /vendor/)'
alias gotest='go test $(go list ./... | grep -v /vendor/)'
alias ginkgotest='ginkgo -v ./...'
alias gogenerate='go generate $(go list ./... | grep -v /vendor/)'

# git aliases
alias gl="git log --graph --abbrev-commit --decorate --all"
alias gl1="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"
alias glg2="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all"

BGBLACK="\e[40m"
BGRED="\e[41m"
BGGREEN="\e[42m"
BGYELLOW="\e[43m"
BGBLUE="\e[44m"
BGPURPLE="\e[45m"
BGCYAN="\e[46m"
BGWHITE="\e[47m"

FGBLACK="\e[0;30m"
FGRED="\e[0;31m"
FGGREEN="\e[0;32m"
FGYELLOW="\e[0;33m"
FGBLUE="\e[0;34m"
FGPURPLE="\e[0;35m"
FGCYAN="\e[0;36m"
FGWHITE="\e[0;37m"

STARTFG="\e[0;30m"
STARTBG="\e[47m"
ENDCOLOR="\e[0m"

# PS1="$FGYELLOW\W:$FGGREEN\$(parse_git_branch)$ENDCOLOR$ "
# PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ '
# PS1='\[\033[00m\]\[\033[01;34m\]\W\[\033[00m\]:\[\033[01;32m\]$(parse_git_branch)\[\033[00m\]\$ '

# Git
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# Docker
alias docker-stop='docker stop $(docker ps -qa)'
alias docker-rm='docker rm -f $(docker ps -qa)'
alias docker-rmi='docker rmi -f $(docker images -qa)'
alias docker-prune='docker system prune -af --volumes'
alias docket='docker'
docker-ps() {
  watch -n1 "docker ps --format 'table {{.ID}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}\t{{.Names}}'"
}

# Node
export PATH=~/.npm-global/bin:$PATH

# Java
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export JAVAHOME=$JAVA_HOME
export PATH=$PATH:$JAVA_HOME/bin

# Android
export ANDROID_HOME=~/Documents/dev/android
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/tools
alias sdkmanager='sdkmanager --sdk_root=${ANDROID_HOME} "tools"'

# Python
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH

# Pyenv
# if command -v pyenv 1>/dev/null 2>&1; then
#   eval "$(pyenv init -)"
# fi

# VBox
alias vbox-clipboard='pkill "VBoxClient --clipboard" -f && sleep 1 && VBoxClient --clipboard'

# eval "$(starship init bash)"
