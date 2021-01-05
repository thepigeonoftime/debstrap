syntax on
set formatoptions-=cro
set ic

" set noshowmode
" set noruler
set laststatus=0
" set noshowcmd
" set cmdheight=1

au FileType vim setlocal fo-=c fo-=r fo-=o

:imap jj <Esc>

let g:UltiSnipsExpandTrigger="<tab>"                                                                  
let g:UltiSnipsJumpForwardTrigger="<c-b>"                                                             
let g:UltiSnipsJumpBackwardTrigger="<c-z>"                                                            
let g:UltiSnipsListSnippets="<c-tab>"


set nocompatible              " be iMproved, required
filetype off                  " required
let g:autoswap_detect_tmux = 1

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'jacoborus/tender'

Plugin 'honza/vim-snippets'

" Plugin 'SirVer/ultisnips'

Plugin 'lokaltog/vim-powerline'

Plugin 'morhetz/gruvbox'

Plugin 'fidian/hexmode'

Plugin 'mattn/emmet-vim'

Plugin 'terryma/vim-multiple-cursors'

Plugin 'lambdalisue/suda.vim'

" Plugin 'Valloric/YouCompleteMe'

" Plugin 'gioele/vim-autoswap'

" Bundle 'altercation/vim-colors-solarized'


let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsListSnippets="<c-tab>"

" If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"
"

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
