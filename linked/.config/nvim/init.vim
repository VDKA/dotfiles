set shell=/usr/local/bin/fish
" load plugins
runtime! plugin/sensible.vim

if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

runtime! plugin/sensible.vim

call plug#begin()
" environment
Plug 'ap/vim-buftabline'               " buffer bar
Plug 'tpope/vim-commentary'            " better commenting
Plug 'junegunn/vim-easy-align'         " easy alignment
Plug 'easymotion/vim-easymotion'       " easymotion!
Plug 'tpope/vim-fugitive'              " git integration
Plug 'itchyny/lightline.vim'           " lightline
Plug 'scrooloose/nerdtree'             " filesystem browser
Plug 'mpcsh/vim-pass'                  " pass(1) helper
Plug 'tpope/vim-repeat'                " make . work for everything
Plug 'vim-scripts/replacewithregister' " replace with register
Plug 'tpope/vim-sensible'              " sensible defaults
Plug 'tpope/vim-sleuth'                " Smartly set shiftwidth and tabstop
Plug 'tpope/vim-surround'              " delimiter manipulation
Plug 'vim-scripts/visualrepeat'        " make . work for *everything* (visual mode)

" colorscheme
Plug 'morhetz/gruvbox'               " gruvbox colors
Plug 'deens/lightline_gruvbox_theme' " lightline gruvbox theme

" languages
Plug 'kai-language/vim-kai',      { 'for': 'kai'}      " kai
Plug 'fatih/vim-go',              { 'for': 'go'}       " go
Plug 'godlygeek/tabular',         { 'for': 'markdown'} " necessary for markdown
Plug 'tpope/vim-markdown',        { 'for': 'markdown'} " markdown
Plug 'keith/swift.vim',           { 'for': 'swift'}    " swift

" utilities
Plug 'wakatime/vim-wakatime'  " time tracking

call plug#end()

let g:plug_window = 'new'

