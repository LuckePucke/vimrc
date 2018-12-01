"""""""""
" Plugins

call plug#begin()

Plug 'vim-syntastic/syntastic'
Plug 'raichoo/haskell-vim'

" Colorschemes
Plug 'ErichDonGubler/vim-sublime-monokai'

call plug#end()

""""""""""""""""""
" General settings

set autoindent
set smartindent
set noexpandtab
set tabstop=4
set shiftwidth=4
set number
set splitbelow
set splitright
set list!
set showbreak=↪\
set listchars=tab:\|\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨

"""""""""""""
" Colorscheme
set termguicolors
color sublimemonokai
let g:sublimemonokai_term_italic = 1

""""""""""
" Keybinds

let mapleader=","

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <F2> :lopen<cr>
nnoremap <F3> :lclose<cr>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <S-J> 20j
nnoremap <S-K> 20k
nnoremap <S-L> 10l
nnoremap <S-H> 10h

"""""""""""""""""
" Plugin settings

" Syntastic
nnoremap <F1> :SyntasticCheck<cr>
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" haskell-vim
let g:haskell_enable_quantification = 1   " highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " -||- of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " -||- of `proc`
let g:haskell_enable_pattern_synonyms = 1 " -||- of `pattern`
let g:haskell_enable_typeroles = 1        " -||- of type roles
let g:haskell_enable_static_pointers = 1  " -||- of `static`
let g:haskell_backpack = 1                " -||- of backpack keywords
let g:haskell_indent_disable = 1          " disable indentations

