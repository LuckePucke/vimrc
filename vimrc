" vimrc

"""""""""
" Plugins

call plug#begin('$HOME/.vim/plugged')

Plug 'vim-syntastic/syntastic' " Syntax checker
Plug 'neovimhaskell/haskell-vim'
Plug 'PotatoesMaster/i3-vim-syntax'
"Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
" YCM might need more steps to install. Check out the github.

" Colorschemes
Plug 'treycucco/vim-monotonic'
Plug 'vim-scripts/Ambient-Color-Scheme'
Plug 'ErichDonGubler/vim-sublime-monokai'

call plug#end()

""""""""""""""""""
" General settings

set autoindent
set smartindent
set noexpandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set number
set relativenumber
set splitbelow
set splitright
set list
set showbreak=↪\
set clipboard=unnamedplus
set listchars=tab:\|\ ,nbsp:␣,trail:•,extends:⟩,precedes:⟨
"set listchars=tab:\|\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨
"set listchars=tab:\ \ ,nbsp:␣,trail:•,extends:⟩,precedes:⟨

""""""""""
" NETRW
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 0
let g:netrw_altv=0
nnoremap <C-o> :tabe<cr>:Exp<cr>

"""""""""""""
" Colorscheme
set termguicolors
color ambient
let g:sublimemonokai_term_italic = 1

""""""""""""
" Statusline
set laststatus =2
set statusline =
set statusline+=%L
set statusline+=%=
set statusline+=%F
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=\ \ \ \ Column\:%3c

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

""""""""""
" Keybinds

let mapleader=" "

nnoremap <leader>ev :tabe $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <F2> :lopen<cr>
nnoremap <F3> :lclose<cr>
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> :tabn<cr>
nnoremap <C-h> :tabp<cr>
nnoremap j gj
nnoremap k gk
nnoremap J 10j
nnoremap K 10k
nnoremap L 10l
nnoremap H 10h
nnoremap <F7> :tabp<cr>
nnoremap <F8> :tabn<cr>
nnoremap <leader>ef :be 
nnoremap <C-n> :tabe 



""""""""""""""
" Autocommands

" Save python with spaces insead of tabs
augroup python
	au!
	au BufReadPost,FileReadPost *.py set ts=4|set noet|retab!
	au BufWritePre,FileWritePre *.py set ts=4|set et|retab!
	au BufWritePost,FileWritePost *.py set ts=4|set noet|retab!
augroup END

"""""""""
" Scripts

" :command! -range=% -nargs=0 Tab2Space execute '<line1>,<line2>s#^\t\+#\=repeat(" ", len(submatch(0))*' . &ts . ')'
" :command! -range=% -nargs=0 Space2Tab execute '<line1>,<line2>s#^\( \{'.&ts.'\}\)\+#\=repeat("\t", len(submatch(0))/' . &ts . ')'

"""""""""""""""""
" Plugin settings

" Syntastic
nnoremap <leader>ch :SyntasticCheck<cr>:lopen<cr>
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_w = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_go_checkers = ['go']
let g:syntastic_python_checkers = ['flake8']
"let g:syntastic_haskell_checkers = []

" go.vim
augroup go
	au!
	au BufRead,BufNewFile *.go set filetype=go
augroup END

" haskell-vim
let g:haskell_enable_quantification = 1   " highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " -||- of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " -||- of `proc`
let g:haskell_enable_pattern_synonyms = 1 " -||- of `pattern`
let g:haskell_enable_typeroles = 1        " -||- of type roles
let g:haskell_enable_static_pointers = 1  " -||- of `static`
let g:haskell_backpack = 1                " -||- of backpack keywords
let g:haskell_indent_disable = 1          " disable indentations

" YCM
let g:ycm_auto_trigger = 0 " Set to 0 to only use with ctrl+space.
let g:ycm_server_python_interpreter = '/usr/bin/python'
let g:ycm_global_ycm_extra_conf = '~/.vim/global_extra_conf.py'

