#
# Samples of what you can do in *.after.zsh files.
# You can create as many files as you like, or put everything in one.
#

# define your own aliases or override those provided by YADR.
alias ls='/usr/local/bin/gls --color'

alias ll='ls -halF -h --group-directories-first'
alias l='ls -CF'
alias le='less'

# not only ls! :P
alias rm='rm -rv'
alias cp='cp -rv'
alias mv='mv -v'
alias Cd='cd ~/workSpace'

# launch programs
alias pm='mplayer -playlist <(find "$PWD" -type f)'
alias n='mpd;ncmpcpp'
alias paL='pal -r 60'

# moving around
alias na='nautilus ./'
alias cdc='pwd | xclip -i'
alias cdp='cd $(xclip -o)'
alias xpaste='var=$(xclip -o)'

# conversioon
alias doc2pdf='libreoffice --headless --convert-to pdf'

# Coding
alias svnclean="svn status | tr -s ' ' | grep '\!' | sed 's/\! /\"/g' | sed 's/$/\"/g' | xargs svn rm"
alias gitclean="git st | grep deleted | tr -s ' ' | cut -d ' ' -f 2 | xargs git rm"
alias gitmodified="git st | grep modified | tr -s ' ' | cut -d ' ' -f 2 | xargs git add"

# renaming
alias ren="rename 's/^.*kbit //' *"

alias du=""
alias du="du"
alias Du='du -h -d 2'

# fasd
alias v='f -e vim' # quick opening files with vim
alias m='f -e mplayer' # quick opening files with mplayer
