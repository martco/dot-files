# Android path
# export PATH="${PATH}:/home/turgon/workSpace/programs/android-sdk-linux_x86/platform-tools"
# export PATH="${PATH}:/home/turgon/workSpace/programs/android-sdk-linux_x86/tools"
# export PATH="${PATH}:/home/turgon/workSpace/programs/blender-2.57b-linux-glibc27-x86_64"
# export PATH="${PATH}:/home/turgon/workSpace/programs/eclipse/"
# export PATH="${PATH}:/home/turgon/workSpace/playground/code/Archives/piotr"
# export PATH="${PATH}:/usr/local/share/lilypond/usr/bin"
# export PATH="${PATH}:/home/turgon/workSpace/configuration/scripts/killers"
# export PATH="${PATH}:/home/turgon/workSpace/programs/android-ndk-r6b"
 
# Path of executables
export PATH="${PATH}:/usr/local/share/bin"
export PATH="${PATH}:/usr/local/share/npm/bin"

# Backup
alias BackSync='rsync --delete -kav /media/Data/Turgon\ realm/ /media/Warehouse\ Inc/Turgon\ realm/'
alias BackRCO="sudo rsync --delete -kav --exclude 'desktop' --exclude 'download' --exclude 'programs' /home/turgon/workSpace/ /media/Data/Turgon\ realm/Unix/after_Format_Programs/workSpace/"
alias BackRC='~/workSpace/configuration/BackUpScript.bash ;BackRCO'
alias sou='source ~/.bashrc; cp -vu ~/.bashrc ~/workSpace/configuration/bashrc; cp -uv ~/.bash_aliases ~/workSpace/configuration/bashrc; BackRCO'

# latex
alias sL='cp ~/workSpace/configuration/repo/latex/* .; vi Makefile' #initialize latex's makefile

# cd to directories
alias p='cd "/media/Data/Turgon realm"'
alias u='cd "/media/Data/Turgon realm/Unix"'


export EDITOR='vi'
