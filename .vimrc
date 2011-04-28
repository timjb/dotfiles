" Plugin: pathogen
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Syntax Highlighting
syntax on
set background=dark
colorscheme solarized
" Highlights CSS Colors (e.g. #ff8800)
command! -nargs=* HexHighlight call HexHighlight()

" Leader key
let mapleader=","

" Enable File Type Detection & ftplugin
filetype off " Force reloading of filetypes
filetype plugin indent on

" Show hidden characters
set listchars=tab:‣\ ,eol:¬
set list

" Line numbers
set relativenumber

" Buffers
" Don't warn when switching from an unsaved buffer
set hidden

" Searching
set ignorecase
set smartcase
set hlsearch
set incsearch
nmap <silent> <leader>/ :nohlsearch<CR>

" Paths
set wildignore=*.swp,*.bak,*.pyc,*.class

" Those .swp files are annoying
set nobackup
set noswapfile

" Movement: jk move one line on the display
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

" change the terminal's title
set title

" write with root privileges
cmap w!! w !sudo tee % >/dev/null

" Plugin: haskellmode-vim
let g:haddock_browser = "/usr/bin/google-chrome"
let g:ghc = "/usr/bin/ghc"
let g:haddock_docdir = "/usr/share/doc/ghc6-doc/html/"



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

" Plugin: vim-indent-guides
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#3A3A3A ctermbg=237
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#303030 ctermbg=236
"let g:indent_guides_enable_on_vim_startup = 1

" Plugin: ZenCoding
let g:user_zen_settings={
\  'indentation' : '  '
\}



""""""""""""""
" File Types "
""""""""""""""

if has("autocmd")
  autocmd BufNewFile,BufRead *.rss,*.atom setfiletype xml
  autocmd BufNewFile,BufRead *.json       setfiletype json
  autocmd BufNewFile,BufRead *.less       setfiletype less
  autocmd BufEnter *.hs compiler ghc
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

" http://nvie.com/posts/how-i-boosted-my-vim/
function! ToggleMouse()
  if !exists("s:old_mouse")
    let s:old_mouse = "a"
  endif
  
  if &mouse == ""
    let &mouse = s:old_mouse
    echo "Mouse is for Vim (" . &mouse . ")"
  else
    let s:old_mouse = &mouse
    let &mouse=""
    echo "Mouse is for terminal"
  endif
endfunction



"""""""""""""""""""
" Wrapping        "
"""""""""""""""""""

set colorcolumn=80
" set formatoptions+=at
" http://vimcasts.org/episodes/soft-wrapping-text/
command! -nargs=* Wrap set  wrap linebreak nolist



""""""""""""""
" Leader key "
""""""""""""""

" Quickly edit/reload the .vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Plugin: vim-rails (http://github.com/tpope/vim-rails)
" goto related model/view/controller
nmap <leader>rm :Rmodel<CR>
nmap <leader>rv :Rview<CR>
nmap <leader>rc :Rcontroller<CR>

"Copy to System's pasteboard
map <leader>y "+y
"Cut to System's pasteboard
map <leader>d "+d
"Paste from System's pasteboard
map <leader>p "+p

" Plugin: Tabular (http://github.com/godlygeek/tabular)
nmap <leader>= :Tabularize /=<CR>
nmap <leader>: :Tabularize /:\zs<CR>

" CSS: Insert vendor prefixes -moz- and -webkit-
" This assumes a coding style with one line for each CSS property
nmap <leader>vp ^vf:h"pyviB:s/\v\s*\-(moz\|webkit)\-<C-r>p:.*\n//g<CR>:nohlsearch<CR><C-o>"pY"ppI-moz-<Esc>"ppI-webkit-<Esc>kk


""""""""""
" F keys "
""""""""""

" Plugin: NERDTree
map <F2> :NERDTreeToggle<CR>

set pastetoggle=<F3>
map <F4> :call ToggleMouse()<CR>
