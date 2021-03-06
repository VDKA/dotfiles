" disable the bell
set vb t_vb=

" enable relative line numbering
set number
set relativenumber

" disable startup message
set shortmess+=I

" statusline
set laststatus=2

" auto reload changed files
set autoread

" open new split panes to right and bottom
set splitbelow
set splitright

" no cursor styling
set guicursor=

" mouse compatibility
set mouse=a

" x clipboard access
set clipboard=unnamedplus

set nofoldenable

" case-insensitive searching - case-sensitive if uppercase letters are used
set ignorecase
set smartcase

" no swapfiles
set noswapfile

" store all backup files centrally
set backupdir=$HOME/.config/nvim/tmp/backup/
if !isdirectory(expand(&backupdir))
	call mkdir(expand(&backupdir), 'p')
endif

" persistent undo
set undofile
set undodir=$HOME/.config/nvim/tmp/undo/
set undolevels=500
set undoreload=500
if !isdirectory(expand(&undodir))
	call mkdir(expand(&undodir), 'p')
endif

" Restore cursor on re-entry
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") < line("$") | exe "normal! g`\"" | endif

" don't keep commenting on enter or o/O
autocmd BufNewFile,BufRead * setlocal formatoptions-=ro
