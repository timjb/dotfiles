""""""""""""""""""
" Basic Settings "
""""""""""""""""""

" Use pathogen to bundle plugins
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Syntax Highlighting
syntax on
if $COLORTERM == 'gnome-terminal'
  set term=gnome-256color
  colorscheme railscasts
else 
  colorscheme default 
endif
command! -nargs=* HexHighlight call HexHighlight()


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

" Switch between windows using Ctrl and hjkl
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l



""""""""
" Tabs "
""""""""



""""""""
" Tags "
""""""""

" http://peterodding.com/code/vim/easytags/
let g:easytags_always_enabled = 1



""""""""
" Make "
""""""""

set makeprg=rake
nmap M :make<Enter>



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

set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

set autoindent



"""""""""""""""""""""""""""
" Common Key Combinations "
"""""""""""""""""""""""""""

"Copy to System's pasteboard with ^C
map <c-c> "+y
imap <c-c> <c-o><c-c>
"Cut to System's pasteboard with ^X
map <c-x> "+d
imap <c-x> <c-o><c-x>
"Paste from System's pasteboard with ^V
map <c-v> "+p
imap <c-v> <c-o><c-v>

map <F2> :NERDTreeToggle<CR>


""""""""""""""
" File Types "
""""""""""""""

if has("autocmd")
	"autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab
	autocmd BufNewFile,BufRead *.rss,*.atom    setfiletype xml
	autocmd BufNewFile,BufRead *.json          setfiletype json
	autocmd BufNewFile,BufRead *.less          setfiletype less
	autocmd BufNewFile,BufRead *.md,*.markdown setfiletype markdown
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



"""""""""""
" On Save "
"""""""""""

" Source the vimrc file after saving it (http://vimcasts.org/episodes/updating-your-vimrc-file-on-the-fly/)
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif
