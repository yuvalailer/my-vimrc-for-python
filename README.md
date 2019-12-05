# my-vimrc-for-python
:shipit: My Vim settings file for Python Development 


### How To Install/Use:
Run the next script in your bash terminal (as superuser), and your Vim settings will be replaced with mine.

The old settings will be saved in /etc/vim-old directory. 

```bash
$ sudo git clone https://github.com/yuvalailer/my-vimrc-for-python.git /etc/vim-new ;\
sudo mv /etc/vim /etc/vim-old ;\
sudo mv /etc/vim-new /etc/vim
```

### How to Undo:
```bash
$ sudo mv /etc/vim /etc/vim-from-github ;\
sudo mv /etc/vim-old /etc/vim

# optional:
sudo rm -r /etc/vim-from-github
```


Tested on Ubuntu18.04
