#
# Samples of what you can do in *.before.zsh files.
# You can create as many files as you like, or put everything in one.
#

# append your own plugins. the $plugins at the end includes the plugins
# defined by YADR.

# set your theme.
export ZSH_THEME="tUrG0n"
export EDITOR="vim"

cd ~/workSpace

[[ -s /Users/turgon/.nvm/nvm.sh ]] && . /Users/turgon/.nvm/nvm.sh # This loads NVM
