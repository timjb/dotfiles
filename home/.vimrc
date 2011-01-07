""""""""""""""""""
" Basic Settings "
""""""""""""""""""

" Use pathogen to bundle plugins
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Syntax Highlighting
syntax on
if $COLORTERM == 'gnome-terminal'
  colorscheme railscasts
else 
  colorscheme default 
endif
" Highlights CSS Colors (e.g. #ff8800)
command! -nargs=* HexHighlight call HexHighlight()

" Leader key
let mapleader=","

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

" Searching
set ignorecase
set smartcase
set hlsearch
set incsearch
nmap <silent> ,/ :nohlsearch<CR>

" Paths
set wildignore=*.swp,*.bak,*.pyc,*.class

" All those .swp files are annoying
set nobackup
set noswapfile

" Movement: jk move one line on the display
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k


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



"""""""""""""""
" Indentation "
"""""""""""""""

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
set copyindent



"""""""""""""""""""""""""""
" Common Key Combinations "
"""""""""""""""""""""""""""

"Copy to System's pasteboard
map <leader>y "+y
"Cut to System's pasteboard
map <leader>d "+d
"Paste from System's pasteboard
map <leader>p "+p
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

map <MiddleMouse> <Nop>
imap <MiddleMouse> <Nop>
set mouse=a




"""""""""""""""""""
" Custom Commands "
"""""""""""""""""""

" http://vimcasts.org/episodes/soft-wrapping-text/
command! -nargs=* Wrap set  wrap linebreak nolist



""""""""""
" .vimrc "
""""""""""

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>



"""""""""
" Rails "
"""""""""

" Goto related model/view/controller
nmap <leader>m :Rmodel<CR>
nmap <leader>v :Rview<CR>
nmap <leader>c :Rcontroller<CR>
