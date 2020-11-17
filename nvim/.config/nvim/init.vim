syntax on
filetype plugin indent on
au FileType vim setlocal fo-=c fo-=r fo-=o
set formatoptions-=cro
set ic
set timeoutlen=1000 ttimeoutlen=10
set number
set mouse=a
set backspace=indent,eol,start
set hidden
set nocompatible              " be iMproved, required
set termguicolors
set tabstop=4
set showmatch
set ts=4
set sts=4
set sw=4
set autoindent
set smartindent
set smarttab
set expandtab

function! StatusbarToggle()
	if &laststatus>0
		set laststatus=0
    else
		set laststatus=2
    endif
endfunction

:imap jj <Esc>
" Toggle Nerdtree
nmap <F6> :NERDTreeToggle<CR>:<C-c>
" Toggle Airline
nmap <F7> :call StatusbarToggle()<CR>:<C-c>
" Hide syntastic
nmap <F8> :lclose<CR>:<C-c>
" Toggle Goyo
nmap <F10> :Goyo<CR>:highlight Normal guibg=#161817<CR>:<C-c>

packadd minpac
call minpac#init()

call minpac#add('k-takata/minpac', {'type': 'opt'})
"call minpac#add('valloric/youcompleteme')
call minpac#add('tpope/vim-fugitive')  " git wrapper
call minpac#add('SirVer/ultisnips')
call minpac#add('honza/vim-snippets')
call minpac#add('scrooloose/syntastic') " syntax checking
call minpac#add('scrooloose/nerdtree') " side tree
call minpac#add('bling/vim-airline')
call minpac#add('vim-airline/vim-airline-themes')
call minpac#add('flazz/vim-colorschemes')
call minpac#add('fidian/hexmode')
call minpac#add('mattn/emmet-vim')
call minpac#add('terryma/vim-multiple-cursors')
call minpac#add('lambdalisue/suda.vim')
call minpac#add('junegunn/goyo.vim')
call minpac#add('junegunn/fzf')
call minpac#add('sheerun/vim-polyglot')
" call minpac#add('jiangmiao/auto-pairs')
call minpac#add('neoclide/coc.nvim')
call minpac#add('Vimjas/vim-python-pep8-indent')
" call minpac#add('gioele/vim-autoswap') " vim swap file disable
" call minpac#add('lokaltog/vim-powerline')
" call minpac#add('tpope/vim-surround')  " auto close parentheses / quotes
" call minpac#add('ajh17/VimCompletesMe')
" call minpac#add('jesseleite/vim-agriculture') " ag / rg

""" Plugin settings
"-------------------------------

""" Minpac
:command Plug :call minpac#update()
:command Clean :call minpac#clean()
:command Status :call minpac#status()

""" Airline
let g:airline_theme='minimalist'

""" Colorschemes
colorscheme alduin
"colorscheme base16-ateliersavanna
"colorscheme Atelier_PlateauDark
highlight Normal guibg=#161817

""" Status bar
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

""" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:AutoClosePumvisible = {"ENTER": "", "ESC": ""}

""" Autowap
let g:autoswap_detect_tmux = 1

""" UltiSnips
let g:UltiSnipsExpandTrigger="<c-ö>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsListSnippets="<c-tab>"

" If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"

""" Coc.nvim
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr><Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

let g:coc_disable_startup_warning = 1

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

