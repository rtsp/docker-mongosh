## RTSP .bashrc (rtsp-bash)

## history control
shopt -s checkwinsize
shopt -s histappend
unset HISTCONTROL
HISTFILESIZE=10000
HISTTIMEFORMAT="[%a %Y-%m-%d %H:%M:%S] "
HISTSIZE=2000

## colorize
if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
  PS1="\[\e[01;93m\]\t\[\e[m\] \[\e[01;32m\]\h\[\e[m\]:\[\e[01;96m\]\w\[\e[m\]\\$ "
else
  PS1="\h:\w\\$ "
fi

export LS_OPTIONS='-hFT 0 --time-style=long-iso'
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  export LS_OPTIONS="${LS_OPTIONS} --color=auto"
fi
alias ls='ls $LS_OPTIONS'
alias ll='ls $LS_OPTIONS -l'
alias l='ls $LS_OPTIONS -lA'
alias la='ls $LS_OPTIONS -la'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias diff='diff --color=auto'
