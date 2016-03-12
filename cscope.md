# Setup environment
```
sudo apt-get install -y cscope
# Get script to build cscope.out database
sudo wget -O /usr/local/bin/cscope.sh https://raw.githubusercontent.com/ChinaShrimp/technotes/master/cscope/cscope.sh
sudo chmod +x /usr/local/bin/cscope.sh

# Get cscope_maps.vim plugin for VIM
mkdir -p ~/.vim/plugin
wget -O ~/.vim/plugin/cscope_maps.vim https://raw.githubusercontent.com/ChinaShrimp/technotes/master/cscope/cscope_maps.vim
```

# Generate cscope.out
Enter your source code directory and run cscope.sh to generate cscope.out database
```
cd <SRC_DIR>
cscope.sh
```
After running above commands, you should get cscope.out file in current directory

# Using VIM + cscope.out
Run vim under the same directory with your cscope.out file
```
cd <SRC_DIR>
# suppose you have already generated cscope.out using cscope.sh
vim
```
In vim, you could use ":cs show" to double check cscope.out connection. If everything
is fine, you could enjoy cscope now. 
For cscope help, enter ":cs help" in VIM.
For key bindings, refer to file ~/.vim/plugin/cscope_maps.vim

*IMPORTANT*: if you don't run vim with the same directory of cscope.out, you should manually
add cscope connection through command ":cs add <cscope.out file path>"
