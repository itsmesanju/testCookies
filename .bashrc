set -a
# Define where your personal executables are located
HISTCONTROL=ignoredups:ignorespace
shopt -s histappend
HISTSIZE=1000000
HISTFILESIZE=20000000
PS1="\[\033[033m\]\`if [ \$? = "0" ]; then echo "\\[\\033[32m\\]"; else echo "\\[\\033[31m\\]"; fi\`[\u@\h \w: ]\$ \\[\033[0m\\] "
PATH=/home/kumars221/bin/:/home/kumars221/bin/firefox/:$PATH

# Alias definitions.
alias ls='ls --color=auto'
alias vi=vim
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
export HISTCONTROL=ignoredups:erasedups
# When the shell exits, append to the history file instead of overwriting it
export PROMPT_COMMAND='history -a; history -r'
shopt -s checkwinsize
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Alias definitions.
alias ls='ls --color=auto'
alias vi=vim
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

setTime()
{
for hosts in `cat /etc/hosts |grep -v "#"| awk '{print $1}'`; do ssh root@$hosts " ntpdate -u 10.100.174.10"; done
}

localvnc()
{
/usr/bin/x11vnc -xkb -noxrecord -noxfixes -noxdamage --noncache -display :0 -auth /var/lib/gdm/:0.Xauth -rfbauth /home/kumars221/.vnc/passwd
}

#Add colors into MAN
man() {
    env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;31m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
    man "$@"
}
