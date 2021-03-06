" colorscheme
"set termguicolors
syntax enable
set background=dark
colorscheme gruvbox

" italic comments
hi Comment gui=italic

" closure highlighting
hi link MatchParen LinkDelimiter

" statusline
hi StatusLine gui=italic guibg=bg guifg=#928374

" visual selection
hi Visual gui=none guibg=#928374 guifg=bg

" indentation
hi SpecialKey guibg=bg guifg=#928374

" show highlighting groups for current word
nmap <C-S-s> :call <SID>SynStack()<CR>
function! <SID>SynStack()
	if !exists("*synstack")
		return
	endif
	echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunction

" search highlighting
set hlsearch

" easymotion highlighting
hi EasyMotionTarget gui=none guibg=none guifg=#fb4934
hi EasyMotionTargetDefault gui=none guibg=none guifg=#fb4934
hi EasyMotionTarget2First gui=none guibg=none guifg=#fb4934
hi EasyMotionTarget2FirstDefault gui=none guibg=none guifg=#fb4934
hi EasyMotionTarget2Second gui=none guibg=none guifg=#fb4934
hi EasyMotionTarget2SecondDefault gui=none guibg=none guifg=#fb4934
