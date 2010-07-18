""""""""""""""""""
" Basic Settings "
""""""""""""""""""

" Syntax Highlighting
syntax on
color blackboard

" Enable File Type Detection & ftplugin
filetype on
filetype plugin on

" Show hidden characters
set listchars=tab:‣\ ,eol:¬
set list

" Line numbers
set number

" Buffers
" Don't warn when switching from an unsaved buffer
set hidden



""""""""
" gVim "
""""""""

if has("gui_running")
  " No toolbar
  set guioptions-=T
endif



"""""""""""
" Windows "
"""""""""""

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l



""""""""
" Tabs "
""""""""



"""""""""""""
" Indenting "
"""""""""""""

" Set tabstop, softtabstop and shiftwidth to the same value
command! -nargs=* Stab call Stab()
function! Stab()
  let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
  if l:tabstop > 0
    let &l:sts = l:tabstop
    let &l:ts = l:tabstop
    let &l:sw = l:tabstop
  endif
  call SummarizeTabs()
endfunction

function! SummarizeTabs()
  try
    echohl ModeMsg
    echon 'tabstop='.&l:ts
    echon ' shiftwidth='.&l:sw
    echon ' softtabstop='.&l:sts
    if &l:et
      echon ' expandtab'
    else
      echon ' noexpandtab'
    endif
  finally
    echohl None
  endtry
endfunction

set noexpandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

set autoindent



"""""""""""""""""""""""""""
" Common Key Combinations "
"""""""""""""""""""""""""""

"Save with ^S
map <c-s> :w<CR>
"… without leaving insert mode
imap <c-s> <c-o><c-s>
"Copy to System's pasteboard with ^C
map <c-c> "+y
imap <c-c> <c-o><c-c>
"Cut to System's pasteboard with ^X
map <c-x> "+d
imap <c-x> <c-o><c-x>
"Paste from System's pasteboard with ^V
map <c-v> "+p
imap <c-v> <c-o><c-v>
"Select all with ^A
map <c-a> ggVG
imap <c-a> <Esc><c-a>



""""""""""""""
" File Types "
""""""""""""""

if has("autocmd")
	"autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab
	autocmd BufNewFile,BufRead *.rss,*.atom setfiletype xml
	autocmd BufNewFile,BufRead *.json       setfiletype json
endif



"""""""""""""""""
" Abbreviations "
"""""""""""""""""

"Horizontal Ellipsis
abbr ... …
"n-Dash
abbr ---  –
"My name
abbr tjb Tim Baumann



"""""""""
" Mouse "
"""""""""

:map <MiddleMouse> <Nop>
:imap <MiddleMouse> <Nop>



"""""""""""""""""""
" Custom Commands "
"""""""""""""""""""

" http://vimcasts.org/episodes/soft-wrapping-text/
command! -nargs=* Wrap set  wrap linebreak nolist
