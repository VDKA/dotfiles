set shell=/bin/zsh
"set shell=/bin/sh
set nocompatible
filetype plugin indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/syntastic'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'wincent/Command-T'

"Plug 'bling/vim-airline'
Plug 'edkolev/tmuxline.vim'
Plug 'chriskempson/base16-vim'

Plug 'vim-scripts/camelcasemotion'
Plug 'kshenoy/vim-signature'
Plug 'ervandew/supertab'
Plug 'spiiph/vim-space'
Plug 'mileszs/ack.vim'
Plug 'godlygeek/tabular'
Plug 'rking/ag.vim'
"Plug 'Valloric/YouCompleteMe'

" Language stuff
Plug 'tpope/vim-markdown', { 'for': 'markdown' }
Plug 'keith/swift.vim'
call plug#end()

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Only do this part when compiled with support for autocommands.
if has("autocmd")

	" Highlighting for custom Terms similar to c.vims TODO FIXME
	autocmd Syntax * call matchadd('TODO', '\W\zs\(TODO\|FIXME\|CHANGED\|XXX\|BUG\|HACK\)')
	autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\|DEBUG\)')

	" Enable file type detection.
	" Use the default filetype settings, so that mail gets 'tw' set to 72,
	" 'cindent' is on in C files, etc.
	" Also load indent files, to automatically do language-dependent indenting.
	filetype plugin indent on

	" Put these in an autocmd group, so that we can delete them easily.
	augroup vimrcEx
au!

" For all text files set 'textwidth' to 80 characters.
autocmd FileType text setlocal textwidth=80

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
autocmd BufReadPost *
	\ if line("'\"") > 1 && line("'\"") <= line("$") |
	\   exe "normal! g`\"" |
	\ endif

	augroup END

else

	set autoindent		" always set autoindenting on

endif " has("autocmd")

if has('langmap') && exists('+langnoremap')
	" Prevent that the langmap option applies to characters that result from a
	" mapping.  If unset (default), this may break plugins (but it's backward
	" compatible).
	set langnoremap
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Autocorrectlikeness for mis-spellings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Abbreviations
abbr funciton function
abbr teh the
abbr tempalte template
abbr fitler filter

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Backup settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set backup					" Tell vim to keep a backup file
set undofile				" Tell vim to keep an undo file

silent !mkdir -p ~/tmp/vim/back
set backupdir=~/tmp/vim/back//		" Tell vim where to keep backup files

silent !mkdir -p ~/tmp/vim/swap
set dir=~/tmp/vim/swap//					" Tell vim where to keep swap files

silent !mkdir -p ~/tmp/vim/undo
set undodir=~/tmp/vim/undo//			" Tell vim where to keep undo files

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => User Interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has('mouse')
	set mouse=a
endif

syntax on					" Set syntax highlighting on
set ttyfast					" faster redrawing
set nofoldenable			" dont fold code by default
set title					" set terminal title
set wildmenu				" improve cmd line completion
set wildmode=list:longest	" Shell like file completion
set number					" Set line numbers on
set relativenumber			" Set relative line numbers on
set laststatus=2			" Always display the status line
set ruler					" show the cursor position all the time
"set cursorline				" set current line to highlight
set showmatch				" show matching braces
set mat=2					" how long to blink the matching brace (0.2s)
set wrap					" turn on line wrapping
set linebreak				" set soft wrapping
set showbreak=…				" show ellipsis at breaking
let base16colorspace=256  " Access colors present in 256 colorspace
set t_Co=256				" Tell vim the term support 256 colors
set encoding=utf8
hi CursorLineNR cterm=bold        "highlight line without underline.

" Whitespace characters visible.
set list
set listchars=eol:¬,tab:•\ ,trail:~,extends:>,precedes:<

"execute "colorscheme ".$THEME
"execute "set background=".$BACKGROUND

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => File Formatting Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set noexpandtab 			" do not translate tabs into spaces
set smarttab
set tabstop=2				" size of a hard tabstop
set shiftwidth=2			" size of an 'indent'
"set smartindent

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Search Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set ignorecase				" case insensitive search
"set smartcase				" case sensitive if there is a capital letter
set incsearch				" highlight the search term while searching
set nohlsearch				" do not keep search term highlighted

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set wildignorecase
set fileignorecase

set lazyredraw			" don't redraw while executing macros
set history=10				" keep 50 lines of command line history
set showcmd					" display incomplete commands
set ttimeoutlen=50			" Fixes a bug

"Use system clipboard
set clipboard=unnamed

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:airline_left_sep = ''
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_right_sep = ''

let g:airline#extensions#tmuxline#enabled = 1
let g:airline#extensions#tmuxline#snapshot_file = '~/.tmux/statusline-colors.conf'

let g:ctrlp_show_hidden = 1

let g:tmuxline_separators = {
	\ 'left' : '',
	\ 'left_alt': '',
	\ 'right' : '',
	\ 'right_alt' : '',
	\ 'space' : ' '}

command W w
command Q q
command Wq wq
command WQ wq

let mapleader=" "

nnoremap <leader>a :Ack 

nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
" Don't use Ex mode, use Q for formatting
map Q gq

