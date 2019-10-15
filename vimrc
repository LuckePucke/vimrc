" vimrs

"""""""""
" Plugins

call plug#begin('$HOME/.vim/plugged')

Plug 'vim-syntastic/syntastic' " Syntax checker
Plug 'neovimhaskell/haskell-vim'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'kana/vim-textobj-user' " Dependency. For defining textobj:s
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'rust-lang/rust.vim'

" Vim language extensions
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary' " gc
Plug 'vim-scripts/ReplaceWithRegister'
" USAGE
"	[count]["x]gr{motion}   Replace {motion} text with the contents of register x.
"	                        Especially when using the unnamed register, this is
"	                        quicker than "_d{motion}P or "_c{motion}<C-R>"
"	[count]["x]grr          Replace [count] lines with the contents of register x.
"	                        To replace from the cursor position to the end of the
"	                        line use ["x]gr$
"	{Visual}["x]gr          Replace the selection with the contents of register x.
Plug 'michaeljsmith/vim-indent-object' " ii in indentation
Plug 'kana/vim-textobj-entire' " ae all entire, ie in entire (no leading trailing whitespaces)
Plug 'kana/vim-textobj-line' " al all line, il in line

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
set hidden
set showbreak=↪\
set clipboard=unnamedplus
set listchars=tab:\|\ ,nbsp:␣,trail:•,extends:⟩,precedes:⟨
"set listchars=tab:\|\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨
"set listchars=tab:\ \ ,nbsp:␣,trail:•,extends:⟩,precedes:⟨

""""""""""
" NETRW
" Vim's built in file explorer
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 0
let g:netrw_altv=0
nnoremap <C-o> :tabe<cr>:Exp<cr>

""""""""""
" NERDTree
let g:NERDTreeQuitOnOpen = 1
autocmd StdinReadPre * let s:std_in=1 
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"""""""
" ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'rc'
let g:ctrlp_root_markers = ['Makefile', '.config', '.git']
let g:ctrlp_switch_buffer = 'et'

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

" function! StatuslineGit()
" 	let l:branchname = GitBranch()
" 	return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
" endfunction

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
" nnoremap J 10j
" nnoremap K 10k
" nnoremap L 10l
" nnoremap H 10h
nnoremap <F7> :tabp<cr>
nnoremap <F8> :tabn<cr>
nnoremap <C-t> :tabe<cr>:NERDTree<cr>
nnoremap <C-n> :NERDTreeToggle<cr>

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

""""""""""""""
" Autocommands

" Save python with spaces insead of tabs
augroup etc
	au!
	" Save tabs as spaces for these filetypes
	au BufReadPost,FileReadPost *.py,*.rs,*.rlib set ts=4|set noet|retab!
	au BufWritePre,FileWritePre *.py,*.rs,*.rlib set ts=4|set et|retab!
	au BufWritePost,FileWritePost *.py,*.rs,*.rlib set ts=4|set noet|retab!
	" Mark characters past maximum per line per styleguidelines as wrong
	au BufReadPost,FileReadPost *.rs,*.rlib let w:m2=matchadd('ErrorMsg', '\%>100v.\+', -1)
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
let g:syntastic_rust_checkers = ['cargo', 'rustc']
"let g:syntastic_haskell_checkers = []
augroup syntastic
	au!
	au BufRead *.rs let g:syntastic_check_on_open = 1
	" go.vim
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

