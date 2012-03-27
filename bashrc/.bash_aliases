# Terminal Aliases
# some more ls aliases
alias ll='ls -halF'
alias la='ls -A'
alias l='ls -CF'
alias l.='ls -aF'
alias lS='ll -S'
alias llh='lS | head'

# not only ls! :P
alias ..='cd ..'
alias rm='rm -rv'
alias cp='cp -rv'
alias mv='mv -v'
alias Cd='cd ~/workSpace'

# launch programs
alias control='gnome-control-center; exit'
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
alias Mc='sudo mc'
alias vi='runVi'
alias man='gnome-terminal --full-screen --window-with-profile=Coding -x man'

# renaming
alias ren="rename 's/^.*kbit //' *"

# move in and out!
alias log='gnome-session-save --logout'
alias res='sudo shutdown -HPr now'
alias shut='sudo shutdown -HP now'

# apt stuff
alias _upd='sudo apt-get update;sudo apt-get upgrade; sudo apt-get dist-upgrade'
alias _cle='sudo apt-get autoclean; sudo apt-get autoremove'
alias _ins='sudo apt-get install'
