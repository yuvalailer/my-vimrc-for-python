" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Vim will load $VIMRUNTIME/defaults.vim if the user does not have a vimrc.
" This happens after /etc/vim/vimrc(.local) are loaded, so it will override
" any settings in these files.
" If you don't want that to happen, uncomment the below line to prevent
" defaults.vim from being loaded.
let g:skip_defaults_vim = 1

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif


""""""""""""""""""""""""""""""""""""""""
"  yuval's additions to vim setting:   "
"                                      "
""""""""""""""""""""""""""""""""""""""""

" from: https://stackoverflow.com/questions/6008921/how-do-i-change-the-highlight-style-in-vim-spellcheck
set spell spelllang=en_us

" and from:
" from: https://vi.stackexchange.com/questions/14686/what-is-the-difference-between-red-and-cyan-in-spell-check-highlighting

hi clear SpellBad
hi clear SpellCap
hi clear SpellLocal
hi clear SpellRare

" see all optional colors in: https://vi.stackexchange.com/questions/13458/make-vim-show-all-the-colors
hi SpellBad cterm=underline,bold ctermfg=red 
hi SpellCap cterm=underline,bold ctermfg=blue 
hi SpellLocal cterm=underline,bold ctermfg=darkblue 
hi SpellRare cterm=underline,bold ctermfg=lightgreen 

" Set style for gVim
hi SpellBad gui=undercurl


" from: https://dougblack.io/words/a-good-vimrc.html#colors
set number              " show line numbers
set cursorline          " highlight current line
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]
set incsearch           " search as characters are entered
set hlsearch            " highlight matches



" from: https://realpython.com/vim-and-python-a-match-made-in-heaven/#nix-linux

set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" -- PEP 8 :
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

Plugin 'vim-scripts/indentpython.vim'   " 
Plugin 'Valloric/YouCompleteMe'         " auto complete
Plugin 'vim-syntastic/syntastic'        " check your syntax on each save
Plugin 'nvie/vim-flake8'                " PEP 8 checking
let python_highlight_all=1              " make your code look pretty

" color schemes
" Plugin 'jnurmine/Zenburn'
" Plugin 'altercation/vim-colors-solarized'

" files
Plugin 'scrooloose/nerdtree'         " files
Plugin 'jistr/vim-nerdtree-tabs'     " 
Plugin 'kien/ctrlp.vim'              " search 

" mis 
set clipboard=unnamed         " you can access your system clipboard




"""""""""""""""""""""""""""""""""
" how to install YouCompleteMe: "
"                               "
" """""""""""""""""""""""""""""""
"
" cd ~/.vim/bundle
" git clone https://github.com/Valloric/YouCompleteMe.git
" cd YouCompleteMe
" git submodule update --init --recursive
" ./install.sh  # --clang-completer #  UN comment the flag to enable C autocomp 


"###############################################################################
" YouCompleteMe Settings
"###############################################################################
" from: https://gist.github.com/self-tuts/211a899326e47f7a166acc23a9e20565
" and: (description text on) https://www.youtube.com/watch?v=gC5o6ropDB8 
" [!] Ctrl + space = python auto complete
"
let g:ycm_python_binary_path = 'python3'
:nnoremap fd  :YcmCompleter GoToDefinition<CR>
:nnoremap bb <C-o>
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_min_num_of_chars_for_completion = 1

" for python
let g:ycm_semantic_triggers = {'python': ['re!from\s+\S+\s+import\s']}



" flake 8 settings
" to use colors defined in the colorscheme
highlight link Flake8_Error      Error
highlight link Flake8_Warning    WarningMsg 
highlight link Flake8_Complexity WarningMsg 
highlight link Flake8_Naming   	 WarningMsg
highlight link Flake8_PyFlake    WarningMsg


