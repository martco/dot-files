DIR=$(pwd)

# Clean
rm ~/.vim ~/.vimrc 
rm ~/.mc
rm ~/.bashrc ~/.bash_aliases ~/.bash_functions
rm ~/.mpd ~/.ncmpcpp
rm ~/.tmux.conf 

    
# VIM
ln -s $DIR/vim/.vim ~/
ln -s $DIR/vim/.vimrc ~/

# MC
ln -s $DIR/mc/.mc ~/

# Bashrc
ln -s $DIR/bashrc/.bashrc ~/
ln -s $DIR/bashrc/.bash_aliases ~/
ln -s $DIR/bashrc/.bash_functions ~/

# Zic
ln -s $DIR/zic/.mpd ~/
ln -s $DIR/zic/.ncmpcpp ~/

# Tmux
ln -s $DIR/tmux/.tmux.conf ~/
